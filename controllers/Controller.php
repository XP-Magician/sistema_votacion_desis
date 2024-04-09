<?php

class Controller

{
    protected $model;

    function __construct($model)
    {
        $this->model = $model;
    }

    function getRegistros()
    {
        return $this->model->getRegistros();
    }

    function getRegistrosOrden($tipo)
    {
        return $this->model->getRegistros($tipo);
    }

    function getRegistro($valorClave)
    {
        return $this->model->getRegistro($valorClave);
    }
}
