<?php

  $app -> any('/filter', 'HomeController:shop');
  $app -> any('/product-popup', 'HomeController:productPopup');
  $app -> get('/[{category:.*}]', 'HomeController:index');

?>