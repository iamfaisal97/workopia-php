<?php

namespace Framework;

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
     * @param string $controller 
     * @return void 

     */

    public function resgisterRoute($method, $uri, $controller)
    {

        $this->routes[] = [
            'method' => $method,
            'uri' => $uri,
            'controller' => $controller
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
     * Load error page 
     * 
     * @param int $httpCode
     * @return void 
     * 
     */

    public function error($httpCode = 404)
    {
        http_response_code($httpCode);
        loadView("error/{$httpCode}");
        exit;
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


    public function route($uri, $method)
    {
        foreach ($this->routes as $route) {
            if ($route['uri'] === $uri && $route['method'] === $method) {

                require basePath('App/' . $route['controller']);
                return;
            }
        }


        $this->error();
    }
}
