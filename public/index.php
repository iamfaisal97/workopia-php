<?php

require __DIR__ . '/../vendor/autoload.php';

require '../helpers.php';

use Framework\Router;


// Autoloader - allows as many classses as you want so you does not need to require them individually
// spl_autoload_register(function ($class) {
//     $path = basePath('Framework/' . $class . '.php');
//     if (file_exists($path)) {
//         require $path;
//     }
// });



// Instantiate the roouter 
$router = new Router();

// Get Routes
$routes = require basePath('routes.php');


// Get current URI and HTTP Method
$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);


// Route the request
$router->route($uri);
