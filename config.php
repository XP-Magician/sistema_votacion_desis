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
define('MODELS_COMUNA', MODELS . DIRECTORY_SEPARATOR . 'ComunaModel.php');
define('MODELS_CANDIDATO', MODELS . DIRECTORY_SEPARATOR . 'CandidatoModel.php');
define('MODELS_MEDIOS', MODELS . DIRECTORY_SEPARATOR . 'MediosModel.php');
define('MODELS_VOTO', MODELS . DIRECTORY_SEPARATOR . 'VotoModel.php');

// Rutas de controllers
define('CONTROLLERS_BASE', CONTROLLERS . DIRECTORY_SEPARATOR . 'Controller.php');
define('CONTROLLERS_REGION', CONTROLLERS . DIRECTORY_SEPARATOR . 'RegionController.php');
define('CONTROLLERS_COMUNA', CONTROLLERS . DIRECTORY_SEPARATOR . 'ComunaController.php');
define('CONTROLLERS_CANDIDATO', CONTROLLERS . DIRECTORY_SEPARATOR . 'CandidatoController.php');
define('CONTROLLERS_MEDIOS', CONTROLLERS . DIRECTORY_SEPARATOR . 'MediosController.php');
define('CONTROLLERS_VOTO', CONTROLLERS . DIRECTORY_SEPARATOR . 'VotoController.php');
