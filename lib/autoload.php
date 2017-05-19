<?php

include 'Config.php';
spl_autoload_register('autoload');
function autoload($classname) {
    if (file_exists(Config::$mainPath.'/lib/' . $classname . '.php')) {
        include Config::$mainPath. '/lib/' . $classname . '.php';
        return true;
    } return true;
}
