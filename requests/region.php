<?php
require_once dirname(__DIR__) . '/config.php';
require_once(CONTROLLERS_REGION);
$regionController = new RegionController();
$resultado = $regionController->getRegistros();
echo json_encode($resultado);