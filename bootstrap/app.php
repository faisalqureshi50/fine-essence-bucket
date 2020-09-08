<?php
  use Slim\App;
  use Slim\Views\Twig;
  use Slim\Views\TwigExtension;

session_start();

  require __DIR__ . '/../vendor/autoload.php';

  $app = new App([
    'settings' => [
      'displayErrorDetails' =>  true,
      'db' => [
        'driver' => 'mysql',
        'host' => 'localhost',
        'database' => 'sale_basket',
        'username' => 'root',
        'password' => '',
        'charset' => 'utf8',
        'collation' => 'utf8_unicode_ci',
        'prefix' => '',
      ]
    ]
  ]);

  $container = $app -> getContainer();

  $capsule = new \Illuminate\Database\Capsule\Manager;
  $capsule->addConnection($container['settings']['db']);
  $capsule->setAsGlobal();
  $capsule->bootEloquent();

  $container['db'] = function($container) use($capsule) {
    return $capsule;
  };

  $container['view'] = function($container){
    $view = new Twig(__DIR__ . '/../resources/views', [
      'cache' => false,
    ]);

    $view -> addExtension(new TwigExtension(
      $container -> router,
      $container -> request -> getUri()
    ));

    return $view;
  };

  $container['HomeController'] = function($container){
    return new \App\Controllers\HomeController($container);
  };

  require __DIR__ . '/../app/routes.php';
?>