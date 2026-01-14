<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('etudiants', function (Blueprint $table) {
            $table->string('filiere')->nullable()->after('apogee');
            $table->string('semestre')->nullable()->after('filiere');
            $table->string('annee_universitaire')->default('2025-2026')->after('semestre');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('etudiants', function (Blueprint $table) {
            $table->dropColumn(['filiere', 'semestre', 'annee_universitaire']);
        });
    }
};