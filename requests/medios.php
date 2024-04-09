<?php
require_once dirname(__DIR__) . '/config.php';
require_once(CONTROLLERS_MEDIOS);
$medioController = new MedioSController();
$resultado = $medioController->getRegistrosOrden(2);
echo json_encode(array_reverse($resultado));
