<?php

	class WorkController extends AbstractController{
		
		public $model;
		
		public function __construct() {
			$this->model = new WorkModel();
			$this->resource = 'work';
		}
		
		public function getAction($request) 
		{
			if (isset($request->url_elements[2])) {
					// something
				if (isset($request->url_elements[3])) {
					// something 2
				}
			} else {
				$this->setResult($this->model->getWork());
				$this->imageCount = $this->model->imageCount;
			}
			return $this->getResult();
		}
		
		public function postAction() 
		{
			
		}
	}