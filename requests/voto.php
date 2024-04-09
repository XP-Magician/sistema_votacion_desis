<?php
require_once dirname(__DIR__) . '/config.php';
require_once(CONTROLLERS_VOTO);
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $controller_voto = new VotoController();
    $voto_info = [
        "rut_voto" => $_POST["rut"],
        "correo" => $_POST["correo"],
        "nombre_votante" => $_POST["campo_nombre"],
        "alias" => $_POST["alias"],
        "id_comuna" => $_POST["comuna"],
        "id_candidato" => $_POST["candidato"],
        "id_medio_informacion" => $_POST["medio_comunicacion"][0]
    ];
    $resultado = $controller_voto->addVoto($voto_info);
    echo json_encode(["resultado" => $resultado]);
}
