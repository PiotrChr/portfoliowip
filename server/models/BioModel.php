<?php

	class BioModel extends MainModel {
		
		public $db;

		public function __construct() {
			$this->db = new DbModule(true);
			
		}
		
		public function getBio($filter = '', $limit = '') {
            $this->db->query('SELECT * FROM bio '.$filter.$limit);
            return $this->db->getResult();
		}
	}