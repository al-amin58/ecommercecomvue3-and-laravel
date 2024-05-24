<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $posts = Post::with('user')->get();
        return response()->json($posts);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store()
    {
        $data = Request::validate([
            'title'=>'required',
            'content'=>'required',
            'image'=>'required',
        ]);
        $data['user_id'] = 1;
        if(Request::hasFile('image')){
            $path ='/storage/'.Request::file('image')->store('uploads','public');
            $data ['image'] = $path;
        }

        Post::create($data);

        return response()->json([
            'status' => 'success',
            'message' => 'Post Added Succesfully'
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $blog = Post::find($id);
        return response()->json($blog);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $blog = Post::find($id);
        return response()->json($blog);
    }

    /**
     * Update the specified resource in storage.
     */
        public function update($id) {
            

        $posts = Post::find($id);

        // $data = Request::all();
        $data = Request::validate([
            'title'=>'required',
            'content'=>'required',
          ]);
        
            if(Request::hasFile('image')){
                $path ='/storage/'.Request::File('image')->store('uploads','public');
                $data ['image'] = $path;
            }

        $posts->update($data);

        return response()->json([
            'status' => 'success',
            'message' => 'Post Updated Successfully'
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id){

        $post = Post::where('id', $id)->first();

        if ($post) {
            $imagePath = str_replace('/storage', 'public', $post->image);
            Storage::delete($imagePath);
        }
        $post->delete();

        return response()->json([
            'status' => 'success',
            'message' => 'Post Deleted Successfully'
        ]);
    }

}
