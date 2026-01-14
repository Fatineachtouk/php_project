<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Add semestre and annee_universitaire columns if they don't exist
        if (!Schema::hasColumn('etudiants', 'semestre')) {
            Schema::table('etudiants', function (Blueprint $table) {
                $table->string('semestre')->nullable()->after('filiere_id');
                $table->string('annee_universitaire')->default('2025-2026')->after('semestre');
            });
        }

        // Fill existing students with data
        $filieres = DB::table('filieres')->pluck('id')->toArray();
        $semestres = ['S1', 'S3', 'S5'];
        
        if (count($filieres) > 0) {
            $etudiants = DB::table('etudiants')->get();
            
            foreach ($etudiants as $index => $etudiant) {
                DB::table('etudiants')
                    ->where('id', $etudiant->id)
                    ->update([
                        'filiere_id' => $filieres[$index % count($filieres)],
                        'semestre' => $semestres[$index % count($semestres)],
                        'annee_universitaire' => '2025-2026'
                    ]);
            }
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('etudiants', function (Blueprint $table) {
            $table->dropColumn(['semestre', 'annee_universitaire']);
        });
    }
};
