<?php

namespace Framework;

use App\controllers\ErrorController;

class Router
{
    protected $routes = [];



    /**
     * Add a new route
     * 
     * 
     * 
     * @param string $method
     * @param string $uri
     * @param string $action
     * @return void 

     */

    public function resgisterRoute($method, $uri, $action)
    {


        list($controller, $controllerMethod) = explode('@', $action);

        $this->routes[] = [
            'method' => $method,
            'uri' => $uri,
            'controller' => $controller,
            'controllerMethod' => $controllerMethod
        ];
    }


    /**
     * Add a GET route
     * 
     * 
     * 
     * @param string $uri
     * @param string $controller
     * @return void 
     */

    public function get($uri, $controller)
    {
        $this->resgisterRoute('GET', $uri, $controller);
    }




    /**
     * Add a POST route
     * 
     * 
     * 
     * @param string $uri
     * @param string $controller
     * @return void 
     */

    public function post($uri, $controller)
    {
        $this->resgisterRoute('POST', $uri, $controller);
    }



    /**
     * Add a PUT route
     * 
     * 
     * 
     * @param string $uri
     * @param string $controller
     * @return void 
     */

    public function put($uri, $controller)
    {
        $this->resgisterRoute('PUT', $uri, $controller);
    }




    /**
     * Add a DELETE route
     * 
     * 
     * 
     * @param string $uri
     * @param string $controller
     * @return void 
     */

    public function delete($uri, $controller)
    {
        $this->resgisterRoute('DELETE', $uri, $controller);
    }




    /**
     * Route the request
     * 
     * 
     * @param string $uri
     * @param string $method
     * @return void
     * 
     */


    public function route($uri)

    {
        $requestMethod = $_SERVER['REQUEST_METHOD'];


        // Check for _method input

        if ($requestMethod === 'POST' && isset($_POST['_method'])) {

            // Override the request method with the value of _method


            $requestMethod = strtoupper($_POST['_method']);
        }





        foreach ($this->routes as $route) {

            // Sply the current  URI into  segments 
            $uriSegments = explode('/', trim($uri, '/'));


            // Split the route URI into segments 
            $routeSegments = explode('/', trim($route['uri'], '/'));


            $match = true;


            // Check if the number of segments matches 

            if (count($uriSegments) === count($routeSegments) && strtoupper(
                $route['method'] === $requestMethod
            )) {

                $params = [];

                $match = true;


                for ($i = 0; $i < count($uriSegments); $i++) {

                    // If URI's do not match and there is  no param
                    if ($routeSegments[$i] !== $uriSegments[$i] && !preg_match('/\{(.+?)\}/', $routeSegments[$i])) {
                        $match = false;
                        break;
                    }

                    //Check for the param and add to $params array

                    if (preg_match('/\{(.+?)\}/', $routeSegments[$i], $matches)) {

                        $params[$matches[1]] = $uriSegments[$i];
                    }
                }

                if ($match) {
                    // Extract controller and controller method
                    $controller = 'App\\Controllers\\' . $route['controller'];
                    $controllerMethod = $route['controllerMethod'];


                    // Instantiate the controller and call the method
                    $controllerInstance = new $controller();
                    $controllerInstance->$controllerMethod($params);
                    return;
                }
            }




            // if ($route['uri'] === $uri && $route['method'] === $method) {

            //     // Extract controller and controller method
            //     $controller = 'App\\Controllers\\' . $route['controller'];
            //     $controllerMethod = $route['controllerMethod'];


            //     // Instantiate the controller and call the method
            //     $controllerInstance = new $controller();
            //     $controllerInstance->$controllerMethod();
            //     return;
            // }
        }


        ErrorController::notFound();
    }
}
