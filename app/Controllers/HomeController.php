<?php

namespace App\Controllers;

use App\Models\Product as GetProducts;
use App\Models\Category as GetCategory;
use App\Models\Currency as GetCurrency;

class HomeController extends BaseController
{
	public function index($request, $response){
		// $getCurrencies = $this -> db -> table('currency') -> get();
		$orderBy_column = 'id';
		$orderBy_order = 'asc';
		$categoryPassed = '';
		$category = explode('/', $request->getAttribute('category'));
		// print_r(end($category));die;
		if(end($category) == ''){
			$getProducts = GetProducts::select('id', 'product_name', 'product_description', 'product_price', 'product_currency', 'product_category') -> orderBy($orderBy_column, $orderBy_order) -> take(6) -> get();
		} else {
			$categoryId = GetCategory::select('id', 'category_name') -> where('category_name', $category) -> first();
			// print_r(count($categoryId));die;
			if(count($categoryId) > 0){
				$getProducts = GetProducts::select('id', 'product_name', 'product_description', 'product_price', 'product_currency', 'product_category') -> where('product_category', $categoryId -> id) -> orderBy($orderBy_column, $orderBy_order) -> take(6) -> get();
				$categoryPassed = $categoryId -> category_name;
			} else {
				$getProducts = GetProducts::select('id', 'product_name', 'product_description', 'product_price', 'product_currency', 'product_category') -> where('product_category', 0) -> orderBy($orderBy_column, $orderBy_order) -> take(6) -> get();
			}
		}

		// echo "<pre>";print_r($getProducts);die;
		$getCategories = GetCategory::select('id', 'category_name') -> get();
		// echo "<pre>";var_dump($getCategories);
		// die();
		$currency_symbol = '₹';
		$currency_shortcode = $this -> getCurrencyCode();
		$get_currency_symbol = GetCurrency::where(array('code' => $currency_shortcode)) -> first();
		if(!empty($get_currency_symbol)){
			$currency_symbol = $get_currency_symbol -> symbol;
		}
		// echo "<pre>";print_r($currency_symbol);die;
		return $this -> view -> render($response, 'index.twig', ['categories' => $getCategories, 'products' => $getProducts, 'category_passed' => $categoryPassed, 'currency_shortcode' => $currency_shortcode, 'currency_symbol' => $currency_symbol]);
	}

	public function shop($request, $response){

		// echo "<pre>";print_r(!empty($request->getParam('sort_by'))); die;
		$category = '';
		if(!empty($request -> getParam('category'))){
			$category = $request -> getParam('category');
		}
		// echo "Cats: ".$category;die;

		$orderBy_column = 'id';
		$orderBy_order = 'asc';
		if(!empty($request -> getParam('orderType'))){
				if(trim($request -> getParam('orderType')) == 'oldest'){
						$orderBy_column = 'id';
						$orderBy_order = 'asc';
				} else if(trim($request -> getParam('orderType')) == 'date'){
						$orderBy_column = 'id';
						$orderBy_order = 'desc';
				} else if(trim($request -> getParam('orderType')) == 'priceAsc'){
						$orderBy_column = 'product_price';
						$orderBy_order = 'asc';
				} else if(trim($request -> getParam('orderType')) == 'priceDesc'){
						$orderBy_column = 'product_price';
						$orderBy_order = 'desc';
				}
		}

		$set_products = array();
		if($category == ''){
			$get_products = GetProducts::select('id', 'product_name', 'product_description', 'product_price', 'product_currency', 'product_category') -> orderBy($orderBy_column, $orderBy_order) -> take(6) -> get();
		} else {
			$categoryId = GetCategory::select('id') -> where('category_name', $category) -> first();
			// print_r(count($categoryId));die;
			if(count($categoryId) > 0){
				$get_products = GetProducts::select('id', 'product_name', 'product_description', 'product_price', 'product_currency', 'product_category') -> where('product_category', $categoryId -> id) -> orderBy($orderBy_column, $orderBy_order) -> get(5);
			} else {
				$get_products = GetProducts::select('id', 'product_name', 'product_description', 'product_price', 'product_currency', 'product_category') -> where('product_category', 0) -> orderBy($orderBy_column, $orderBy_order) -> get(5);
			}
		}

		$currency_symbol = '';
		$getCurrency = GetCurrency::where('code', $request -> getParam('symbol')) -> first();
		if(!empty($getCurrency)){
			$currency_symbol = $getCurrency -> symbol;
		}

		// echo "<pre>";print_r(count($get_products)); die;
		if(count($get_products) > 0){
				$count_key = 0;
				foreach ($get_products as $key => $value) {
						// if both are null
						$rate = $value -> product_price / $request -> getParam('currency');
						$set_products[$count_key]['id'] = $value -> id;
						$set_products[$count_key]['name'] = $value -> product_name;
						$set_products[$count_key]['price'] = number_format((float)$rate, 2, '.', '');
						$set_products[$count_key]['long_description'] = $value -> product_description;
						$set_products[$count_key]['product_currency'] = $value -> product_currency;
						$set_products[$count_key]['currency_symbol'] = $currency_symbol;
						$count_key++;
				}
		}
		// $set_products = array();
		// echo "<pre>";print_r($set_products); die;

		return $response->withJson(['error' => false, 'success' => true, 'message' => 'Details found...', 'all_products' => $set_products], 200);
	}

