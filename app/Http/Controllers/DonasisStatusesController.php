<?php

namespace App\Http\Controllers;

use App\Models\DonasiStatus;
use Illuminate\Http\Request;

class DonasisStatusesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $listStatus = DonasiStatus::query();
        if(auth()->user()->isRole('kurir')) {
            $listStatus = $listStatus->whereNotIn('code',[0, 3]);
        }
        $listStatus = $listStatus->get();
        return response()->ok($listStatus);
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
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
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
}
