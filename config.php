<?php
/* === Configuración de constantes para acceso a la BD y otros === */

// Autenticacion para BD
define('DB_USER', "root");
define('DB', "votacion_desis_prueba");
define('HOST', "127.0.0.1");
define('PASSWORD', "");

// Rutas
define('ROOT', realpath(__DIR__));
define('MODELS', ROOT . DIRECTORY_SEPARATOR . 'models');
define('CONTROLLERS', ROOT . DIRECTORY_SEPARATOR . 'controllers');

// Rutas de models
define('MODELS_BASE', MODELS . DIRECTORY_SEPARATOR . 'Model.php');
define('MODELS_REGION', MODELS . DIRECTORY_SEPARATOR . 'RegionModel.php');

// Rutas de controllers
define('CONTROLLERS_BASE', CONTROLLERS . DIRECTORY_SEPARATOR . 'Controller.php');
define('CONTROLLERS_REGION', CONTROLLERS . DIRECTORY_SEPARATOR . 'RegionController.php');