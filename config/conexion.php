<?php

class Conexion
{
    /**
     * @var Conexion|null
     */
    private static $instance = null;

    /**
     * @var PDO 
     */
    private $conn;


    private function __construct()
    {
        $this->conn = new PDO('mysql:host=localhost;dbname=gestionferreteria', 'root', '');
    }

    /**
     * @return Conexion 
     */
    public static function getInstance()
    {
        if (!self::$instance) {
            self::$instance = new Conexion();
        }
        return self::$instance;
    }

    /**
     * @return PDO 
     */
    public function getConnection()
    {
        return $this->conn;
    }
}