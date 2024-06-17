<?php

class TrabajadorController
{
    /**
     * @var TrabajadorModels
     */
    private $model;

    public function __construct()
    {
        $this->model = new TrabajadorModels();
    }

    public function login(){
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $nombreUsuario = $_POST['NombreUsuario'];
            $contrasenia = $_POST['Contrasenia'];
            
            $verificar = $this->model->verificar($nombreUsuario);
            if ($verificar) {
                if ($contrasenia == $verificar['contrasenia']){
                $_SESSION['usuario'] = $verificar; 
                    header('Location: leer');
                }else {
                    echo "<script>alert ('Contraseña incorrecta !')</script>";
                    require 'app/views/login.php';
                }
            } else {
                    echo "<script>alert ('El usuario no existe !')</script>";
                    require 'app/views/login.php';
                }
           
        } else {
            require 'app/views/login.php';
        }
    }

    public function leer()
    {
        $trabajadores = $this->model->leerTodas();
        require 'app/views/leer.php';
    }
}