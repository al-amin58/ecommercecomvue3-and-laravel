<script setup>
  import AppLayout from "@/components/AppLayout.vue";
  import useAxios from "@/composables/useAxios.js"
import {useAuthStore} from "@/stores/useAuthStore.js";

  import { useRoute } from 'vue-router'
  import { ref, onMounted } from 'vue'
  const { loading, error, sendRequest } = useAxios();
  const { params } = useRoute();
  const product =ref(null); 

  const auth = useAuthStore();
 
const addresses =ref(null);

const  form = ref({
    user_id:auth?.user?.id,
    product_id:params?.id,
    address_id:null,      
 })
 const getData = (async () => {
  
  try{
  const response = await sendRequest({
      method: 'POST',
      url:'/api/checkout',
      data:form.value,
      });
   
      // console.log(response?.data);
      addresses.value = response?.data?.user?.addresses;
      product.value = response?.data?.product;

      // response.data.massage
  }catch(error){
    console.error('Error data:' ,error);
  }
});
 


const orderCheckout = (async () =>{
  const response = await sendRequest({
    method:'POST',
    url:'/api/orders',
    data:form.value,
    params: {
      price: product.value.bdt_price
    }
  })
  console.log(form.value);

});
onMounted(()=>{
  getData()
});
 
</script>
<template>
    <AppLayout>
      <div class="container mb-40 max-sm:mt-24 md:mt-24"> 
        <h2 class="font-bold text-2xl mt-10 max-sm:text-xl max-sm:flex justify-center ">SHIPPING ADDRESS</h2>
        <div class="sm:flex-1 md:flex lg:flex w-full gap-10 md:gap-2 mt-10 max-sm:mt-5">
          <div class="flex max-sm:flex-col   gap-5  md:gap-1 w-7/12 max-sm:w-80 md:w-full ">
            <div  class="flex flex-col w-full md:w-60  max-sm:me-5 ">
              <div  v-for="address in addresses">
                <input class="hidden addressselect" type="radio" :id="`address.${address.id}`" name="address" v-model="form.address_id" :value="address.id">
                <label :for="`address.${address.id}`"   class="text-left block cursor-pointer p-5 shadow max-sm:w-full rounded-lg h-auto mb-5">
                  <h2 class="font-semibold text-xl mb-2 max-sm:text-sm md:text-base">OFFICE ADDRESS</h2>
                  <p class="max-sm:text-sm md:text-base">{{ address.fullname }}</p>
                  <p class="max-sm:text-sm md:text-sm text-left">{{ address.address }}</p>
                  <p class="max-sm:text-sm md:text-sm">{{ address.email }}</p>
                  <p class="max-sm:text-sm md:text-sm">{{ address.phone }}</p>
                  <div class="flex gap-2">
                    <p class="max-sm:text-sm md:text-sm">{{ address.city }}</p>
                    <p class="max-sm:text-sm md:text-sm">{{ address.state }}</p>
                    <p class="max-sm:text-sm md:text-sm">{{ address.zipcode }}</p>
                  </div>
                  <p class="font-thin text-xs mt-2">Area: Dhaka & Delivery Charge: 60<span>৳</span> </p>     
                </label>
              </div>
            </div>
    
            <RouterLink to="/user/dashbord" class=" ms-4 flex items-stretch max-sm:me-5 justify-center max-sm:w-full shadow w-1/2 rounded-lg max-sm:h-36 h-44">
              <div  class="self-center ">
                <div class="flex justify-center">
                  <svg class="w-10 h-10" xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="currentColor" d="M19 12.998h-6v6h-2v-6H5v-2h6v-6h2v6h6z"></path></svg>
                </div>
                <p class="flex justify-center items-center max-sm:text-sm sm:text-xs  md:text-sm md:text-center">Add New Address</p>
              </div>
          </RouterLink>
          </div>
          <div class="w-5/12 max-sm:w-full md:w-full grid gap-y-5 max-sm:mt-5  ">
              <div class="max-sm:me-10  shadow max-sm:shadow-none p-3  divide-y divide-primary pb-5 rounded-lg ">
                <div class="flex justify-between  items-center mb-2 ">
                  <div  class="w-32 max-sm:w-28 md:w-24" >
                    <img :src="product?.images[0].url" alt="">
                  </div>
                  <div class="truncate w-28"> 
                    <h2 class="max-sm:text-sm md:text-sm">{{product?.title}}</h2>
                  </div>
                  <div class="flex max-sm:text-sm md:text-sm" >
                    <h2>Qty:</h2>
                    <p class="ps-1 max-sm:me-1">1</p>
                  </div>
                  <div class="flex max-sm:text-sm md:text-sm md:ms-1">
                    <h2>{{product?.bdt_price}}</h2>
                    <span class="ps-1">৳</span>
                  </div>
                </div>
                <div class="flex justify-end font-semibold text-lg max-sm:text-base">
                  <h2 class="flex mt-5" ><span class="pe-1">1</span> Items.Subtotal:</h2>
                  <h2 class="text-primary flex mt-5 ms-2" >{{product?.bdt_price}} <span class="ps-1">৳</span></h2>
                </div>
              </div>

              <div class="shadow px-3 max-sm:text-sm  max-sm:me-10 py-5 max-sm:shadow-none  ">
                <h2>Order Summary</h2>
                <div class="flex justify-between">
                 <p>Items Total</p> 
                 <p>{{ product?.bdt_price }} <span class="ps-1">৳</span></p>
                </div>
                <div class="divide-y divide-primary mb-5">
                  <div class="flex justify-between ">
                    <p>Delivery Fee</p> 
                    <p>0<span class="ps-1">৳</span></p>
                  </div>
                  <div class="flex justify-between mt-5">
                    <p>Total Payment</p> 
                    <p>{{product?.bdt_price}} <span class="ps-1">৳</span></p>
                  </div>
                </div>
                <!-- <RouterLink :to="`/paymentmethod/${product?.id}`"> -->
                  <button @click="orderCheckout()" class="w-full max-sm:w-full max-sm:text-lg bg-primary uppercase font-bold text-center text-white text-xl py-2 rounded-lg ">Place order</button>
                <!-- </RouterLink> -->
              </div>
          </div>
        </div>
      </div>
    </AppLayout>
  
  </template>
 
<style>
.addressselect[type="radio"]:checked + label {
			background: purple;
			color: #fff;
			transition: all ease-in-out 0.3s;
		}
</style>
  
