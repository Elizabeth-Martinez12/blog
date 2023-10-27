<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class ExportarBase extends BaseController
{

    public function mostrar(){
        $db = \Config\Database::connect();
        return 
        view('baseDatos/mostrar');
    }

    public function exportar()
{
    $backupFile = 'C:\Users\eliza\AppData\Roaming\DBeaverData\workspace6\General\Scripts\Script-1.sql';
    $ruta = 'C:\xampp\mysql\bin\mysqldump.exe';
    
    $databaseName = 'blog'; 
    $username = 'root'; 
    $password = '';

    $command = "$ruta -u $username";

    $command .= " $databaseName > $backupFile";
    exec($command);

    if (file_exists($backupFile)) {
        return $this->response->download($backupFile, null)->setFileName('Script-1.csv');
    } else {
        return 'Error al exportar la base de datos.';
    }
    }
}
