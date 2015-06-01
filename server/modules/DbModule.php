<?php
	
	class DbModule extends AbstractModule 
	{
		
		protected $dbPassword;
		protected $dbUser;
		protected $dbHost;
		public $result;
		protected $mysqli;
		
		public function __construct($defaults) 
		{
			if ($defaults === true) {
				$this->setDefaults(1);
			}
			
			$this->mysqli = new mysqli($this->dbHost, $this->dbUser, $this->dbPassword, $this->dbName);
			if (mysqli_connect_errno()) {
				printf("Connect failed: %s\n", mysqli_connect_error());
				exit();
			}
		}
		
		public function setDefaults($no) {
			global $settings;
			$this->dbPassword = $settings[$no]['mysql_password'];
			$this->dbName = $settings[$no]['mysql_database'];
			$this->dbUser = $settings[$no]['mysql_user'];
			$this->dbHost = $settings[$no]['mysql_host'];
		}
		
		public function query($query) {
			$this->result = $this->mysqli->query($query);
			return $this->result;
		}
		
		public function addToResult($row, $key, $value) 
		{
			if (isset($this->result)) {
				$this->result[$row][$key] = $value;
			}
		}
		
		public function affectedRows() {
			return $this->mysqli->affected_rows;
		}
		
		public function getResult() {
			//$this->mysqli->close();
			$result = [];
			if ($this->result) {
				while ($row = $this->result->fetch_assoc()) {
					$result[] = $row;
				}
			}
			return $result;
		}
	}