<?php
require_once dirname(__DIR__) . '/config.php';
require_once(MODELS_MEDIOS);
require_once(CONTROLLERS_BASE);

class MediosController extends Controller
{

    function __construct()
    {
        $model = new MediosModel();
        parent::__construct($model);
    }
}
