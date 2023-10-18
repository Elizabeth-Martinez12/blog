<table border="1" width="100%">
    <thead>
        <tr>
            <th>Título del Post</th>
            <th>Contenido del Post</th>
            <th>Categoría</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($posts as $post) : ?>
            <tr>
                <td><?= $post['title']; ?></td>
                <td><?= $post['content']; ?></td>
                <td><?= $post['category']; ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>