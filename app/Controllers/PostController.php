<?php

namespace App\Controllers;

class PostController extends BaseController
{
    public function ejercicio01()
    {
        $db = \Config\Database::connect();
  
        $posts = $db->query('select p.id as "POST ID", c.category as "CATEGORIA", p.title as "TITULO", u.username as 
        "NOMBRE DE USUARIO", p.created_at from posts as p join categories as c on p.category = c.id join users as u 
        on u.id = p.autor where p.created_at between "2023/01/01" and "2023/12/31"')->getResultArray();

        $data = [
            'posts' => $posts
        ];

        return view('posts/ejercicio01', $data);

    }

    public function ejercicio02()
    {
        $db = \Config\Database::connect();

        $category = $db->query('SELECT c.category AS category, u.username AS username
        FROM categories c
        JOIN posts p ON p.category = c.id
        JOIN users u ON p.autor = u.id
        ORDER BY c.id DESC
        LIMIT 1')->getRowArray();

        $data = [
            'category' => $category
        ];

        return view('posts/ejercicio02', $data);
    }

    public function ejercicio03()
    {
        $db = \Config\Database::connect();

        $query = 'SELECT CONCAT(u.name, " ", u.lastname) AS nombre_completo, u.website AS email, u.phone, p.title 
              FROM userinfo u
              LEFT JOIN posts p ON p.autor = u.id
              WHERE p.status = 0';

        $resultados = $db->query($query)->getResultArray();

        $data = [
            'results' => $resultados
        ];

        return view('posts/ejercicio03', $data);
    }





    public function ejercicio05()
    {
        $db = \Config\Database::connect();
        $totalUsers = $db->query('select count(*) as "totalUsuarios" from users')->getResultArray();

        $totalPosts = $db->query('select count(*) as "totalPublicaciones" from posts')->getResultArray();

        $totalComments = $db->query('select count(*) as "totalComentarios" from comments')->getResultArray();

        $totalCategories = $db->query('select count(*) as "totalCategorias" from categories')->getResultArray();

        $data = [
            'totalUsers' =>$totalUsers,
            'totalPosts' =>$totalPosts,
            'totalComments' =>$totalComments,
            'totalCategories' =>$totalCategories
        ];
        return view ('posts/ejercicio05', $data);
    }


    public function ejercicio06()
    {
        $db = \Config\Database::connect();
    
        $postsPorCategoria = $db->query('SELECT c.category, COUNT(p.id) as totalPosts 
        FROM categories c LEFT JOIN posts p ON c.id = p.category GROUP BY c.id')->getResultArray();
    
        $postsPorAutor = $db->query('SELECT u.username, COUNT(p.id) as totalPosts 
        FROM users u LEFT JOIN posts p ON u.id = p.autor GROUP BY u.id')->getResultArray();
    
        $data = [
            'postsPorCategoria' => $postsPorCategoria,
            'postsPorAutor' => $postsPorAutor
        ];
    
        return view('posts/ejercicio06', $data);
    }



    public function ejercicio07()
    {
        $db = \Config\Database::connect();
    
        $postsMujeres2022 = $db->query('SELECT COUNT(p.id) as totalPosts FROM posts p 
                                        JOIN users u ON p.autor = u.id 
                                        JOIN userinfo ui ON u.id = ui.id 
                                        WHERE ui.gender = "f" AND YEAR(p.created_at) = 2022')->getRowArray();
    
        $postsMujeres2023 = $db->query('SELECT COUNT(p.id) as totalPosts FROM posts p 
                                        JOIN users u ON p.autor = u.id 
                                        JOIN userinfo ui ON u.id = ui.id 
                                        WHERE ui.gender = "f" AND YEAR(p.created_at) = 2023')->getRowArray();
    
        $postsHombres2022 = $db->query('SELECT COUNT(p.id) as totalPosts FROM posts p 
                                        JOIN users u ON p.autor = u.id 
                                        JOIN userinfo ui ON u.id = ui.id 
                                        WHERE ui.gender = "m" AND YEAR(p.created_at) = 2022')->getRowArray();
    
        $postsHombres2023 = $db->query('SELECT COUNT(p.id) as totalPosts FROM posts p 
                                        JOIN users u ON p.autor = u.id 
                                        JOIN userinfo ui ON u.id = ui.id 
                                        WHERE ui.gender = "m" AND YEAR(p.created_at) = 2023')->getRowArray();
    
        $stylesMujeres = '';
        $stylesHombres = '';
    
        if ($postsMujeres2023['totalPosts'] < $postsMujeres2022['totalPosts']) {
            $stylesMujeres = 'background-color: red; color: white;';
        } elseif ($postsMujeres2023['totalPosts'] > $postsMujeres2022['totalPosts']) {
            $stylesMujeres = 'background-color: green; color: white;';
        }
    
        if ($postsHombres2023['totalPosts'] < $postsHombres2022['totalPosts']) {
            $stylesHombres = 'background-color: red; color: white;';
        } elseif ($postsHombres2023['totalPosts'] > $postsHombres2022['totalPosts']) {
            $stylesHombres = 'background-color: green; color: white;';
        }
    
        $data = [
            'postsMujeres2022' => $postsMujeres2022,
            'postsMujeres2023' => $postsMujeres2023,
            'postsHombres2022' => $postsHombres2022,
            'postsHombres2023' => $postsHombres2023,
            'stylesMujeres' => $stylesMujeres,
            'stylesHombres' => $stylesHombres,
        ];
    
        return view('posts/ejercicio07', $data);
    }




    public function ejercicio08()
    {
        $db = \Config\Database::connect();
        $postPorCategoria = $db->query('select c.category as "Categorias", count(p.id) as "PostCategoria" 
        from categories c left join posts p on c.id = p.category group by c.id')->getResultArray();
        $postPorAutor = $db->query('select u.username as "Autor", count(p.autor) as "CantidadPost" 
        from users u  left join posts p on u.id = p.autor group by u.id')->getResultArray();

        $data = [
            'postPorCategoria' => $postPorCategoria,
            'postPorAutor' => $postPorAutor

        ];
        return view('posts/ejercicio08', $data);
    }

    public function ejercicio09()
    {
        $db = \Config\Database::connect();
    
        $query = 'SELECT p.title, p.content, c.category
                  FROM posts p
                  JOIN categories c ON p.category = c.id
                  JOIN users u ON p.autor = u.id
                  WHERE u.profile = (SELECT id FROM profiles WHERE profile = "admin")';
    
        $posts = $db->query($query)->getResultArray();
    
        $data = [
            'posts' => $posts
        ];
    
        return view('posts/ejercicio09',$data);

    }
}