<?php
require_once dirname(__DIR__) . '/config.php';
require_once(MODELS_COMUNA);
require_once(CONTROLLERS_BASE);

class ComunaController extends Controller
{

    function __construct()
    {
        $model = new ComunaModel();
        parent::__construct($model);
    }
}