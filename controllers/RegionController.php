<?php
require_once dirname(__DIR__) . '/config.php';
require_once(MODELS_REGION);
require_once(CONTROLLERS_BASE);

class RegionController extends Controller
{

    function __construct()
    {
        $model = new RegionModel();
        parent::__construct($model);
    }
}