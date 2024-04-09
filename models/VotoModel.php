<?php
require_once dirname(__DIR__) . '/config.php';
require_once(MODELS_BASE);

class VotoModel extends Model
{

    function __construct()
    {
        parent::__construct();
        $this->tabla = 'voto';
        $this->campo_pk = 'rut_voto';
    }

    function setCampoBusqueda($nombre)
    {
        $this->campo_pk = $nombre;
    }
}
