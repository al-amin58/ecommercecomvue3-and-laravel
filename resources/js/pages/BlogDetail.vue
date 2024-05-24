<template>
  <AppLayout>
    <div class="container">
      <div>
        <h2 class="pt-20 text-3xl font-bold text-center text-primary">Blog Details</h2>
        <p class="text-lg font-medium text-gray-600 text-center pt-3 pb-20"> {{blog?.title }} </p>
      </div>
      <div class="w-full lg:w-2/3 mx-auto">
        <img class="w-full h-96 mb-10" :src="blog?.image"  alt="">
        <div>
          <p class="text-gray-600">
            {{ blog?.content }}
          </p>
        </div>
      </div>
    </div>


  </AppLayout>
</template>

<script setup>


import AppLayout from "@/components/AppLayout.vue";
import useAxios from "@/composables/useAxios.js"
const { loading, error, sendRequest } = useAxios();
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'

const { params } = useRoute();
const blog = ref()
const getData = (async () => {
    const response = await sendRequest({
    method: 'get',
    url:`api/posts/${params.id}`,
    });
    blog.value = response.data
}); 

onMounted( () => {
    getData()
}); 
</script>

<style lang="scss" scoped>

</style>