<!DOCTYPE html>
<html>

<head>
    <title>Lista de Trabajadores</title>
</head>

<body>

    <h1>Lista de Trabajadores</h1>
    <?php if (empty($trabajadores)): ?>
        <p>No hay trabajadores disponibles.</p>
    <?php else: ?>
        <table>
            <!-- <thead>
                <tr>
                    <th>Título</th>
                    <th>Descripción</th>
                </tr>
            </thead> -->
            <tbody>
                <?php foreach ($trabajadores as $trabajador): ?>
                    <h2><?= $trabajador['ID'] ?></h2>
                    <h2><?= $trabajador['usuario'] ?></h2>
                    <h2><?= $trabajador['contrasenia'] ?></h2>
                    <h2><?= $trabajador['IDrol'] ?></h2>
                    <h2><?= $trabajador['IDpersona'] ?></h2>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php endif; ?> 

</body>

</html>