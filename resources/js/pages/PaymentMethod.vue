<script setup>
  import AppLayout from "@/components/AppLayout.vue";
  import useAxios from "@/composables/useAxios"
// import {useAuthStore} from "@/stores/useAuthStore.js";

  import { ref, onMounted } from 'vue'
  import { useRoute } from 'vue-router'
//   const auth = useAuthStore();

   const { params } = useRoute();
   const { loading, error, sendRequest } = useAxios();
   const { orders } = useRoute();

   const form = ref({
       product_id:params?.id,
    //    user_id:auth?.user?.id,
       payment_method:'cod',
    });
 
    const submitForm = async () => {
        const response = await sendRequest({
          method: 'post',
          url: '/api/orders',
          data:form.value,
        });
        console.log(form.value)
    };


const product = ref(null);
 const getData = (async () => {
  
  try{
  const response = await sendRequest({
      method: 'POST',
      url:'/api/checkout',
      data:form.value,
      });
      product.value = response?.data?.product;

      // response.data.massage
  }catch(error){
    console.error('Error data:' ,error);
  }
});

onMounted(()=>{
    getData()
});

</script>
<template>
    <AppLayout>
        <div class="w-full h-full">
            <div class="container mb-40 ">
                <div class="w-11/12 mx-auto mt-20 ">
                    <div class="sm:flex-1 md:flex lg:flex gap-5 mt-10 ">
                        <div class="w-1/2 max-sm:w-full mb-10 md:w-full max-sm:me-10">
                            <h2 class="font-bold text-2xl max-sm:text-lg max-sm:pt-14 md:mt-5 md:text-xl">Select Your Payment Method</h2>
                            <div class="grid grid-cols-2 gap-5 mt-10 max-sm:me-2 ">
                               
                                 <input class="hidden paymentbtype" type="radio" id="paymenttypr" name="paymenttype" v-model="paymenttype" value="paymenttype">
                               
                                <label for="paymenttypr"  class=" bg-white shadow-md h-24 w-48 p-2 md:w-40 max-sm:w-36 cursor-pointer">
                                    <div class="flex justify-center items-center">
                                        <svg class="w-11 font-bold text-primary"  xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 16 16"><g fill="currentColor"><path fillRule="evenodd" d="M11 15a4 4 0 1 0 0-8a4 4 0 0 0 0 8m5-4a5 5 0 1 1-10 0a5 5 0 0 1 10 0"></path><path d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207c0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158c0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522c0-.294.216-.514.572-.578v1.1zm.432.746c.449.104.655.272.655.569c0 .339-.257.571-.709.614v-1.195z"></path><path d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083q.088-.517.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1z"></path><path d="M9.998 5.083L10 5a2 2 0 1 0-3.132 1.65a6 6 0 0 1 3.13-1.567"></path></g></svg>
                                    </div>                     
                                    <h2 class=" items-center font-bold  flex justify-center max-sm:text-sm max-sm:mt-2"> Cash On Delivery</h2>
                                </label>

                                <input class="hidden paymentbtype2" type="radio" id="paymenttypr2" name="paymenttype" v-model="paymenttype" value="paymenttype">

                                <label for="paymenttypr2" class=" bg-white shadow-md h-24 w-48 p-2 md:w-40 cursor-pointer max-sm:w-36">
                                    <div class="flex justify-center items-center">
                                        <svg class="w-11 font-bold text-primary"  xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 48 48"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M22.981 8.632s-4.163 14.704-3.809 14.704s16.476 2.923 16.476 2.923Z"></path><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M22.981 8.632L6.329 6.152l12.843 17.184l2.215 10.186l14.261-7.263l3.72-8.814l-8.975 1.501m7.536 1.909H43l-3.632-3.41"></path><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="m21.387 33.522l.354 1.905l-8.016 6.421l5.447-18.512m16.476 2.923l-.531 2.879l-12.269 3.64M8.455 8.997H5L16.044 19.15"></path></svg>
                                    </div>                     
                                    <h2 class=" items-center font-bold  flex justify-center">Bkash</h2>
                                </label> 
                                <!-- <input class="hidden paymentbtype" type="radio" id="paymenttypr" name="paymenttype" v-model="paymenttype" value="paymenttype">

                                <label class=" bg-white shadow-md h-24 w-48 p-2 md:w-40 cursor-pointer  max-sm:w-36">
                                    <div class="flex justify-center items-center"> 
                                        <svg class="w-11 text-primary" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 48 48"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M18.88 6.398a19.347 19.347 0 1 0 23.516 12.987"></path><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M14.92 25.893c-.062-4.213 2.564-12.09 11.48-15.938l-3.603-6.412c-5.374 2.626-12.58 11.664-7.878 22.35"></path><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M22.136 12.409a16.8 16.8 0 0 0-2.921 8.842c1.839-3.791 7.725-9.648 17.419-9.077l-.336-7.347a18 18 0 0 0-10.613 3.856"></path><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M34.465 12.153a16.5 16.5 0 0 0-10.569 8.127c3.347-2.56 11.238-5.145 19.64-.278l3.002-6.714a17.75 17.75 0 0 0-9.924-1.532"></path><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M13.438 20.07a11.604 11.604 0 1 0 19.046-2.772"></path></svg>
                                    </div>                     
                                    <h2 class=" items-center font-bold  flex justify-center"> Nagad</h2>
                                </label>
                                <input class="hidden paymentbtype" type="radio" id="paymenttypr" name="paymenttype" v-model="paymenttype" value="paymenttype">

                                <label class=" bg-white shadow-md h-24 w-48 p-2  md:w-40 cursor-pointer max-sm:w-36">
                                    <div class="flex justify-center items-center">
                                        <svg  class="w-11 " xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 302"><path fill="#27346A" d="M217.168 23.507C203.234 7.625 178.046.816 145.823.816h-93.52A13.393 13.393 0 0 0 39.076 12.11L.136 259.077c-.774 4.87 2.997 9.28 7.933 9.28h57.736l14.5-91.971l-.45 2.88c1.033-6.501 6.593-11.296 13.177-11.296h27.436c53.898 0 96.101-21.892 108.429-85.221c.366-1.873.683-3.696.957-5.477c-1.556-.824-1.556-.824 0 0c3.671-23.407-.025-39.34-12.686-53.765"></path><path fill="#27346A" d="M102.397 68.84a11.737 11.737 0 0 1 5.053-1.14h73.318c8.682 0 16.78.565 24.18 1.756a101.6 101.6 0 0 1 6.177 1.182a89.928 89.928 0 0 1 8.59 2.347c3.638 1.215 7.026 2.63 10.14 4.287c3.67-23.416-.026-39.34-12.687-53.765C203.226 7.625 178.046.816 145.823.816H52.295C45.71.816 40.108 5.61 39.076 12.11L.136 259.068c-.774 4.878 2.997 9.282 7.925 9.282h57.744L95.888 77.58a11.717 11.717 0 0 1 6.509-8.74"></path><path fill="#2790C3" d="M228.897 82.749c-12.328 63.32-54.53 85.221-108.429 85.221H93.024c-6.584 0-12.145 4.795-13.168 11.296L61.817 293.621c-.674 4.262 2.622 8.124 6.934 8.124h48.67a11.71 11.71 0 0 0 11.563-9.88l.474-2.48l9.173-58.136l.591-3.213a11.71 11.71 0 0 1 11.562-9.88h7.284c47.147 0 84.064-19.154 94.852-74.55c4.503-23.15 2.173-42.478-9.739-56.054c-3.613-4.112-8.1-7.508-13.327-10.28c-.283 1.79-.59 3.604-.957 5.477"></path><path fill="#1F264F" d="M216.952 72.128a89.928 89.928 0 0 0-5.818-1.49a109.904 109.904 0 0 0-6.177-1.174c-7.408-1.199-15.5-1.765-24.19-1.765h-73.309a11.57 11.57 0 0 0-5.053 1.149a11.683 11.683 0 0 0-6.51 8.74l-15.582 98.798l-.45 2.88c1.025-6.501 6.585-11.296 13.17-11.296h27.444c53.898 0 96.1-21.892 108.428-85.221c.367-1.873.675-3.688.958-5.477c-3.122-1.648-6.501-3.072-10.14-4.279a83.26 83.26 0 0 0-2.77-.865"></path></svg>
                                    </div>                     
                                    <h2 class=" items-center font-bold  flex justify-center"> Paypal</h2>
                                </label>
                                <input class="hidden paymentbtype" type="radio" id="paymenttypr" name="paymenttype" v-model="paymenttype" value="paymenttype">

                                <label class=" bg-white shadow-md h-24 w-48 p-2 md:w-40  cursor-pointer max-sm:w-36">
                                    <div class="flex justify-center items-center">
                                        <svg class="w-11 " xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 256 199"><path d="M46.54 198.011V184.84c0-5.05-3.074-8.342-8.343-8.342c-2.634 0-5.488.878-7.464 3.732c-1.536-2.415-3.731-3.732-7.024-3.732c-2.196 0-4.39.658-6.147 3.073v-2.634h-4.61v21.074h4.61v-11.635c0-3.731 1.976-5.488 5.05-5.488c3.072 0 4.61 1.976 4.61 5.488v11.635h4.61v-11.635c0-3.731 2.194-5.488 5.048-5.488c3.074 0 4.61 1.976 4.61 5.488v11.635zm68.271-21.074h-7.463v-6.366h-4.61v6.366h-4.171v4.17h4.17v9.66c0 4.83 1.976 7.683 7.245 7.683c1.976 0 4.17-.658 5.708-1.536l-1.318-3.952c-1.317.878-2.853 1.098-3.951 1.098c-2.195 0-3.073-1.317-3.073-3.513v-9.44h7.463zm39.076-.44c-2.634 0-4.39 1.318-5.488 3.074v-2.634h-4.61v21.074h4.61v-11.854c0-3.512 1.536-5.488 4.39-5.488c.878 0 1.976.22 2.854.439l1.317-4.39c-.878-.22-2.195-.22-3.073-.22m-59.052 2.196c-2.196-1.537-5.269-2.195-8.562-2.195c-5.268 0-8.78 2.634-8.78 6.805c0 3.513 2.634 5.488 7.244 6.147l2.195.22c2.415.438 3.732 1.097 3.732 2.195c0 1.536-1.756 2.634-4.83 2.634c-3.073 0-5.488-1.098-7.025-2.195l-2.195 3.512c2.415 1.756 5.708 2.634 9 2.634c6.147 0 9.66-2.853 9.66-6.805c0-3.732-2.854-5.708-7.245-6.366l-2.195-.22c-1.976-.22-3.512-.658-3.512-1.975c0-1.537 1.536-2.415 3.951-2.415c2.635 0 5.269 1.097 6.586 1.756zm122.495-2.195c-2.635 0-4.391 1.317-5.489 3.073v-2.634h-4.61v21.074h4.61v-11.854c0-3.512 1.537-5.488 4.39-5.488c.879 0 1.977.22 2.855.439l1.317-4.39c-.878-.22-2.195-.22-3.073-.22m-58.833 10.976c0 6.366 4.39 10.976 11.196 10.976c3.073 0 5.268-.658 7.463-2.414l-2.195-3.732c-1.756 1.317-3.512 1.975-5.488 1.975c-3.732 0-6.366-2.634-6.366-6.805c0-3.951 2.634-6.586 6.366-6.805c1.976 0 3.732.658 5.488 1.976l2.195-3.732c-2.195-1.757-4.39-2.415-7.463-2.415c-6.806 0-11.196 4.61-11.196 10.976m42.588 0v-10.537h-4.61v2.634c-1.537-1.975-3.732-3.073-6.586-3.073c-5.927 0-10.537 4.61-10.537 10.976c0 6.366 4.61 10.976 10.537 10.976c3.073 0 5.269-1.097 6.586-3.073v2.634h4.61zm-16.904 0c0-3.732 2.415-6.805 6.366-6.805c3.732 0 6.367 2.854 6.367 6.805c0 3.732-2.635 6.805-6.367 6.805c-3.951-.22-6.366-3.073-6.366-6.805m-55.1-10.976c-6.147 0-10.538 4.39-10.538 10.976c0 6.586 4.39 10.976 10.757 10.976c3.073 0 6.147-.878 8.562-2.853l-2.196-3.293c-1.756 1.317-3.951 2.195-6.146 2.195c-2.854 0-5.708-1.317-6.367-5.05h15.587v-1.755c.22-6.806-3.732-11.196-9.66-11.196m0 3.951c2.853 0 4.83 1.757 5.268 5.05h-10.976c.439-2.854 2.415-5.05 5.708-5.05m114.372 7.025v-18.879h-4.61v10.976c-1.537-1.975-3.732-3.073-6.586-3.073c-5.927 0-10.537 4.61-10.537 10.976c0 6.366 4.61 10.976 10.537 10.976c3.074 0 5.269-1.097 6.586-3.073v2.634h4.61zm-16.903 0c0-3.732 2.414-6.805 6.366-6.805c3.732 0 6.366 2.854 6.366 6.805c0 3.732-2.634 6.805-6.366 6.805c-3.952-.22-6.366-3.073-6.366-6.805m-154.107 0v-10.537h-4.61v2.634c-1.537-1.975-3.732-3.073-6.586-3.073c-5.927 0-10.537 4.61-10.537 10.976c0 6.366 4.61 10.976 10.537 10.976c3.074 0 5.269-1.097 6.586-3.073v2.634h4.61zm-17.123 0c0-3.732 2.415-6.805 6.366-6.805c3.732 0 6.367 2.854 6.367 6.805c0 3.732-2.635 6.805-6.367 6.805c-3.951-.22-6.366-3.073-6.366-6.805"></path><path fill="#FF5F00" d="M93.298 16.903h69.15v124.251h-69.15z"></path><path fill="#EB001B" d="M97.689 79.029c0-25.245 11.854-47.637 30.074-62.126C114.373 6.366 97.47 0 79.03 0C35.343 0 0 35.343 0 79.029c0 43.685 35.343 79.029 79.029 79.029c18.44 0 35.343-6.366 48.734-16.904c-18.22-14.269-30.074-36.88-30.074-62.125"></path><path fill="#F79E1B" d="M255.746 79.029c0 43.685-35.343 79.029-79.029 79.029c-18.44 0-35.343-6.366-48.734-16.904c18.44-14.488 30.075-36.88 30.075-62.125c0-25.245-11.855-47.637-30.075-62.126C141.373 6.366 158.277 0 176.717 0c43.686 0 79.03 35.563 79.03 79.029"></path></svg>
                                    </div>                     
                                    <h2 class=" items-center font-bold  flex justify-center">Master Card</h2>
                                </label> -->
                            </div>
                            
                        </div>
                        <div class="flex justify-center items-center w-1/2 max-sm:w-full md:w-full mb-10">
                            <div class="bg-white mt-10 p-5  w-full shadow-md">
                                <h2 class="font-semibold text-xl uppercase">order summary</h2>
                                <div class="mt-10 pb-5" >
                                    <div class="flex justify-between  mb-3  ">
                                        <h2>Subtotal (1 Item Total of Qty And Prices )</h2>
                                        <p><span class="pe-1">৳</span>{{product?.bdt_price}}</p> 
                                    </div>
                                    <div class="flex justify-between  mb-3">
                                        <h2>Incluted Delivery Charge</h2>
                                        <p><span class="pe-1">৳</span>60</p> 
                                    </div>
                                    <div class="flex justify-between  text-xl font-bold mb-5 mt-5">
                                        <h2>Total AMount </h2>
                                        <p> <span class="pe-1">৳</span>{{product?.bdt_price}}+60</p>
                                    </div>
                                
                                    <button v-on:click="submitForm" class="w-full max-sm:mb-0 mt-5-lg text-white font-semibold  text-xl p-2 bg-gradient-to-r from-violet-500 to-fuchsia-500" type="submit" >Confirm Order</button>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </AppLayout>
  </template>
 <style>
.paymentbtype[type="radio"]:checked + label {
			background: rgb(16, 214, 171);
			color: #fff;
			transition: all ease-in-out 0.3s;
		}
.paymentbtype2[type="radio"]:checked + label {
    background: rgb(16, 214, 171);
    color: #fff;
    transition: all ease-in-out 0.3s;
}
</style>
  
  
