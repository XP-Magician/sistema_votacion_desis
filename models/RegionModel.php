<?php
require_once dirname(__DIR__) . '/config.php';
require_once(MODELS_BASE);

class RegionModel extends Model
{

    function __construct()
    {
        parent::__construct();
        $this->tabla = 'region';
        $this->campo_pk = 'id_region';
    }
}