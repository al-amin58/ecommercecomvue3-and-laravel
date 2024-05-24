<script setup>
import useAxios from "@/composables/useAxios.js"

import { ref, onMounted } from "vue";
const { loading, error, sendRequest } = useAxios();

const blogs = ref(null);

const getData = ( async () => {
const responseData = await sendRequest({
     method: 'get',
     url: '/api/posts',
     });
     blogs.value = responseData.data;
});
onMounted( () =>{
 getData()
});
 
const deleteData = async (id) =>  {
  try {
    await sendRequest({
        method:'delete',
        url:`/api/posts/${id}`
    });
    getData()
  } catch (error) {
    error="faild"
  }

};

</script>
<template>
    <ul class="grid grid-cols-1 lg:grid-cols-1 ">
                    <li v-for="blog in blogs" :key="blog.id"  class="mb-2 font-sans shadow-md shadow-primary">
                        <div class=" flex p-2 h-20 content-center">
                            <div class="grow flex justify-center items-center">
                                <p class="font-sans font-medium text-lg">{{ blog.id }}</p>
                            </div>
                            <div class="grow flex justify-center items-center">
                                <img :src="blog.image"  class="rounded-lg object-cover w-20 h-14 flex justify-center" alt="Don't Image update !">
                            </div>  
                            <div class="grow flex justify-center items-center">
                                <h2 class="font-medium text-xl  w-56 line-clamp-1" >{{ blog.title}}</h2>
                            </div>
                            <div class="grow flex justify-center items-center ">
                                <h2 class=" text-lg  w-80 line-clamp-2" >{{ blog.content }}</h2>
                            </div>
                            <div class="grow gap-3 flex justify-center  items-center">
                                <button  class="flex justify-center text-green-950 bg-green-100 w-12 h-7 p-1 rounded-full hover:text-green-950 hover:bg-green-200">
                                    <RouterLink :to="`/edit-blog/${blog.id}`"> 
                                      <svg class="w-5 " xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24"><path fill="currentColor" d="M5.615 20q-.69 0-1.152-.462T4 18.385V5.615q0-.69.463-1.152T5.615 4h8.387l-1 1H5.615q-.23 0-.423.192T5 5.615v12.77q0 .23.192.423t.423.192h12.77q.23 0 .423-.192t.192-.423v-7.489l1-1v8.489q0 .69-.462 1.152T18.385 20zM10 14v-2.615l8.944-8.945q.166-.165.348-.228t.385-.064q.188 0 .368.064q.18.063.326.21L21.483 3.5q.16.165.242.364t.083.401t-.06.382t-.227.345L12.52 14zm10.813-9.715l-1.111-1.17zM11 13h1.092l6.666-6.665l-.546-.547l-.61-.584L11 11.806zm7.212-7.212l-.61-.584zl.546.547z"></path></svg>
                                    </RouterLink>   
                                </button>
                                <button @click="deleteData(blog.id)" class="flex justify-center text-red-950 bg-red-100  w-12 h-7 p-1 rounded-full hover:text-red-950 hover:bg-red-200">
                                    <svg class="w-5 " xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24"><path fill="currentColor" d="M7 21q-.825 0-1.412-.587T5 19V6q-.425 0-.712-.288T4 5t.288-.712T5 4h4q0-.425.288-.712T10 3h4q.425 0 .713.288T15 4h4q.425 0 .713.288T20 5t-.288.713T19 6v13q0 .825-.587 1.413T17 21zM17 6H7v13h10zm-7 11q.425 0 .713-.288T11 16V9q0-.425-.288-.712T10 8t-.712.288T9 9v7q0 .425.288.713T10 17m4 0q.425 0 .713-.288T15 16V9q0-.425-.288-.712T14 8t-.712.288T13 9v7q0 .425.288.713T14 17M7 6v13z"></path></svg>
                                </button>
                            </div>
                        </div>                            
                         
                    </li>
                </ul>
</template>