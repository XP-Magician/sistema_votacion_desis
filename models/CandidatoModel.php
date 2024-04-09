<?php
require_once dirname(__DIR__) . '/config.php';
require_once(MODELS_BASE);

class CandidatoModel extends Model
{

    function __construct()
    {
        parent::__construct();
        $this->tabla = 'candidato';
        $this->campo_pk = 'id_candidato';
    }
}