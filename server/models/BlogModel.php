<?php

	class BlogModel extends MainModel {
		
		public $db;
		
		public function __construct() {
			$this->db = new DbModule(true);
			
		}
		
		public function getBlog($filter = '', $limit = '') {
			$this->db->query('SELECT * FROM blog '.$filter.$limit);
			return $this->db->getResult();
		}
	}