<?php

session_start();

require_once 'app/models/Tarea.php';
require_once 'app/controllers/TareaController.php';

require_once 'app/models/Usuario.php';
require_once 'app/controllers/UsuarioController.php';

$tareaController = new TareaController();
$usuarioController = new UsuarioController();

$request = $_SERVER['REQUEST_URI'];

switch ($request) {
    case '/FerreteriaTYT/':
        if (!isset($_SESSION["usuario"])) {
            $usuarioController->login();
            return;
        }
    case '/FerreteriaTYT/crear':  
        $tareaController->crear();
        break;
    case '/FerreteriaTYT/leer':
        $tareaController->leer();
        break;
    case '/FerreteriaTYT/actualizar':
        $tareaController->actualizar();
        break;
    case '/FerreteriaTYT/eliminar':
        $tareaController->eliminar();
        break;
    case '/FerreteriaTYT/registrar':
        $usuarioController->registrar();
        break;
    case '/FerreteriaTYT/login':
        $usuarioController->login();
        break;
    case '/FerreteriaTYT/logout':
        $usuarioController->logout();
        break;
    default:
        http_response_code(404);
        echo '<h1>404</h1> Página no encontrada';
        break;
}

