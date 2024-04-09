<?php
require_once dirname(__DIR__) . '/config.php';
require_once(CONTROLLERS_CANDIDATO);
$candidatoController = new CandidatoController();
$resultado = $candidatoController->getRegistros();
echo json_encode($resultado);