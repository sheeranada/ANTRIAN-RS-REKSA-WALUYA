<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoketController;
use App\Http\Controllers\RalanController;
use App\Http\Controllers\Auth\UserController;
use App\Http\Controllers\AntrianFarmasiController;

Route::middleware(['auth:sanctum'])->group(function () {
    Route::prefix('poli')->group(function () {
        Route::get('list-pasien', [RalanController::class, 'listPasien']);
        Route::post('panggil-pasien', [RalanController::class, 'panggilPasien']);
        Route::get('tampilkan-antrian', [RalanController::class, 'tampilkanAntrian']);
    });
    Route::prefix('loket')->group(function () {
        Route::get('last-cetak', [LoketController::class, 'lastCetak']);
        Route::get('last-call-ticket', [LoketController::class, 'lastCallTicket']);
        Route::post('panggil-antrian', [LoketController::class, 'panggilAntrian']);
        Route::post('panggil-antrian-manual', [LoketController::class, 'panggilAntrianManual']);
        Route::get('tampilkan-antrian', [LoketController::class, 'tampilkanAntrian']);
        Route::get('tampilkan-loket1', [LoketController::class, 'tampilkanLoket1']);
        Route::get('tampilkan-loket1', [LoketController::class, 'tampilkanLoket1']);
        Route::get('tampilkan-loket2', [LoketController::class, 'tampilkanLoket2']);
        Route::get('tampilkan-loket3', [LoketController::class, 'tampilkanLoket3']);
        Route::get('tampilkan-loket4', [LoketController::class, 'tampilkanLoket4']);
    });
    Route::prefix('farmasi')->group(function () {
        Route::get('list-pasien', [AntrianFarmasiController::class, 'listPasien']);
        Route::get('tampilkan-antrian', [AntrianFarmasiController::class, 'tampilkanAntrian']);
        Route::post('panggil-pasien', [AntrianFarmasiController::class, 'panggilPasien']);
        Route::get('non-racik-dilayani', [AntrianFarmasiController::class, 'nonRacikDilayani']);
        Route::get('obat-racik-dilayani', [AntrianFarmasiController::class, 'racikDilayani']);
    });
});

Route::prefix('user')->group(function () {
    Route::post('login', [UserController::class, 'login']);
    Route::middleware('auth:sanctum')->group(function () {
        #user account
        Route::post('register', [UserController::class, 'registerUser']);
        Route::post('logout', [UserController::class, 'logout']);
        Route::get('show', [UserController::class, 'showUser']);
    });
});
