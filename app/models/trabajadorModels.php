<?php
require_once 'config/Conexion.php';

class TrabajadorModels {

    private $db;

    public function __construct(){
        $this->db = Conexion::getInstance() -> getConnection();
    }

    public function verificar($nombreUsuario, $clave){

        $stmt = $this->db->prepare("SELECT  FROM usuarios WHERE correo = ?");
        $stmt->execute([$correo]);
        $usuario = $stmt->fetch(PDO::FETCH_ASSOC);
        return $usuario;
    }
}