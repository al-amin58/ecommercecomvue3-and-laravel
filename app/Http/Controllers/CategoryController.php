<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Storage;

use Illuminate\Http\Request as HttpRequest;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
       $categories = Category::all();
       return response()->json($categories);
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
    public function store()
    {
        
        $data = Request::validate([
            'name' => 'required',
            'image' => 'required',
        ]);
        if (Request::hasFile('image')){
            $path = '/storage/'.Request::file('image')->store('uploads','public');
            $data['image'] = $path;
        }
        
        
    Category::create($data);

        return response()->json([
            'status' => 'success',
            'message' => 'Category Added Succesfully'
        ]);
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
        $category = Category::find($id);

        return response()->json($category);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(string $id)
    {
    $category = Category::find($id);
      
      $data = Request::validate([
        'name' => 'required',
        'image' => 'required'
      ]);
      
        if(Request::hasFile('image')){
            $path = '/storage/'.Request::file('image')->store('uploads','public');
            $data['image'] = $path;
        }
        $category->update($data);
        
        return response()->json([
            'status' => 'success',
            'message' => 'Category Updated Succesfully'
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $category = Category::find ($id);
        $image = $category->image;

        if ($image){
            $imagePath = str_replace('/storage','public',$image);
            Storage::delete($imagePath);
        }
        $category->delete();

        return response()->json([
            'status' => 'success',
            'message' => 'Category Deleted Succesfully'
        ]);
    }
}
