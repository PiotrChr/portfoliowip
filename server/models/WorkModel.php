<?php

	class WorkModel extends MainModel {
		
		public $db;
		public $imageCount;
		
		public function __construct() {
			$this->db = new DbModule(true);
			
		}
		
		public function getWork($filter = '', $limit = '') {
			$this->db->query('select * from work ');
			$work = $this->db->getResult();
			$this->db->query('select * from images');
			$images = $this->db->getResult();
			
			foreach ($work as &$workItem) {
				$workItem['images'] = [];
				foreach ($images as $image) {
					if ($workItem['id'] === $image['workId']) {
						$workItem['images'][] = $image;
						$this->imageCount ++;
					}
				}
			}
			return $work;
		}
	}