<table border="1" style="float: left; border-collapse: separate;" width="50%">
    <thead>
        <tr>
            <th>Nombre de Categoria</th>
            <th>Cantidad de Post</th>
        </tr>
    </thead>
    <tbody>
    <?php 
        $maxCategoria = max(array_column($postPorCategoria, 'PostCategoria'));
        $minCategoria = min(array_column($postPorCategoria, 'PostCategoria'));
    ?>
    <?php foreach($postPorCategoria as $postPorCategoria) : ?>
        <tr>
            <th><?= $postPorCategoria['Categorias']; ?></th>    
            <th <?= ($postPorCategoria['PostCategoria'] === $maxCategoria) ? 'style="background-color: green; color: white"' : 
            (($postPorCategoria['PostCategoria'] === $minCategoria) ? 'style="background-color: red; color: white"' : '') ?>>
                <?= $postPorCategoria['PostCategoria']; ?>
            </th>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>


<table border="1" width="50%">
    <thead>
        <tr>
            <th>Nombre de Autor</th>
            <th>Post Escritos</th>
        </tr>
    </thead>
    <?php 
        $maxAutor = max(array_column($postPorAutor, 'CantidadPost'));
        $minAutor = min(array_column($postPorAutor, 'CantidadPost'));
    ?>
    <?php foreach($postPorAutor as $postPorAutor) : ?>
        <tr>
            <th><?= $postPorAutor['Autor']; ?></th>    
            <th <?= ($postPorAutor['CantidadPost'] === $maxAutor) ? 'style="background-color: blue; color: white"' : 
            (($postPorAutor['CantidadPost'] === $minAutor) ? 'style="background-color: yellow; color: black"' : '') ?>>
                <?= $postPorAutor['CantidadPost']; ?>
            </th>
        </tr>
    <?php endforeach; ?>    
</table>