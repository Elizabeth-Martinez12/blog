<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class ExportarBase extends BaseController
{
    public function exportar()
    {
        $db = \Config\Database::connect();

        $username = $db->username;
        $password = $db->password;
        $database = $db->database;

        $backupFile = WRITEPATH . 'backups/' . date('Y-m-d-H-i-s') . '.sql';

        $command = "mysqldump --user={$username} --password={$password} {$database} > {$backupFile}";
        exec($command);

        if (file_exists($backupFile)) {
            $this->response->download($backupFile, null)->setFileName('backup.sql');
            return $this->response;
        } else {
            return 'Error al exportar la base de datos.';
        }
    }
    
}

