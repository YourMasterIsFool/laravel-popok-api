<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Donasi;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class DonasiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        //

        $data = DB::table('donasis');

        if(auth()->user()->isRole("user")) {
            $data = $data->where('user_id', '=', auth()->user()->id);
        }
        if(auth()->user()->isRole('kurir')) {
            $data = $data->whereNotIn("donasi_statuses.code", [0,3]);
        }

        if($request->input('status')) {
            $data = $data->where('donasis.status_id', $request->status);
        }
        $data = $data->
        leftJoin('donasi_statuses', 'donasi_statuses.code', '=', 'donasis.status_id')
        ->select(['user_id', 'donasis.id as id', 'date_donasi', 'google_coordinate', 'alamat_donasi', 'jumlah_donasi', 'donasi_statuses.status as status_donasi', 'status_id', 'latitude', 'longitude'])
        ->
        get();
        

        return response()->ok($data);
    }

    public function update_status($status, $id) {
        $donasi = Donasi::find($id);
        $donasi->status_id = $status;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        //

       

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //

        // dd($request->all());
        // return response()->created($request->all());

        $rules['date_donasi'] = 'required';
        $rules['jumlah_donasi'] = 'required';

        $validation = Validator::make($request->all(), $rules);

        if($validation->fails()) {
            return response()->badRequest("Tolong, check input kamu kak !", $validation->errors());
        }


        $donasi = new Donasi();
        $donasi->date_donasi=$request->date_donasi;
        $donasi->jumlah_donasi=$request->jumlah_donasi;
        $donasi->alamat_donasi=$request->alamat_donasi;
        $donasi->latitude=$request->latitude;
        $donasi->longitude=$request->longitude;
        $donasi->user_id = auth()->user()->id;
        $donasi->status_id = 0;
        $donasi->save();
        



        return response()->created($donasi);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
        $data = DB::table('donasis')->
        leftJoin('donasi_statuses', 'donasi_statuses.code', '=', 'donasis.status_id')
        ->select(['user_id', 'donasis.id as id', 'date_donasi', 'google_coordinate', 'alamat_donasi', 'jumlah_donasi', 'donasi_statuses.status as status_donasi', 'status_id'])
        ->
        where('donasis.id', $id)
        ->first();

        return response()->ok($data);
        
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //

        $findDonasi = Donasi::find($id);
        $findDonasi->update($request->all());


        return response()->ok($findDonasi);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {

        $findDonasi = Donasi::find($id);
        $findDonasi->delete();


        return response()->ok();
        //
    }

    public function updateStatusDonasi(Request $request, string $id) {
        $findDonasi = Donasi::find($id);
        $findDonasi->status_id = $request->status;

        $findDonasi->save();


        return response()->ok();
    }
}
