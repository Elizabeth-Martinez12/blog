<table border="1" width="50%">
    <thead>
        <tr>
            <th>Año</th>
            <th>Mujeres</th>
            <th>Hombres</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>2022</td>
            <td style="<?= $stylesMujeres; ?>"><?= $postsMujeres2022['totalPosts']; ?></td>
            <td style="<?= $stylesHombres; ?>"><?= $postsHombres2022['totalPosts']; ?></td>
        </tr>
        <tr>
            <td>2023</td>
            <td style="<?= $stylesMujeres; ?>"><?= $postsMujeres2023['totalPosts']; ?></td>
            <td style="<?= $stylesHombres; ?>"><?= $postsHombres2023['totalPosts']; ?></td>
        </tr>
    </tbody>
</table>