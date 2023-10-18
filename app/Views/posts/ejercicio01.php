<h1>Mostrar una tabla con el id del post, el nombre de la categoría, el nombre del
usuario de los posts publicados en el año 2023.</h1>

<br>

<table border="2">
    <thead>
        <tr>
            <th>POST ID</th>
            <th>CATEGORIA</th>
            <th>PUBLICACION</th>
            <th>NOMBRE DE USUARIO</th>
            <th>FECHA PUBLICACION</th>
        </tr>
    </thead>
    <tbody>
    <?php foreach($posts as $post) : ?>
        <tr>
            <th><?= $post['POST ID']; ?></th>
            <th><?= $post['CATEGORIA']; ?></th>
            <th><?= $post['TITULO']; ?></th>
            <th><?= $post['NOMBRE DE USUARIO']; ?></th>
            <th><?= $post['created_at']; ?></th>

        </tr>
    <?php endforeach; ?>  
    </tbody>
    
</table>