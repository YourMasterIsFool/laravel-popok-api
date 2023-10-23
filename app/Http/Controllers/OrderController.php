<?php

namespace App\Http\Controllers;

use App\Models\OrderModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        // $order = new OrderModel();

        $orders = OrderModel::query();

        if(auth()->user()->isRole('user')) {
            $orders = $orders->where('customer_id', auth()->user()->id);
        }
        if(auth()->user()->isRole('kurir')) {
            $orders = $orders->whereNotIn('order_status', [1]);
        }

        $orders = $orders->with(['product', 'status'])->get();


        return response()->ok($orders);
        
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

        $rules['alamat'] = 'required';

        $validator = Validator::make($request->all(), $rules);

        if($validator->fails()) {
            return response()->badRequest('Tolong check inputan', $validator->errors());
        }
        $order = new OrderModel();
        $order->alamat = $request->alamat;
        $order->quantity = $request->quantity;
        $order->product_id = $request->product_id;
        $order->price = $request->price;
        $order->customer_id = auth()->user()->id;
        $order->latitude = $request->latitude;
        $order->longitude = $request->longitude;
        
        $order->save();


        return response()->ok($order);
      }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //

        $findOrder = OrderModel::with(['product', 'status', 'customer'])->find($id);

        return response()->ok($findOrder);
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

    public function updateStatus(Request $request, string $id) {
        $findOrder = OrderModel::find($id);
        $findOrder->order_status = $request->status;
        $findOrder->save();

        return response()->ok();
    }

    
}
