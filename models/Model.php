<?php
// Requerir constantes de configuracion
require_once dirname(__DIR__) . '/config.php';
class Model
{
    protected $conexion;
    protected $tabla;
    protected $campo_pk;

    private function conectarDb()
    {
        if ($this->conexion == null) {
            try {
                $this->conexion = new PDO("mysql:host=" . HOST . ";charset=utf8;dbname=" . DB, DB_USER, PASSWORD);
                $this->conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            } catch (PDOException $exception) {
                die($exception->getMessage());
            }
        }
    }

    function __construct()
    {
        $this->conectarDb();
    }

    function getRegistros()
    {
        try {
            $query =  $this->conexion->prepare('SELECT * FROM ' . $this->tabla);
            $query->execute();
            $result = $query->fetchAll(PDO::FETCH_ASSOC);
            return $result;
        } catch (PDOException $e) {
            die($e->getMessage());
        }
    }

    function getRegistrosOrden($tipo)
    {
        try {
            $tipo = $tipo == 1 ? 'ASC' : 'DESC';
            $query = $this->conexion->prepare('SELECT * FROM ' . $this->tabla . ' ORDER BY ' . $this->campo_pk . ' ASC');
            $query->execute();
            $result = $query->fetchAll(PDO::FETCH_ASSOC);
            return $result;
        } catch (PDOException $e) {
            die($e->getMessage());
        }
    }

    function getRegistro($valor_pk)
    {
        try {
            $query =  $this->conexion->prepare('SELECT * FROM ' . $this->tabla . ' WHERE ' . $this->campo_pk . ' = :pk');
            $query->bindValue('pk', $valor_pk);
            $query->execute();
            $result = $query->fetchAll(PDO::FETCH_ASSOC);
            return $result;
        } catch (PDOException $e) {
            die($e->getMessage());
        }
    }

    function existeRegistro($valor_pk)
    {
        try {
            $query =  $this->conexion->prepare('SELECT * FROM ' . $this->tabla . ' WHERE ' . $this->campo_pk . ' = :pk');
            $query->bindValue('pk', $valor_pk);
            $query->execute();
            if ($query->rowCount() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (PDOException $e) {
            die($e->getMessage());
        }
    }
}
