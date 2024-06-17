<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="public/styles/iniciarSesion.css">
    <title>INICIAR SESION</title>
</head>
<body style="background-image: url(public/img/fondoLogin.jpg)">
    <form action="login" method="POST">
        <img src="public/img/Usuario.png" alt="Icono Usuario" width="100px" height="100px">
        <input type="text" name="NombreUsuario" placeholder="Usuario" required>
        <input type="password" name="Contrasenia" placeholder="Contraseña" required>
        <input type="submit" name="btnLogin" value="Iniciar Sesion"></input>
    </form>
</body>
</html>