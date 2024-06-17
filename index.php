<?php

session_start();

require_once 'app/models/TrabajadorModels.php';
require_once 'app/controllers/TrabajadorController.php';


$trabajadorController = new TrabajadorController();


$request = $_SERVER['REQUEST_URI'];


switch ($request) {
    case '/FerreteriaTYT/':
        if (!isset($_SESSION["usuario"])) {
            $trabajadorController->login();
            return;
        }
    case '/FerreteriaTYT/login':
        $trabajadorController->login();
        break;

    case '/FerreteriaTYT/leer':
        $trabajadorController->leer();
        break;



    default:
        http_response_code(404);
        echo '<h1>404</h1> Página no encontrada !';
        break;
}

