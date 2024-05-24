<script setup>
import AppLayout from '@/components/Dashboard/Applayout/AppLayout.vue';
import useAxios from "@/composables/useAxios.js"
import {ref,onMounted} from 'vue'
import vSelect from 'vue-select'
import { useRoute } from 'vue-router'

const { loading, error, sendRequest } = useAxios();
const selected =ref('Pending') ;
const { params } = useRoute();
const order = ref();

const getOrder = (async () =>{
 const response = await sendRequest({
  method: 'get',
  url:`/api/orders/${params.id}`,
 });
 
 order.value = response.data;


});
onMounted(() => {
  getOrder()
});

</script>


<template>
   <AppLayout>
      <div class="container mb-60">
         <button class="h-5 mt-3  text-primary">
            <RouterLink to="/order">
               <div class="flex justify-start items-center ">
                  <svg class="w-10" height="25px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path fill="currentColor" d="m9 18l-6-6l6-6l1.4 1.4L6.8 11H21v2H6.8l3.6 3.6z"></path></svg>
                  <h2>Go Back</h2> 
               </div>
            </RouterLink>
         </button>
         <div class="flex justify-between mt-5 mb-2">
            <h2 class="font-semibold text-xl">Order</h2>
            <div class="flex justify-between  ">
               <div class="bg-primary w-10 h-8 rounded-lg me-5 flex justify-center items-center">
                   <svg class="w-10 h-8 p-1 text-white items-center" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24"><path fill="currentColor" d="M18 7H6V3h12zm0 5.5q.425 0 .713-.288T19 11.5t-.288-.712T18 10.5t-.712.288T17 11.5t.288.713t.712.287M16 19v-4H8v4zm2 2H6v-4H2v-6q0-1.275.875-2.137T5 8h14q1.275 0 2.138.863T22 11v6h-4z"></path></svg>
               </div>
               <div class="w-full h-8 flex justify-center  items-center" >
                  <v-select
                    v-model="selected"
                    :reduce="(option) => option.id"
                    :options="[
                        { label: 'Pending', id: 1 },
                        { label: 'Delivery', id: 2 },
                     ]"
                    :searchable="false"
                    class="w-40  rounded-lg border border-primary  "
                    return-object
                ></v-select>
               </div>
            </div>
         </div>

         <div class="flex w-full gap-5">
            <div class="w-8/12 grid gap-y-5">
               <div class="bg-white p-5 drop-shadow-xl">
                  <table class="table-fixed w-full divide-y divide-slate-200">
                     <thead class="font-sans uppercase ">
                        <tr class="h-12 ">
                           <th class="text-start ">Items</th>
                           <th class="text-center ">Quntity</th>
                           <th class="text-center ">price</th>
                           <th class="text-center ">total</th>
                        </tr>
                     </thead>
                     <tbody class="font-sans divide-y divide-slate-200"> 
                        <tr class="h-10" >
                           <td class="line-clamp-1">{{ order?.orderdetail?.product?.title}}</td>
                           <td class="text-center ">1</td>
                           <td class="text-center">${{ order?.orderdetail?.product?.bdt_price}}</td>
                           <td class="text-center ">${{ order?.orderdetail?.product?.bdt_price}}</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <div class="flex w-full gap-5">
                  <div class="bg-white p-5 drop-shadow-xl w-1/2">
                      <h2 class="font-bold text-xl mb-5">Shipping Information</h2>
                      <div class=" flex justify-between">
                        <h5>Name:</h5>
                        <p class="text-right">{{ order?.address?.fullname}}</p>
                      </div>
                      <div class="flex justify-between">
                        <h5>Address:</h5>
                        <p class="text-right">{{ order?.address?.address}}</p>
                      </div>
                      <div class=" flex justify-between">
                        <h5>City:</h5>
                        <p>{{ order?.address?.city}}</p>
                      </div>
                      <div class=" flex justify-between">
                        <h5>State:</h5>
                        <p>{{ order?.address?.state}}</p>
                      </div>
                      <div class=" flex justify-between">
                        <h5>PostalCode:</h5>
                        <p >{{ order?.address?.zipcode}}</p>
                      </div>
                      <div class=" flex justify-between">
                        <h5>Email:</h5>
                        <p>{{ order?.address?.email}}</p>
                      </div>
                      <div class=" flex justify-between">
                        <h5>Phone:</h5>
                        <p>{{ order?.address?.phone}}</p>
                      </div>
                      
                  </div>
                  <div class="bg-white p-5 drop-shadow-xl w-1/2">
                      <h2 class="font-bold text-xl mb-5">Customer Information</h2>
                      <div class=" flex justify-between">
                        <h5>Name:</h5>
                        <p>{{order?.user?.name}}</p>
                      </div>
                      <div class=" flex justify-between">
                        <h5>Email:</h5>
                        <p>{{order?.user?.email}}</p>
                      </div>
                      <div class=" flex justify-between">
                        <h5>Phone:</h5>
                        <p>{{ order?.address?.phone}}</p>
                      </div>
                      
                  </div>
               </div>   
            </div>
            
            <div class="w-4/12 grid gap-y-5">
               <div class="bg-white px-5 pb-5 drop-shadow-xl ">
                     <h2 class="font-bold text-xl mb-5 mt-5">Information</h2>
                  <div class="divide-y divide-slate-200">
                     <div class=" flex justify-between h-10 items-center font-medium ">
                     <h5>Total:</h5>
                     <p>${{ order?.orderdetail?.product?.bdt_price}}</p>
                     </div>
                     <div class=" flex justify-between h-10 items-center font-medium">
                     <h5>Pay Bill:</h5>
                     <p>8965472</p>
                     </div>
                     <div class="flex justify-between h-10 items-center font-medium">
                     <h5>Pay Due:</h5>
                     <p>5489632</p>
                     </div>
                     <div class="flex justify-between h-10 items-center font-medium">
                     <h5>Discount:</h5>
                     <p>53642</p>
                     </div>
                     <div class="flex justify-between h-10 items-center font-medium ">
                     <h5>Grand Total:</h5>
                     <p>96325874</p>
                     </div>
                        
                  </div>
               </div>
               <div class="bg-white px-5 pb-5 drop-shadow-xl ">
                     <h2 class="font-bold text-xl mb-5 mt-5">Extra Information</h2>
                  <div class="divide-y divide-slate-200">
                     <div class=" flex justify-between h-10 items-center font-medium ">
                     <h5>Type:</h5>
                     <p>POS</p>
                     </div>
                     <div class=" flex justify-between h-10 items-center font-medium">
                     <h5>Payment Status</h5>
                     <p>PAID</p>
                     </div>
                     <div class="flex justify-between h-10 items-center font-medium">
                     <h5>Payment Method:</h5>
                     <p>CASH</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </AppLayout>
</template>
