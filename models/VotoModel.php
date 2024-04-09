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

    function recuperarVotos()
    {
        try {
            $sql =
                "
            SELECT 
                v.rut_voto, 
                v.nombre_votante, 
                v.alias, 
                v.correo,
                r.nombre_region, 
                c.nombre_comuna,
                ca.nombre_candidato,
                m.nombre_medio,
                v.fecha_voto FROM voto AS v 
                JOIN comuna AS c ON v.id_comuna = c.id_comuna 
                JOIN region AS r ON c.id_region = r.id_region
                JOIN candidato AS ca ON v.id_candidato = ca.id_candidato
                JOIN medio_informacion AS m ON v.id_medio_informacion = m.id_medio
            
            ";
            $query =  $this->conexion->prepare($sql);
            $query->execute();
            $result = $query->fetchAll(PDO::FETCH_ASSOC);
            return $result;
        } catch (PDOException $e) {
            die($e->getMessage());
        }
    }
}
