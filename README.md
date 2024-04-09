# 🌟 Sistema de votación - Facturacion.cl

El repositorio contiene el ejercicio de diagnóstico como prueba técnica solicitado , cuyo objetivo era crear un sistema
de votaciones, con validaciones asociadas y modelos de bases de datos incluidos. El proyecto incluye recursos asociados tales como
el script SQL para generar la base de datos y las directrices generales del proyecto indicadas en este README.

🚧🚧 MUY IMPORTANTE : Para testear los RUTS ingresados DEBES ingresar un rut válido y real, ya que el sistema es capaz de detectar
RUTS falsos, te recomiendo esta página para sacar RUTS validos y testear: `<RUTS Validos >` : <https://validarutchile.cl/generador-rut-validos.php>

## 🖥️ Tecnologías utilizadas

Las tecnologías utilizadas en este proyecto fueron:
`<PHP (puro) >` : <https://www.php.net/docs.php>
`<JQuery / AJAX >` : <https://releases.jquery.com>
`<MySQL / MariaDB >` : <https://www.mysql.com>
`<XAMPP (opinionado) >` : <https://www.apachefriends.org/es/index.html>

## 🚀 Comenzando

Para hacer el setup inicial y levantar el proyecto, deberás tener PHP y MySQL o MariaDB instalados en tu máquina. Te recomiendo tener
algun entorno que sea all-in-one como XAMPP, WAMP o similares, de esta manera se te facilitará mucho la configuración inicial.

## 🚧 Prerequisitos

Este proyecto requiere de una base de datos para funcionar, es por eso que te recomendé previamente instalar un entorno all-in-one. El
script de la base de datos está escrito en MySQL , por lo que si no has tenido contacto con este motor de base de datos, te explico brevemente
como puedes crear la base de datos para que el proyecto funcione.

1. Ve al directorio de este mismo proyecto : resources/script.sql
2. Copia y pega el contenido del script en tu administrador de base de datos favorito, como phpMyAdmin o SQL Workbench.
3. Verifica que el script se haya ejecutado correctamente
4. Continua con los siguientes pasos de este README

## 💿 Modelo de la base de datos (MER)

