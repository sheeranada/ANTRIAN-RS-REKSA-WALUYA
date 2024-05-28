<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\AntriLoket;
use Illuminate\Http\Request;
use App\Models\AntriLoketCetak;
use App\Models\AntriPoli;
use Illuminate\Support\Facades\Validator;

class LoketController extends Controller
{
    function lastCetak()
    {
        $dateNow = Carbon::now()->format('Y-m-d');

        $data = AntriLoketCetak::orderBy('tanggal', 'DESC')
            ->orderBy('jam', 'DESC')
            ->where('tanggal', $dateNow)
            ->first();
        if ($data) {
            $data->nomor = ltrim($data->nomor, '0');
        }
        return response()->json($data);
    }
    function lastCallTicket()
    {
        $data = AntriLoket::orderBy('created_at', 'DESC')
            ->select('no_antrian')
            ->first();
        return response()->json($data);
    }
    function panggilAntrian(Request $request)
    {
        $validator = Validator::make($request->except('_token'), [
            'no_antrian' => 'required|numeric|min:1',
            'loket' => 'required|numeric|min:1',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()
            ], 422);
        }
        $data = new AntriLoket();
        $data->no_antrian = $request->no_antrian;
        $data->loket = $request->loket;
        $data->save();

        AntriLoket::whereDate('created_at', '<', date('Y-m-d'))->delete();

        return response()->json($data);
    }
    function panggilAntrianManual(Request $request)
    {
        $validator = Validator::make($request->except('_token'), [
            'no_antrian' => 'required|numeric|min:1',
            'loket' => 'required|numeric|min:1',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()
            ], 422);
        }
        $data = new AntriLoket();
        $data->no_antrian = $request->no_antrian;
        $data->loket = $request->loket;
        $data->save();

        AntriLoket::whereDate('created_at', '<', date('Y-m-d'))->delete();

        return response()->json($data);
    }
    function tampilkanAntrian()
    {
        $data = AntriLoket::orderBy('created_at', 'DESC')
            ->first();
        return response()->json($data);
    }
    function tampilkanLoket1()
    {
        $data = AntriLoket::where('loket', 1)
            ->orderBy('created_at', 'DESC')
            ->first();
        return response()->json($data);
    }
    function tampilkanLoket2()
    {
        $data = AntriLoket::where('loket', 2)
            ->orderBy('created_at', 'DESC')
            ->first();
        return response()->json($data);
    }
    function tampilkanLoket3()
    {
        $data = AntriLoket::where('loket', 3)
            ->orderBy('created_at', 'DESC')
            ->first();
        return response()->json($data);
    }
    function tampilkanLoket4()
    {
        $data = AntriLoket::where('loket', 4)
            ->orderBy('created_at', 'DESC')
            ->first();
        return response()->json($data);
    }
}
