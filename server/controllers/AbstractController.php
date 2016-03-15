<?php

	abstract class AbstractController {
		
		public $result = 'unknown';
		public $error = false;
		public $errorMessage = false;
		public $resultCount = 0;
		public $imageCount = 0;
		public $resource = 'undefined';
		
		
		public function setResult($result) 
		{
			$this->result = $result;
			$this->resultCount = count($result);
		}
		
		public function getError() 
		{
			if ($this->error !== false) {
				return $this->errorMessage;
			} else {
				return false;
			}
		}
		
		public function setError($isError, $errorMessage) 
		{
			if ($isError === true) {
				$this->error = true;
				if (isset($errorMessage)) {
					$this->errorMessage = $errorMessage;
				} else {
					$this->errorMessage = 'Unknown Error';
				}
			}
		}
		
		public function getResult() {
			
			$result = 
				[
					'error' => $this->getError(),
					'errorMessage' => $this->errorMessage,
					'result' => $this->result,
					'count' => $this->resultCount,
					'imageCount' => $this->imageCount,
					'resource' => $this->resource
				];
            return $result;
		}
	}