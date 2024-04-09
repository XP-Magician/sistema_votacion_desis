<?php
require_once dirname(__DIR__) . '/config.php';
require_once(MODELS_BASE);

class MediosModel extends Model
{

    function __construct()
    {
        parent::__construct();
        $this->tabla = 'medio_informacion';
        $this->campo_pk = 'id_medio';
    }
}
