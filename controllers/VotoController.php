<?php
require_once dirname(__DIR__) . '/config.php';
require_once(MODELS_VOTO);
require_once(CONTROLLERS_BASE);

class VotoController extends Controller
{

    function __construct()
    {
        $model = new VotoModel();
        parent::__construct($model);
    }

    function getByRut($rut)
    {
        $this->model->setCampoBusqueda('rut_voto');
        return $this->model->getRegistro($rut);
    }

    function getByCorreo($correo)
    {
        $this->model->setCampoBusqueda('correo');
        return $this->model->getRegistro($correo);
    }

    function getByAlias($alias)
    {
        $this->model->setCampoBusqueda('alias');
        return $this->model->getRegistro($alias);
    }

    function addVoto($array_asoc)
    {
        return  $this->model->addVoto($array_asoc);
    }

    function getVotos()
    {
        return $this->model->recuperarVotos();
    }
}
