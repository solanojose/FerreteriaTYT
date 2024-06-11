<?php

class Conexion {

    private static $instance = null;
    private $conn;
    
    private function __construct(){
        $this ->conn = new PDO("mysql:host=localhost;dbname=gestionferreteria", "root", "");

    }

    public static function getInstance(){

        if (!self::$instance){
            self::$instance = new Conexion();
        }

        return self::$instance;
    }
    
    public function getConnection(){
        return $this->conn;
    }
}