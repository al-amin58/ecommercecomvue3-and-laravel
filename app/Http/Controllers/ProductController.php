<?php

namespace App\Http\Controllers;

use App\Models\Image;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Storage;


class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
       $products = Product::with('images','category')->get();
       return response()->json($products);
    
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
          'title'=>'required',
          'usa_price'=>'required',
          'bdt_price'=>'required',
          'description'=>'required',
          'images'=>'required',
          'category_id'=>'required',
      ]);
    
      $product = Product::create($data);
      $images = $data['images'];
      $imageData = [];
      foreach ($images as $image){
            $imageData[] = [
                'url'=> '/storage/'.$image['file']->store('uploads','public'),
                'product_id' => $product->id
            ];
       }
      Image::insert($imageData);
      return response()->json([
         'status' => 'success',
         'message' => 'Product Added Succesfully'
      ]);
      
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $product = Product::where('id',$id)->with('images')->first();
        return response()->json($product);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $product = Product::where('id',$id)->with('images','category')->first();
        return response()->json($product);
    }

    /**
     * Update the specified resource in storage.
     */
        public function update($id) {
        $product = Product::find($id);

      
        $data = Request::validate([
            'title' => 'required',
            'usa_price' => 'required',
            'bdt_price' => 'required',
            'description' => 'required',
            'newImages' => 'nullable',
            'category_id'=>'required',
        ]);
        if(isset($data['newImages'])){
            $images = $data['newImages'];
            $imageData = [];

            foreach( $images as $image){
                $imageData[] = [
                    'url' => '/storage/'.$image['file']->store('uploads', 'public'),
                    'product_id' => $product->id
                ];
            }
            Image::insert($imageData);
        }
        $product->update($data);

        return response()->json([
            'status' => 'success',
            'message' => 'Product Updated Successfully'
        ]);
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $product = Product::find($id);
        if ($product) {
            $images = $product->images;
            foreach ($images as $image) {
                $imagePath = str_replace('/storage', 'public', $image->url);
                Storage::delete($imagePath);
                $image->delete();
            }
            $product->delete();
        }
    }
    /**
     * Single Image Delete from storage.
     */
    public function deleteImage($id) {
        $image = Image::find($id);
        $imagePath = str_replace('/storage', 'public', $image->URL);

        Storage::delete($imagePath);
        $image->delete();

        return response()->json([
            'status' => 'success',
            'message' => 'Image Deleted Successfully'
        ]);
    }
}
