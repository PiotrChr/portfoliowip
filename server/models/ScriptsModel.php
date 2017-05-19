<?php

	class ScriptsModel extends MainModel {
		
		public $db;
		
		public function __construct() {
			$this->db = new DbModule(true);
			
		}
		
		public function getScripts($filter = '', $limit = '') {
			$this->db->query('select * from scripts ');
			$scripts = $this->db->getResult();
			return $scripts;
		}
	}