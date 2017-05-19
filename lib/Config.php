<?php

class Config {
    public static $mainPath = '.';
    public static $domainAddress = 'http://portfolio/';
    public static $debug = 1;

    public static function debug() {
        if (self::$debug) {
            ini_set('display_errors', 1);
            ini_set('display_startup_errors', 1);
            error_reporting(E_ALL);
        }
    }
}