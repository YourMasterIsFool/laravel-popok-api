<?php

namespace App\Http\Controllers;

use App\Models\ArticleModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

use function App\Providers\getUploadedFile;

class ArticleController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //

        $data =  ArticleModel::get();


        return response()->ok($data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    public function getTopArticle() {
        $data = ArticleModel::get();

        return response()->ok($data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //

       
        $rules['description'] = 'required';
        $rules['file_path'] = 'required';
        $rules['title'] ='required';
        $validator =  Validator::make($request->all(), $rules);
        if($validator->fails()) {
            return response()->badRequest($validator->errors());
        }

        $file_path = getUploadedFile($request->file_path);


        
        $article = new ArticleModel();
        $article->title = $request->title;
        $article->description = $request->description;
        $article->file_path = $file_path;
        $article->user_id = auth()->user()->id;

        $article->save();

    
        return response()->created($article);
 



    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //

        $findArticle = ArticleModel::find($id);
        $findArticle->reader = $findArticle->reader +1;

        return response()->ok($findArticle);
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

        $findArticle = ArticleModel::find($id);

        if($request->file_path) {
            $file_path = getUploadedFile($request->file_path);
            $findArticle->file_path = $file_path;
        }
        $findArticle->title = $request->title;
        $findArticle->description  = $request->description;

        $findArticle->save();

        return response()->ok($findArticle);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //

        $findArticle = ArticleModel::find($id);

        $findArticle->delete();


        return response()->ok();
    }
}
