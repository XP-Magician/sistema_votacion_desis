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

    function getRegistro($valorClave)
    {
        return $this->model->getRegistro($valorClave);
    }
}