<script setup>
import AppLayout from '@/components/Dashboard/Applayout/AppLayout.vue'
import Blogcom from '@/components/Dashboard/BlogView.vue';


</script>
<template>
<AppLayout>
    <div class="ms-5 mt-5 me-5"> 
        <div class="flex justify-between ">
            <h2 class="font-sans font-semibold text-3xl">Manage Blogs</h2>
            <button class="font-sans text-base font-semibold h-10 me-10 text-white bg-primary hover:bg-purple-900  rounded-3xl">
                <RouterLink to="/add-blogs" class="flex content-center align-middle ps-3 pe-3 ">
                        + Add Blog
                </RouterLink>
            </button>  
        </div>
       
        <div class="mt-10 pb-10 w-full  bg-white font-sans ">
            <div class=" flex p-2 h-20 content-center">
                <div class="grow flex justify-center items-center">
                    <p class="font-sans font-medium text-lg">#</p>
                </div>
                <div class="grow flex justify-center items-center font-sans font-medium text-lg">Image</div>  
                <div class="grow flex justify-center items-center">
                    <h2 class="font-medium text-lg flex justify-center w-56" >Name</h2>
                </div>
                <div class="grow flex justify-center items-center ">
                    <h2 class="font-medium text-lg flex justify-center w-80" >Description</h2>
                </div>
                <div class="grow flex justify-center  items-center me-5">
                    <h2 class="font-medium text-lg justify-center ps-10">Action</h2>
                </div>
                
            </div>
            <!------------Blog show card---------------------->
            <div>
                <Blogcom/>
            </div>
        </div>
    </div>
    
</AppLayout>
</template>