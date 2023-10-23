<?php

namespace App\Http\Controllers;

use App\Models\Pelatihan;
use App\Models\PelatihanCustomerModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PelatihanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $context['data'] =  Pelatihan::query();

        // if(auth()->user()->isRole('user')) {
        //     $context['data'] = $context['data']->isMember(auth()->user()->id);
        // }

        $context['data'] = $context['data']->with('members')->get();

        
        return response()->ok($context['data']);
    }


    public function requestJoin(Request $request) {
        
        $joinMember = new PelatihanCustomerModel();

        $joinMember->pelatihan_id = $request->pelatihan_id;
        $joinMember->customer_id = auth()->user()->id;
        $joinMember->save();

        return response()->ok("Berhasil request join ke pelatihan");
    }
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //

        $rules['judul_pelatihan'] = 'required';
        $rules['tanggal_pelatihan'] = 'required';
        $rules['lokasi_pelatihan'] = 'required';
        $rules['deskripsi'] = 'required';

        $validation = Validator::make($request->all(),$rules);

        if($validation->fails()) {
            return response()->badRequest("Tolong, check input kamu kak !", $validation->errors());
        }

        $created = new Pelatihan();

        $created->judul_pelatihan = $request->judul_pelatihan;
        $created->tanggal_pelatihan = $request->tanggal_pelatihan;
        $created->lokasi_pelatihan = $request->lokasi_pelatihan;
        $created->deskripsi = $request->deskripsi;
        $created->created_by = auth()->user()->id;
        $created->save();

        return response()->created($created);

        

        





        // ['judul_pelatihan', 'tanggal_pelatihan', 'lokasi_pelatihan', 'deskripsi', 'created_by'];
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //

        $findPelatihan = Pelatihan::query();
        if(auth()->user()->isRole('user')) {
          $findPelatihan = $findPelatihan->with('isMember.customer');
        }

        $findPelatihan = $findPelatihan->with(['members.customer'])->find($id);

        return response()->ok($findPelatihan);
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
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function update_status_member(Request $request, string $id) {
        $findMember = PelatihanCustomerModel::find($id);

        $findMember->acc = $request->acc;

        $findMember->save();

        return response()->ok("Berhasil update user");
    }
}
