<script setup>
import AppLayout from '@/components/Dashboard/Applayout/AppLayout.vue';
import useAxios from "@/composables/useAxios.js"
import {ref,onMounted} from 'vue'
const { loading, error, sendRequest } = useAxios();

const users = ref(null);
const getUser = (async () =>{
  const response = await sendRequest({
   method: 'get',
   url:'/api/dashboard',
  });
  
  users.value = response.data.user;
});
onMounted(() =>{
    getUser()
});



</script>


<template>
   <AppLayout>
    <div class="mt-10 bg-white ms-6 rounded-md w-11/12  shadow-sm">
            <div class="mb-2">
               <h2 class="font-sans font-medium text-2xl">Users</h2>
            </div>
            <div class="p-5"> 
               <table class="table-fixed w-full  border-collapse border border-slate-400 ">
                  <thead class="font-sans ">
                     <tr class="h-12 bg-slate-50">
                        <th class="text-center border border-slate-300">Name</th>
                        <th class="text-center border border-slate-300">Email</th>
                        <th class="text-center border border-slate-300 ">Created</th>
                     </tr>
                  </thead>
                  
                  <tbody class="font-sans"> 
                     <tr v-for="user in users" :key="user.id" class="h-10" >
                        <td class="text-center border border-slate-300">{{ user?.name }} </td>
                        <td class="text-center border border-slate-300">{{user?.email}}</td>
                        <td class="text-center border border-slate-300">{{user?.created_at}}</td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
     
       
      </AppLayout>
</template>
