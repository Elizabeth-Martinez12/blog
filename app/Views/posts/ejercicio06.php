<table border="1" style="float: left; border-collapse: separate;" width="50%">
    <thead>
        <tr>
            <th>Categoría</th>
            <th>Total de Posts</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($postsPorCategoria as $categoria) : ?>
            <tr>
                <td><?= $categoria['category']; ?></td>
                <td><?= $categoria['totalPosts']; ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<table border="1" width="50%">
    <thead>
        <tr>
            <th>Usuario</th>
            <th>Total de Posts</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($postsPorAutor as $autor) : ?>
            <tr>
                <td><?= $autor['username']; ?></td>
                <td><?= $autor['totalPosts']; ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>