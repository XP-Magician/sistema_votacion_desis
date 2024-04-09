<?php
require_once dirname(__DIR__) . '/config.php';
require_once(MODELS_BASE);

class ComunaModel extends Model
{

    function __construct()
    {
        parent::__construct();
        $this->tabla = 'comuna';
        $this->campo_pk = 'id_region';
    }
}