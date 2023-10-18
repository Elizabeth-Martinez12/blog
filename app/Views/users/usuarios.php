<ul>
    <?php foreach ($usuarios as $usuario) : ?>
        <li><?= $usuario['nombre de usuario']; ?></li>
    <?php endforeach; ?>
</ul>



<hr>


<table border="1">
    <?php foreach ($usuarios as $usuario) : ?>
        <tr>
            <td><?= $usuario['nombre de usuario'] ?></td>
            <td><?= $usuario['status'] ?></td>
        </tr>
    <?php endforeach; ?>
</table>