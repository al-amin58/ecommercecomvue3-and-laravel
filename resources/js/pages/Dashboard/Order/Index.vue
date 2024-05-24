<script setup>
import AppLayout from '@/components/Dashboard/Applayout/AppLayout.vue';
import useAxios from "@/composables/useAxios.js"
import {ref,onMounted} from 'vue'
const { loading, error, sendRequest } = useAxios();

const orders = ref(null);
const getOrder = (async () =>{
  const response = await sendRequest({
   method: 'get',
   url:'/api/orders',
  });
  orders.value = response.data;
});
onMounted(() =>{
   getOrder()
});

const deleted = async(id) =>{
   try{
      await sendRequest({
         method:'DELETE',
         url: `/api/orders/${id}`
      });
   }catch(error){
      error = 'not delete'
   }
}

</script>


<template>
   <AppLayout>
    <div class="mt-10 bg-white ms-6 rounded-md w-11/12  shadow-sm">
            <div class="mb-2">
               <h2 class="font-sans font-medium text-2xl">Orders</h2>
            </div>
            <div class="p-5"> 
               <table class="table-fixed w-full  border-collapse border border-slate-400 ">
                  <thead class="font-sans ">
                     <tr class="h-12 bg-slate-50">
                        <th class="text-center border border-slate-300 ">Order</th>
                        <th class="text-center border border-slate-300">Date</th>
                        <th class="text-center border border-slate-300">Name</th>
                        <th class="text-center border border-slate-300">Value</th>
                        <th class="text-center border border-slate-300">Payment Type</th>
                        <th class="text-center border border-slate-300">Status</th>
                     </tr>
                  </thead>
                  
                  <tbody class="font-sans"> 
                     <tr v-for="order in orders" :key="order.id" class="h-10" >
                        <td class="text-center border border-slate-300">#{{order?.order_id }}</td>
                        <td class="text-center border border-slate-300">{{ order?.order_date }} </td>
                        <td class="text-center border border-slate-300">{{order?.user?.name}}</td>
                        <td class="text-center border border-slate-300">{{order?.price}}</td>
                        <td class="text-center border border-slate-300">cod</td>
                        <td class="border border-slate-300">
                          <div class="flex justify-around">
                              <button class="items-center h-5 w-5 text-green-400 hover:text-green-500">
                                 <RouterLink :to="`/order-customar/${order.id}`">
                                   <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path fill="currentColor" d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5M12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5s5 2.24 5 5s-2.24 5-5 5m0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3s3-1.34 3-3s-1.34-3-3-3"></path></svg>
                                 </RouterLink> 
                              </button>

                              <button @click="deleted(order.id)"  class="items-center h-5 w-5 text-red-400 hover:text-red-500">
                                 <svg xmlns="http://www.w3.org/2000/svg"   viewBox="0 0 24 24"><path fill="currentColor" d="M7 21q-.825 0-1.412-.587T5 19V6H4V4h5V3h6v1h5v2h-1v13q0 .825-.587 1.413T17 21zM17 6H7v13h10zM9 17h2V8H9zm4 0h2V8h-2zM7 6v13z"></path></svg>
                              </button>
                          </div>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
      </AppLayout>
</template>
