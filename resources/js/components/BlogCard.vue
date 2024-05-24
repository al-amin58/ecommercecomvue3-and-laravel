<template>
  <div  v-if="blogs" class="flex flex-col lg:flex-row lg:flex-wrap ">
    <div v-for="(blog, index) in blogs.slice(0, 3)" :key="blog.id"  class="w-full lg:w-1/3 pb-6 mb-8 px-3">
      <div class=" w-full border rounded-lg shadow-purple-400 shadow-lg ">
        <RouterLink :to="`/blog-detail/${blog.id}`" class="">
          <img class="w-full h-40 block rounded-t-lg bg-cover" :src="blog.image"  alt="">
        </RouterLink>

        <RouterLink :to="`/blog-detail/${blog.id}`" class="p-5 text-left block">
          <h2 class="font-bold text-xl text-primary line-clamp-2 ">{{ blog.title}}</h2>
            <h3 class="pb-4 text-sm text-gray-400 mt-1">{{formatDate(blog.created_at)}}</h3>
          <p  class="text-gray-600 line-clamp-4">{{ blog.content }}</p>
          <h3 class="font-semibold text-lg text-primary pt-4">Read Full Article</h3>
        </RouterLink>
      </div>
    </div>
  </div>
</template>

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

const formatDate = (  (dateString ) => {
      var date = new Date(dateString);
      var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
      return date.toLocaleDateString('en-US', options);
    }
  )

</script>