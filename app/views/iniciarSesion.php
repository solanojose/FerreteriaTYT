<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="index.css">
    <title>INICIAR SESION</title>
</head>
<body>
    <form action="iniciarSesion.php" method="POST">
    <img src="IMG/Usuario.png" alt="Icono Usuario" width="100px" height="100px">
    <input type="text" name="NombreUsuario" placeholder="Usuario" required>
        <br/>
        <br/>
    <input type="password" name="Contrasenia" placeholder="Contraseña" required>
        <br/>
        <br/>
    <input type="submit" name="btnLogin" value="Iniciar Sesion"></input>
        <br/>
        <br/>
        <a>Registrate aqui</a>
    </form>
</body>
</html>