<?php
require_once 'config/Conexion.php';

class TrabajadorModels
{
    /**
     * @var PDO 
     */
    private $db;

    
    public function __construct()
    {
        $this->db = Conexion::getInstance()->getConnection();
    }

 
    public function verificar($nombreUsuario)
    {
        $stmt = $this->db->prepare("SELECT usuario, contrasenia FROM ttrabajadores WHERE usuario = ?");
        $stmt->execute([$nombreUsuario]);
        $usuario = $stmt->fetch(PDO::FETCH_ASSOC);
        return $usuario;
    }

    public function leerTodas()
    {
        $stmt = $this->db->query("SELECT * FROM ttrabajadores");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}