El modelo resultante en base a el ejercicio solicitado, que está contenido en el script SQL , es el siguiente:
[![](https://i.imgur.com/s5MfkrV.png)](https://i.imgur.com/s5MfkrV.png "Interfaz solicitada del proyecto")

### 👨‍🚀 Levantando el proyecto en el entorno local

1. Ve al directorio donde se alojan los proyectos en tu servidor local, si estas usando XAMPP sería xampp/htdocs/
2. Copia y pega el proyecto sistema_votacion_desis, las rutas de los scripts son relativas por lo que puedes cambiar el
   nombre del directorio si lo deseas.
3. Abre el proyecto desde VSCode o tu editor de código favorito.
4. Accede al fichero "config.php" de la raíz del sistema, busca estas constantes:

```php
<?php
    // Autenticacion para BD
    define('DB_USER', "root");
    define('DB', "votacion_desis_prueba");
    define('HOST', "127.0.0.1");
    define('PASSWORD', "");
    // Si utilizas otros datos de conexión, sientete libre de cambiarlos, si utilizas los mismos dejalo tal y como está.
?>
```

- Desde el navegador accede al localhost e ingresa la ruta del proyecto que copiaste, si ves algo como en la imagen, ¡felicidades!,
  ya tienes el proyecto corriendo en tu maquina.
  [![](https://i.imgur.com/kPZ24R6.png)](https://i.imgur.com/kPZ24R6.png "Interfaz solicitada del proyecto")

### 📌 Fichero de configuración y rutas

En la raíz del proyecto puedes encontrar el fichero de configuracion "config.php", como habrás visto, en el se encuentran todas las constantes que utiliza
el sistema, para ubicar rutas y requerir ficheros, todo esto de forma relativa y centralizada.

### 🔨 Arquitectura del proyecto

El proyecto esta desarrollado con PHP puro sin ningun tipo de Framework, sin embargo posee arquitectura de directorios MVC, a continuación
te explico todos los directorios :

#### 📁 /models

Todos los modelos corresponden a una clase base de la que heredan los métodos y reciclan código gracias a la programación orientada a objetos,
en el caso particular de los modelos, todas las clases heredan de la clase base Model.php, que se ve de la siguiente forma:

```php
<?php
// Requerir constantes de configuracion
require_once dirname(__DIR__) . '/config.php';
class Model
{
    // Campos heredables
    protected $conexion;
    protected $tabla;
    protected $campo_pk;

    // Conexion a bajo nivel de la BD
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

    // Conexion a la base de datos tras cada instancia
    function __construct()
    {
        $this->conectarDb();
    }

    // Métodos básicos aplicables para cada tabla
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

    // ===================================== MÁS METODOS BÁSICOS ====================================

?>

```

Como te expliqué anteriormente, todos los modelos heredan de esta clase base, por lo que los metodos mas basicos de consultas se incluyen por defecto,
un ejemplo de implementación, es el modelo "CandidatoModel" que hace referencia a la tabla "candidato", su implementación se ve así.

```php
<?php
require_once dirname(__DIR__) . '/config.php';
require_once(MODELS_BASE);

// Al heredar de la clase base contiene todos los metodos ya incluidos
class CandidatoModel extends Model
{

    // Al construir el modelo especifico solo se especifica la tabla y el campo correspondiente.
    function __construct()
    {
        parent::__construct();
        $this->tabla = 'candidato';
        $this->campo_pk = 'id_candidato';
    }
}

?>

```

#### 📁 /controllers

Todos los controladores corresponden a una clase base de la que heredan los métodos y reciclan código gracias a la programación orientada a objetos,
en este caso, todas las clases heredan de la clase base Controller.php, que se ve de la siguiente forma:

```php
class Controller

{
    // Cada controller tiene un modelo especifico segun la tabla
    protected $model;

    function __construct($model)
    {
        $this->model = $model;
    }


    // Cada controller actua como capa intermedia para llamar los metodos del modelo
    function getRegistros()
    {
        return $this->model->getRegistros();
    }

    function getRegistrosOrden($tipo)
    {
        return $this->model->getRegistros($tipo);
    }

    function getRegistro($valorClave)
    {
        return $this->model->getRegistro($valorClave);
    }
}

```

Como te expliqué anteriormente, todos los controladores heredan de esta clase base, por lo que los metodos mas basicos de consultas se incluyen por defecto,
un ejemplo de implementación, es el modelo "CandidatoController" que hace referencia a la tabla "candidato" y al modelo "CandidatoModel", su implementación se ve así.

```php

// Se requiere el modelo y el controlador base
require_once dirname(__DIR__) . '/config.php';
require_once(MODELS_CANDIDATO);
require_once(CONTROLLERS_BASE);


// Se heredan todos los metodos basicos apoyandose en el modelo y clase base del controlador
class CandidatoController extends Controller
{

    function __construct()
    {
        $model = new CandidatoModel();
        parent::__construct($model);
    }
}

```

#### 📁 /public

Este directorio almacena archivos estaticos del proyecto, en este caso especifico son los estilos base que se solicitaron en la prueba.

- public/
  +base.css 🎨

#### 📁 /requests

En este directorio se encuentran todos los manejadores de peticiones que recibe el servidor desde algun cliente HTTP. Como la arquitectura
del sistema es MVC, se apoya en los controladores, entregando datos del cliente y enviando datos de vuelta desde el servidor, independiente
si la peticion es GET o POST, siempre devuelve los datos formateados en JSON para que sean legibles desde cualquier cliente HTTP.

Un ejemplo de implementacion es el manejador de request de la tabla "Regiones", que se comunica con el controlador correspondiente y muestra
los datos asociados .

```php
// Requiere constantes y controlador especifico, en este caso, el de region
require_once dirname(__DIR__) . '/config.php';
require_once(CONTROLLERS_REGION);

// Genera la consulta
$regionController = new RegionController();
$resultado = $regionController->getRegistros();

// Envia los datos solicitados por GET en formato JSON al cliente
echo json_encode($resultado);

```

Otro ejemplo mas complejo, es el de "voto", el cual maneja las peticiones para la tabla "Voto", que son tanto POST, como GET. Para crear nuevos registros
y consultar/validar registros ya existentes. Su estructura se ve asi :

```php
// Requerir constantes y controlador especifico
require_once dirname(__DIR__) . '/config.php';
require_once(CONTROLLERS_VOTO);

// Comportamiento para POST (creacion de nuevos registros)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $controller_voto = new VotoController();
    $voto_info = [
        "rut_voto" => $_POST["rut"],
        "correo" => $_POST["correo"],
        "nombre_votante" => $_POST["campo_nombre"],
        "alias" => $_POST["alias"],
        "id_comuna" => $_POST["comuna"],
        "id_candidato" => $_POST["candidato"],
        "id_medio_informacion" => $_POST["medio_comunicacion"][0]
    ];
    $resultado = $controller_voto->addVoto($voto_info);
    echo json_encode(["resultado" => $resultado]);
}

//Comportamiento para GET (consulta en base a parametros)
else if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $controller_voto = new VotoController();
    $resultado;
    if (isset($_GET["alias"])) $resultado = $controller_voto->getByAlias($_GET["alias"]);
    elseif (isset($_GET["rut"])) $resultado = $controller_voto->getByRut($_GET["rut"]);
    elseif (isset($_GET["correo"])) $resultado = $controller_voto->getByCorreo($_GET["correo"]);
    echo json_encode($resultado);
}

```

#### 📁 /resources

En este directorio se encuentra el script necesario para crear el modelo de datos, y una vista alternativa y opcional a la solicitada, que permite visualizar
los datos que se ingresaron en las votaciones.

+/resources

    +📌script.sql: El fichero SQL que contiene el modelo de la base de datos para ser levantada en el sistema.

    +📌index.html: Vista alternativa para revisar los registros ingresados, puedes acceder desde http://localhost/sistema_votacion_desis/resources.
    (si cambiaste el nombre del directorio tambien debes cambiarlo al acceder en la URL que se menciona).

#### 📁 /scripts

En este directorio se encuentran los scripts encargados de pintar los datos y comunicarse con los ficheros del directorio "/requests", esto debido
a que asi se solicito en la prueba tecnica, ya que la unica vista es un HTML plano, por lo que todas las requests se apoyan en la utilizacion
de la libreria JQuery. Y se dividen de la siguiente manera:

+/scripts

    +📌handleData.js: Se encarga de recuperar y pintar los datos en la vista. Tales como las regiones, y comunas dependientes, asi como los candidatos y medios de informacion que uso el votante.

    +📌handleFormato.js: Se encarga de validar los datos ingresados por el usuario en cuanto al campo RUT, verificando que este sea valido en su valor como en su formato, además de validar que la seleccion del medio que uso el votante, sea unica.

    +📌handleIntegridad.js: Se encarga de verificar y validar que los datos que este ingresando el usuario no existan en la base de datos, y en caso de que existan, da aviso apenas el usuario termina de escribir en el campo (rut, alias, correo).

### 🙋 Candidato

- 🌟 Diego Fábrega Elizalde
- 📞 (9)90622898
- `<Mi web>` : <https://www.dafe.pro>
- 📩 contacto@dafe.pro
- 📌 https://github.com/XP-Magician