	public function productPopup($request, $response){
			$input['productId'] = $request -> getParam('productId');
			// print_r($input); die;
			$currency_symbol = '';
			$getCurrency = GetCurrency::where('code', $request -> getParam('currency_symbol')) -> first();
			if(!empty($getCurrency)){
				$currency_symbol = $getCurrency -> symbol;
			}

			if(isset($input['productId'])){
					$set_product = array();
					$get_product_detail = GetProducts::select('id', 'product_name', 'product_description', 'product_price', 'product_currency', 'product_category') -> where(array('id' => $input['productId'])) -> first();

					if(!empty($get_product_detail)){
							$set_product['id'] = $get_product_detail -> id;
							$set_product['name'] = $get_product_detail -> product_name;
							$rate = $get_product_detail -> product_price / $request -> getParam('currency_rate');
							// $product_price = (int) round($get_product_detail -> product_price);
							$product_price = number_format((float)$rate, 2, '.', '');
							$set_product['price'] = $product_price;
							$set_product['long_description'] = $get_product_detail -> product_description;
							$set_product['product_currency'] = $get_product_detail -> product_currency;
							$set_product['currency_symbol'] = $currency_symbol;

							return $response->withJson(['error' => false, 'success' => true, 'message' => 'Details found...', 'get_product_details' => $set_product], 200);

					} else {
							return $response->withJson(['error' => true, 'success' => false, 'message' => 'No details found...'], 400);
					}
			} else {
					return $response->withJson(['error' => true, 'success' => false, 'message' => 'Invalid index...'], 400);
			}
	}

	public function getCurrencyCode() {
		//	Function to get country code using IP
		// return $this -> ip_info($_SERVER["REMOTE_ADDR"], "Location");
		$get_remote_ip_info = $this -> ip_info($_SERVER["REMOTE_ADDR"], "Location");

		$country_currency = GetCurrency::where(array('country' => $get_remote_ip_info['country_code'])) -> first();
		// print_r($country_currency);
		if (!empty($country_currency)) {
			$currency_code = $country_currency -> currency;
		} else {
			$currency_code = 'INR';
		}

		$user_currency = $currency_code;

		return $user_currency;
	}

	public function ip_info($ip = NULL, $purpose = "location", $deep_detect = TRUE) {
		$output = NULL;
		if (filter_var($ip, FILTER_VALIDATE_IP) === FALSE) {
			$ip = $_SERVER["REMOTE_ADDR"];
			if ($deep_detect) {
				if (filter_var(@$_SERVER['HTTP_X_FORWARDED_FOR'], FILTER_VALIDATE_IP))
					$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
				if (filter_var(@$_SERVER['HTTP_CLIENT_IP'], FILTER_VALIDATE_IP))
					$ip = $_SERVER['HTTP_CLIENT_IP'];
			}
		}
		$purpose = str_replace(array("name", "\n", "\t", " ", "-", "_"), NULL, strtolower(trim($purpose)));
		$support = array("country", "countrycode", "state", "region", "city", "location", "address");
		$continents = array("AF" => "Africa", "AN" => "Antarctica", "AS" => "Asia", "EU" => "Europe", "OC" => "Australia (Oceania)", "NA" => "North America", "SA" => "South America");
		if (filter_var($ip, FILTER_VALIDATE_IP) && in_array($purpose, $support)) {
			$ipdat = @json_decode(file_get_contents("http://www.geoplugin.net/json.gp?ip=" . $ip));
			if (@strlen(trim($ipdat -> geoplugin_countryCode)) == 2) {
				switch ($purpose) {
					case "location" :
						$output = array("city" => @$ipdat -> geoplugin_city, "state" => @$ipdat -> geoplugin_regionName, "country" => @$ipdat -> geoplugin_countryName, "country_code" => @$ipdat -> geoplugin_countryCode, "continent" => @$continents[strtoupper($ipdat -> geoplugin_continentCode)], "continent_code" => @$ipdat -> geoplugin_continentCode);
						break;
					case "address" :
						$address = array($ipdat -> geoplugin_countryName);
						if (@strlen($ipdat -> geoplugin_regionName) >= 1)
							$address[] = $ipdat -> geoplugin_regionName;
						if (@strlen($ipdat -> geoplugin_city) >= 1)
							$address[] = $ipdat -> geoplugin_city;
						$output = implode(", ", array_reverse($address));
						break;
					case "city" :
						$output = @$ipdat -> geoplugin_city;
						break;
					case "state" :
						$output = @$ipdat -> geoplugin_regionName;
						break;
					case "region" :
						$output = @$ipdat -> geoplugin_regionName;
						break;
					case "country" :
						$output = @$ipdat -> geoplugin_countryName;
						break;
					case "countrycode" :
						$output = @$ipdat -> geoplugin_countryCode;
						break;
				}
			}
		}
		return $output;
	}
}

?>