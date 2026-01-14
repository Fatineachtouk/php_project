<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UpdateEtudiantsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Update all existing students with default values
        $filieres = ['CP1', 'CP2', 'GIIA', 'GPMA', 'INDUS', 'GATE', 'GMSI', 'GTR'];
        $semestres = ['S1', 'S3', 'S5'];
        
        $etudiants = DB::table('etudiants')->get();
        
        foreach ($etudiants as $index => $etudiant) {
            DB::table('etudiants')
                ->where('id', $etudiant->id)
                ->update([
                    'filiere' => $filieres[$index % count($filieres)],
                    'semestre' => $semestres[$index % count($semestres)],
                    'annee_universitaire' => '2025-2026'
                ]);
        }
    }
}
