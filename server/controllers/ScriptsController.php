<?php

	class ScriptsController extends AbstractController{
		
		public $model;
		
		public function __construct() {
			$this->model = new ScriptsModel();
			$this->resource = 'scripts';
		}
		
		public function getAction($request) 
		{
			if (isset($request->url_elements[2])) {
					// something
				if (isset($request->url_elements[3])) {
					// something 2
				}
			} else {
				$this->setResult($this->model->getScripts());
			}
			return $this->getResult();
		}
		
		public function postAction() 
		{
			
		}
	}