<table>
    <thead>
        <tr>
            <th>Usuario</th>
            <th>Contraseña</th>
            <th>Estado del usuario</th>
        </tr>
    </thead>
    <tbody>
    <?php foreach($usuarios as $usuario) : ?>
        <tr>
            <th><?= $usuario['username']; ?></th>
            <th><?= $usuario['password']; ?></th>
            <?php if ($usuario['status'] == 1): ?></th>
                <td>Activo</td>
            <?php else : ?>
                <td>Inactivo</td>
            <?php endif ?>
        </tr>
    <?php endforeach; ?>  
    <tbody>
</table>