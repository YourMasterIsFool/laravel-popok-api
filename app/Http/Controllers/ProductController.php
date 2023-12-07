<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

use function App\Providers\getUploadedFile;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $data = Product::query();

        if(auth()->user()->isRole('admin')) {

            return response()->ok($data->orderBy('id', 'desc')->get());
        }

         return response()->ok($data->get());

        
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

        $rules['product_title'] =  'required';
        $rules['product_title'] =  'required';
        $rules['product_price'] =  'required';
        $rules['file_path'] =  'required';

        $validator = Validator::make($request->all(), $rules);

        if($validator->fails()){
            return response()->badRequest($validator->errors());
        }
        $file_path = getUploadedFile($request->file_path);

        $product = new Product();
        $product->product_title = $request->product_title;
        $product->product_price = $request->product_price;
        $product->product_description = $request->product_description;
        $product->file_path = $file_path;
        $product->user_id = auth()->user()->id;


        $product->save();


        return response()->created($product);



    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //

        $findProduct = Product::find($id);

        return response()->ok($findProduct);
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
