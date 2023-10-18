<table border="1" width="100%">
    <thead>
        <tr>
            <th>Nombre Completo</th>
            <th>Email</th>
            <th>Telefono</th>
            <th>Titulo Del Post</th>
        </tr>
    </thead>

    <tbody>
    <?php foreach($results as $result) : ?>
        <tr>
            <td><?= $result['nombre_completo']; ?></td>
            <td><?= $result['email']; ?></td>
            <td><?= $result['phone']; ?></td>
            <td><?= $result['title']; ?></td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>