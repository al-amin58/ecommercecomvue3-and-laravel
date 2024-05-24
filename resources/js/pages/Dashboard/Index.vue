<script setup>
import AppLayout from '@/components/Dashboard/Applayout/AppLayout.vue';
import BarChart from '@/components/Dashboard/BarChart.vue';
import useAxios from "@/composables/useAxios.js"
import {ref,onMounted} from 'vue'
const { loading, error, sendRequest } = useAxios();

const name = ref('Admin');

const dashboardData = ref(null);

const getDashboardData = (async () => {
  const response =await sendRequest({
      method:'get',
      url:'api/dashboard',
   });
  
   dashboardData.value= response.data

});


const products = ref(null);
const  getData = (async () => {
const responseData = await sendRequest({
     method: 'get',
     url: '/api/products',
     });
     products.value = responseData.data;
});
onMounted(() =>{
 getData()
 getOrder()
 getDashboardData()
});


const orders = ref(null);
const getOrder = (async () =>{
  const response = await sendRequest({
   method: 'get',
   url:'/api/orders',
  });
  orders.value = response.data;
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
      <div class="mt-2 pb-20 bg-white" >
         <!-- welcome section -->
         <div class="m-5 text-2xl max-sm:text-lg">
            <h2 class="shadow-sm max-sm:shadow-none max-sm:mt-10 bg-white w-60 ">Well Come .. {{ name }}</h2>
         </div>
         <!-- Card section -->
         <div class="mt-3 lg:me-12 md:me-5 max-sm:me-12">
            <div class="grid grid-cols-3 lg:gap-3 md:gap-1 m-5 h-28 max-sm:grid-cols-none max-sm:w-full">
               <div class=" bg-white drop-shadow-md rounded-md flex max-sm:mb-3 ">
                  <div class="content-center me-2">
                      <svg class="bg-amber-100 text-amber-500 rounded-full p-2 ms-2 md:w-10 lg:w-12 max-sm:w-12" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 14 14"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"><path d="M7 10.02v1.01m0-6.02v.94m0 7.54c3.5 0 6-1.24 6-4c0-3-1.5-5-4.5-6.5l1.18-1.52a.66.66 0 0 0-.56-1H4.88a.66.66 0 0 0-.56 1L5.5 3C2.5 4.51 1 6.51 1 9.51c0 2.74 2.5 3.98 6 3.98Z"></path><path d="M6 9.56A1.24 1.24 0 0 0 7 10a1.12 1.12 0 0 0 1.19-1A1.12 1.12 0 0 0 7 8a1.12 1.12 0 0 1-1.19-1A1.11 1.11 0 0 1 7 6a1.26 1.26 0 0 1 1 .4"></path></g></svg>
                  </div>
                  <div class="lg:ms-2 md:ms-0 md:me-2 max-sm:ms-2">
                     <div class="mt-5">
                        <h2 class="font-sans font-medium lg:text-xl md:text-lg max-sm:text-xl">Seals</h2>
                     </div>
                     <div class="mt-2 grid lg:gap-10 md:gap-5 max-sm:gap-10 grid-cols-2">
                        <h2 class="font-sans font-medium lg:text-lg  md:text-sm ">BDT</h2>
                        <h2  class="font-sans font-medium lg:text-lg  md:text-sm">USA</h2>
                     </div>
                     <div class=" mt-1 mb-2 grid lg:gap-10 md:gap-5 max-sm:gap-10 grid-cols-2">
                        <h2  class="font-sans font-light text-black lg:text-lg md:text-sm text-start">{{ dashboardData?.totalseals }}</h2>
                        <h2  class="font-sans font-light text-black lg:text-lg  md:text-sm  ">{{ dashboardData?.totalseals }}</h2>
                     </div>
                  </div>
               </div>
               <div class="bg-white  drop-shadow-md rounded-md flex max-sm:mb-3  ">
                 <div class="content-center me-2">
                     <svg class="bg-blue-100 text-blue-500 rounded-full p-2 ms-2 md:w-10 lg:w-12 max-sm:w-12 " xmlns="http://www.w3.org/2000/svg"   viewBox="0 0 48 48"><g fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="4"><path d="M44 14L24 4L4 14V34L24 44L44 34V14Z"></path><path stroke-linecap="round" d="M4 14L24 24"></path><path stroke-linecap="round" d="M24 44V24"></path><path stroke-linecap="round" d="M44 14L24 24"></path><path stroke-linecap="round" d="M34 9L14 19"></path></g></svg>
                 </div>
                 <div class="lg:ms-2 md:ms-0 max-sm:ms-2">
                     <div class="mt-5">
                        <h2 class="font-sans font-medium lg:text-xl max-sm:text-xl md:text-xl">Product</h2>
                     </div>
                     <div class="me-5 mb-2 pb-0 mt-3 flex flex-row-reverse">
                        <h2  class="font-sans lg:font-bold max-sm:font-light lg:text-2xl flex text-black self-end max-sm:text-lg md:text-lg">{{dashboardData?.totalProduct}}</h2>
                     </div>
                 </div>
               </div>
              
               <div class="bg-white  drop-shadow-md rounded-md flex max-sm:mb-3  ">
                 <div class="content-center me-2">
                     <svg class="bg-emerald-100 text-emerald-500 rounded-full p-2 ms-2 md:w-10 lg:w-12 max-sm:w-12 " xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 48 48"><g fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="4"><path d="M44 14L24 4L4 14V34L24 44L44 34V14Z"></path><path stroke-linecap="round" d="M4 14L24 24"></path><path stroke-linecap="round" d="M24 44V24"></path><path stroke-linecap="round" d="M44 14L24 24"></path><path stroke-linecap="round" d="M34 9L14 19"></path></g></svg>
                 </div>
                 <div class="lg:ms-2 md:ms-0 max-sm:ms-2">
                     <div class="mt-5">
                        <h2 class="font-sans font-medium lg:text-xl max-sm:text-xl md:text-xl">Order</h2>
                     </div>
                     <div class="me-5 mb-2 pb-0 mt-3 flex flex-row-reverse">
                        <h2  class="font-sans lg:font-bold  max-sm:font-light lg:text-2xl text-start text-black self-end max-sm:text-lg md:text-lg">{{dashboardData?.totalOder}}</h2>
                     </div>
                 </div>
               </div>
            </div>
         </div>   
         <!-- Today Order section  -->
         <div class="max-sm:hidden mt-10 bg-white ms-6 rounded-md w-11/12  shadow-sm">
            <div class="mb-2">
               <h2 class="font-sans font-medium text-2xl">Today Orders</h2>
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
                  
                  <tbody v-if="orders" class="font-sans"> 
                     <tr v-for="(order, index) in orders.slice(0, 5)" :key="order.id" class="h-10" >
                        <td class="text-center border border-slate-300 md:overflow-hidden md:p-2">#{{order?.order_id }}</td>
                        <td class="text-center border border-slate-300  md:overflow-hidden">{{ order?.order_date }} </td>
                        <td class="text-center border border-slate-300  md:overflow-hidden">{{order?.user?.name}}</td>
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
   
         <!-------Latest Product------------>
         <div class="mt-10  w-11/12 ms-6 max-sm:m-5  ">
            <div class="mb-2">
               <h2 class="font-sans font-medium text-2xl">Latest Products</h2>
            </div>
            <ul v-if="products" class="grid grid-cols-1 lg:grid-cols-2  gap-2 max-sm:grid-cols-none max-sm:w-full max-sm:mt-72" > 
               <li v-for="(product, index) in products.slice(0, 4)" :key="product.id" class="mb-4 shadow-md shadow-primary font-sans max-sm:me-5" >
                  <div class=" rounded-xl p-4 flex flex-row bg-white">
                     <div class="basis-1/3 bg-white rounded-lg">
                        <img :src="product?.images[0]?.url"  class="h-20 rounded-lg w-20 object-cover " alt="Don't Image..!">
                     </div>
                     <div class="basis-2/3  rounded-md ">
                        <div class="p-2">
                              <h2 class="font-medium text-lg line-clamp-1" >{{product.title }}</h2>
                              <div class="flex justify-between font-bold">
                                    <h4><spen class="font-sans text-xl font-extrabold me-1">৳</spen>{{product.bdt_price}}</h4>
                                    <h4><spen  class="font-sans  text-xl me-1">$</spen>{{product.usa_price}}</h4>
                              </div>
                        </div>
                     </div>   
                  </div>
               </li>
            </ul>
         </div>
         <!----------Chart---------------->
         <div class="mt-10 ms-6  h-80 max-sm:hidden">
            <BarChart class="w-full"/>
         </div>
      </div>
   </AppLayout>
</template>




