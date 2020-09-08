<?php

namespace App\Controllers;

use App\Models\Product as GetProducts;
use App\Models\Category as GetCategory;

class HomeController extends BaseController
{
	public function index($request, $response){
		// $getCurrencies = $this -> db -> table('currency') -> get();
		$getProducts = GetProducts::select('id', 'product_name', 'product_description', 'product_price', 'product_currency', 'product_category') -> get();
		// echo "<pre>";var_dump($getProducts);
		$getCategories = GetCategory::select('id', 'category_name') -> get();
		// echo "<pre>";var_dump($getCategories);
		// die();
		return $this -> view -> render($response, 'index.twig', ['categories' => $getCategories, 'products' => $getProducts]);
	}
}

?>