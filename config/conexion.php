<?php
class Conexion{

    Private $url = "mysql:host=localhost;dbname=gestionferreteria";
    Private $usuario = "root";
    Private $contrasenia = "";

    public function __construct(){
        try
        {
           $this->conexion = new PDO ($this->url, $this->usuario, $this->contrasenia);
        }
        catch (PDOException $ex)
        {
            echo "Error de conexion: " . $ex->getMessage();
        }
    } 
}

