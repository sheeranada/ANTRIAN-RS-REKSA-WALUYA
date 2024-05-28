<?php

namespace App\Http\Controllers;

use App\Models\ResepObat;
use App\Models\AntriFarmasi;
use App\Models\ObatRacikan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AntrianFarmasiController extends Controller
{
    function listPasien()
    {
        $data = ResepObat::orderBy('tgl_peresepan', 'DESC')->orderBy('jam_peresepan', 'DESC')
            ->select('nm_pasien', 'tgl_peresepan', 'status', 'reg_periksa.no_rawat', 'reg_periksa.no_rkm_medis')
            ->join('reg_periksa', 'reg_periksa.no_rawat', '=', 'resep_obat.no_rawat')
            ->join('pasien', 'pasien.no_rkm_medis', '=', 'reg_periksa.no_rkm_medis')
            ->where('tgl_penyerahan', '0000-00-00')
            ->distinct('pasien.nm_pasien')
            ->limit(1000)
            ->get();
        return response()->json($data);
    }
    function tampilkanAntrian()
    {
        $data = AntriFarmasi::orderBy('created_at', 'desc')->first();
        return response()->json($data);
    }
    function panggilPasien(Request $request)
    {
        $validator = Validator::make($request->except('_token'), [
            'nm_pasien' => 'required|string|min:3',
            'no_rawat' => 'required|string|min:3',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()
            ], 422);
        }
        $data = new AntriFarmasi();
        $data->nm_pasien = $request->nm_pasien;
        $data->no_rawat = $request->no_rawat;
        $data->save();
        AntriFarmasi::whereDate('created_at', '<', date('Y-m-d'))->delete();
        return response()->json($data);
    }
    function nonRacikDilayani()
    {
        $getNoRawat = ObatRacikan::pluck('no_rawat')->toArray();
        $data = AntriFarmasi::orderBy('created_at', 'desc')
            ->whereNotIn('no_rawat', $getNoRawat)
            ->limit(6)
            ->get();
        return response()->json($data);
    }
    function racikDilayani()
    {
        $getNoRawat = ObatRacikan::pluck('no_rawat')->toArray();
        $data = AntriFarmasi::orderBy('created_at', 'desc')
            ->whereIn('no_rawat', $getNoRawat)
            ->limit(6)
            ->get();
        return response()->json($data);
    }
}
