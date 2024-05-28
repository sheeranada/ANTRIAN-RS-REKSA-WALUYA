<?php

namespace App\Http\Controllers;

use App\Models\Ralan;
use App\Models\AntriPoli;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RalanController extends Controller
{
    function listPasien()
    {
        $data = Ralan::join('pasien', 'reg_periksa.no_rkm_medis', '=', 'pasien.no_rkm_medis')
            ->join('dokter', 'reg_periksa.kd_dokter', '=', 'dokter.kd_dokter')
            ->orderBy('reg_periksa.tgl_registrasi', 'desc')
            ->orderBy('reg_periksa.jam_reg', 'desc')
            ->where('reg_periksa.stts', 'belum')
            ->where('reg_periksa.status_lanjut', 'Ralan')
            ->where('reg_periksa.status_bayar', 'Belum Bayar')
            ->limit(250)
            ->select('reg_periksa.no_rawat', 'reg_periksa.no_rkm_medis', 'pasien.nm_pasien', 'reg_periksa.tgl_registrasi', 'dokter.nm_dokter')
            ->get();
        return response()->json($data);
    }
    function panggilPasien(Request $request)
    {
        $validator = Validator::make($request->except('_token'), [
            'no_rawat' => 'required|string|min:8|max:255',
            'nm_dokter' => 'required|string|min:3|max:255',
            'poli_nomor' => 'required|numeric|min:1|max:255',
            'nm_pasien' => 'required|string|min:3|max:255'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()
            ], 422);
        }
        $data = new AntriPoli();
        $data->no_rawat = $request->no_rawat;
        $data->nm_dokter = $request->nm_dokter;
        $data->poli_nomor = $request->poli_nomor;
        $data->nm_pasien = $request->nm_pasien;
        $data->save();

        // Hapus data antrian pada tanggal sebelumnya
        AntriPoli::whereDate('created_at', '<', date('Y-m-d'))->delete();

        return response()->json($data);
    }
    function tampilkanAntrian()
    {
        $data = AntriPoli::orderBy('created_at', 'DESC')
            ->first();
        return response()->json($data);
    }
}
