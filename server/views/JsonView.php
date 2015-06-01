<?php

	class JsonView extends MainView {
		
		public function render($content) {
            header('Content-Type: application/json; charset=utf8');
			$json = json_encode($content);
            if ($json !== false) {
                echo $json;
            } else {
                echo 'json_encode failure';
            }
		}
	}
	