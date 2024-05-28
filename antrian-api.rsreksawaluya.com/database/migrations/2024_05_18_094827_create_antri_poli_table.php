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
        Schema::create('antri_poli', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('no_rawat');
            $table->string('nm_pasien');
            $table->string('nm_dokter');
            $table->integer('poli_nomor');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('antri_poli');
    }
};
