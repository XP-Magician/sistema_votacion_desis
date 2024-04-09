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

    function addVoto($array_asoc)
    {
        try {
            $query = $this->conexion->prepare('INSERT INTO ' . $this->tabla . ' 
            (rut_voto, nombre_votante, alias, correo, id_comuna, id_candidato, id_medio_informacion) 
            VALUES (:r,:n,:al,:cor,:idc,:idca,:idm)');
            $query->bindValue(":r", $array_asoc["rut_voto"]);
            $query->bindValue(":n", $array_asoc["nombre_votante"]);
            $query->bindValue(":al", $array_asoc["alias"]);
            $query->bindValue(":cor", $array_asoc["correo"]);
            $query->bindValue(":idc", $array_asoc["id_comuna"]);
            $query->bindValue(":idca", $array_asoc["id_candidato"]);
            $query->bindValue(":idm", $array_asoc["id_medio_informacion"]);
            $query->execute();
            return true;
        } catch (PDOException $e) {
            return false;
        }
    }
}
