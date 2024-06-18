<?php
require 'config/Conexion.php';

class ProductoModels{

    /**
     * @var PDO
     */
    private $db;

    public function __construct(){
        $this->db = Conexion::getInstance()->getConnection();
    }

    public function listarTodos(){
        $stmt = $this->db->prepare("SELECT * FROM tproductos ");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}