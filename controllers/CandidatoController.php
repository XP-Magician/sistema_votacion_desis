<?php
require_once dirname(__DIR__) . '/config.php';
require_once(MODELS_CANDIDATO);
require_once(CONTROLLERS_BASE);

class CandidatoController extends Controller
{

    function __construct()
    {
        $model = new CandidatoModel();
        parent::__construct($model);
    }
}