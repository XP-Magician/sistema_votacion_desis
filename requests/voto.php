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
    echo json_encode($resultado);
}

//GET
else if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $controller_voto = new VotoController();
    if (isset($_GET["alias"])) echo json_encode($controller_voto->getByAlias($_GET["alias"]));
    elseif (isset($_GET["rut"])) echo json_encode($controller_voto->getByRut($_GET["rut"]));
    elseif (isset($_GET["correo"])) echo json_encode($controller_voto->getByCorreo($_GET["correo"]));
    elseif (isset($_GET["full"])) echo json_encode($controller_voto->getVotos());
}
