<?php
	
	spl_autoload_register('apiAutoload');
	include 'settings.php';
	function apiAutoload($classname) {
		if (preg_match('/[a-zA-Z]+Controller$/', $classname)) {
			if (file_exists(__DIR__ . '/controllers/' . $classname . '.php')) {
				include __DIR__ . '/controllers/' . $classname . '.php';
				return true;
			}
        } elseif (preg_match('/[a-zA-Z]+Model$/', $classname)) {
			if (file_exists(__DIR__ . '/models/' . $classname . '.php')) {
				include __DIR__ . '/models/' . $classname . '.php';
				return true;
			} 
		} elseif (preg_match('/[a-zA-Z]+View$/', $classname)) {
			if (file_exists(__DIR__ . '/views/' . $classname . '.php')) {
				include __DIR__ . '/views/' . $classname . '.php';
				return true;
			}
		} elseif (preg_match('/[a-zA-Z]+Module$/', $classname)) {
			if (file_exists(__DIR__ . '/modules/' . $classname . '.php')) {
				include __DIR__ . '/modules/' . $classname . '.php';
				return true;
			}
		} elseif (preg_match('/[a-zA-Z]+Item$/', $classname)) {
			if (file_exists(__DIR__ . '/items/' . $classname . '.php')) {
				include __DIR__ . '/items/' . $classname . '.php';
				return true;
			}
		}
	}
	
	$request = new Request();
	
	$controller_name = ucfirst($request->url_elements[1]) . 'Controller';
	if (class_exists($controller_name)) {
		$controller = new $controller_name();
		$action_name = strtolower($request->request_method) . 'Action';
		$result = $controller->$action_name($request);
			
	} else {
		$result = ['error' => true, 'errorMessage' => 'Wrong URI'];
	} 
	
	$view_name = ucfirst($request->format) . 'View';
	$view = new $view_name();
	$view->render($result);		
			
	class Request {
		
		public $url_elements;
		public $request_method;
		public $parameters;
		public $format;
		
		public function __construct() {
			$this->format = 'json';
			if (isset($this->parameters['format'])) {
				$this->format = $this->parameters['format'];
			}
			$this->request_method = $_SERVER['REQUEST_METHOD'];
			$this->passIncomingParams();
			if (isset($_SERVER['PATH_INFO'])) {
				$this->url_elements = explode('/',$_SERVER['PATH_INFO']);
			} else {
				$this->url_elements = false;
			}
			
			 return true;
		}
		
		public function passIncomingParams() {
			
			$parameters = [];
			
			if (isset($_SERVER['QUERY_STRING'])) {
				parse_str($_SERVER['QUERY_STRING'], $parameters);
			}
			
			$body = file_get_contents('php://input');
			$content_type = false;
			if (isset($_SERVER['CONTENT_TYPE'])) {
				$conent_type = $_SERVER['CONTENT_TYPE'];
			}
			
			switch ($content_type) {
				case "application/json":
					$body_params = json_decode($body);
					if ($body_params) {
						foreach ($body_params as $param_name => $param_value) {
							$parameters[$param_name] = $param_value;
						}
					}
					$this->format = 'json';
					break;
				default:
					break;
			}
			
			$this->parameters = $parameters;
		}
	}
	
	