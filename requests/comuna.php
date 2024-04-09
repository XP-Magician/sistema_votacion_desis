<?php
$id_region = $_GET["id_region"];
if (isset($id_region)) {
    require_once dirname(__DIR__) . '/config.php';
    require_once(CONTROLLERS_COMUNA);
    $comunaController = new ComunaController();
    $resultado = $comunaController->getRegistro($id_region);
    echo json_encode($resultado);
}