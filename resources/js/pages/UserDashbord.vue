<script setup>
  import AppLayout from "@/components/AppLayout.vue";
import {useAuthStore} from "@/stores/useAuthStore.js";
import { useRouter } from "vue-router";
import useAxios from "@/composables/useAxios.js"
import { ref, onMounted } from "vue";

const { loading, error, sendRequest } = useAxios();

const auth = useAuthStore();
const router = useRouter();
const handelLogout =  ()=>{
    auth.logout();
    router.push({ path: "/" });
}


// Address model

const isModel =ref(false)

//Address add

const form = ref({
    fullname:null,
    address:null,
    email: null,
    phone:null,
    city:null,
    state:null,
    zipcode:null,
    user_id:auth?.user?.id
});
const submitForm = async () =>{
   
    const response = await sendRequest({
        method:'POST',
        url:'/api/address',
        data: form.value,
    });
    reset()
    
}

const reset= () => {
    form.value.fullname=null,
    form.value.address=null,
    form.value.email=null,
    form.value.phone=null,
    form.value.city=null,
    form.value.state=null,
    form.value.zipcode=null
}


</script>
<template>
    <AppLayout>
      <section class="container md:mt-28 max-sm:mt-28">
        <h2 class="font-extrabold text-xl text-primary drop-shadow-2xl">Well come... {{auth?.user?.name}}</h2>
        <div class=" min-h-20 content-center align-middle me-5 mt-10 ">
            <span class="relative inline-flex  ">
                <img src="@/assets/images/user-profile.jpg" class=" max-sm:h-16 max-sm:w-16 h-20 w-20 flex justify-center items-center text-primary border border-primary rounded-full  cursor-pointer">
                <span class="flex absolute h-3 w-3 top-0 right-0 mt-2 ">
                <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-sky-400 opacity-75"></span>
                <span class="relative inline-flex rounded-full h-3 w-3 bg-sky-500"></span>
                </span>
            </span>
        </div>
       <div class="max-sm:w-full flex gap-5 mt-5 ms-10 mb-10 max-sm:ms-0 max-sm:grid max-sm:grid-cols-2 max-sm:gap-4">
            <RouterLink to="/user/customerorderlist" class=" max-sm:w-36 grid justify-items-center w-44 rounded-lg p-5 bg-white   drop-shadow-lg">
                <svg class="w-10 text-primary " xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24"><path fill="currentColor" d="M3 21V3h18v18zm16-2v-6h-6v6zm0-14h-6v6h6zM5 5v6h6V5zm0 14h6v-6H5z"></path></svg>
                <h3 class="text-xl font-semibold">Order</h3> 
           </RouterLink>
            <button href="#" class="max-sm:w-36 grid justify-items-center w-44 rounded-lg p-5 bg-white   drop-shadow-lg">
                <svg class="w-10 text-primary" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24"><path fill="currentColor" d="m9.25 22l-.4-3.2q-.325-.125-.612-.3t-.563-.375L4.7 19.375l-2.75-4.75l2.575-1.95Q4.5 12.5 4.5 12.338v-.675q0-.163.025-.338L1.95 9.375l2.75-4.75l2.975 1.25q.275-.2.575-.375t.6-.3l.4-3.2h5.5l.4 3.2q.325.125.613.3t.562.375l2.975-1.25l2.75 4.75l-2.575 1.95q.025.175.025.338v.674q0 .163-.05.338l2.575 1.95l-2.75 4.75l-2.95-1.25q-.275.2-.575.375t-.6.3l-.4 3.2zm2.8-6.5q1.45 0 2.475-1.025T15.55 12t-1.025-2.475T12.05 8.5q-1.475 0-2.488 1.025T8.55 12t1.013 2.475T12.05 15.5"></path></svg>
                <h3 class="text-xl font-semibold">Setting</h3> 
            </button>
            <button @click="isModel = true" class=" max-sm:w-36 grid justify-items-center w-44 rounded-lg p-5 bg-white   drop-shadow-lg">
                <svg  class="w-10 text-primary" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 512 512"><path fill="currentColor" d="M496 144.768v-33.536h-39.232V42a25 25 0 0 0-25.179-24.768H80.411A25 25 0 0 0 55.232 42v430a25 25 0 0 0 25.179 24.768h351.178A25 25 0 0 0 456.768 472v-71.232H496v-33.536h-39.232v-94.464H496v-33.536h-39.232v-94.464Zm-72.768 94.464H376v33.536h47.232v94.464H376v33.536h47.232v62.464H88.768V50.768h334.464v60.464H376v33.536h47.232Z"></path><path fill="currentColor" d="m313.639 306.925l-28.745-18.685l13.82-33.655v-52.871a65.714 65.714 0 1 0-131.428 0v52.557l12.721 34.684l-27.646 17.97A48.972 48.972 0 0 0 130 348.129V400h206v-51.871a48.972 48.972 0 0 0-22.361-41.204M304 368H162v-19.871a17.084 17.084 0 0 1 7.8-14.373l49.033-31.872l-19.547-53.3v-46.87a33.714 33.714 0 0 1 67.428 0v46.557l-21.5 52.347l50.986 33.138a17.084 17.084 0 0 1 7.8 14.373Z"></path></svg>
                <h3 class="text-xl font-semibold">Address</h3> 
            </button>
            <button @click="handelLogout()" class=" max-sm:w-36 grid justify-items-center w-44 rounded-lg p-5 bg-white   drop-shadow-lg">
                <svg class="w-10" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 50 50"><g fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path stroke="#344054" d="M43.75 25h-25m8.333-8.333L18.75 25l8.333 8.333"></path><path stroke="#306CFE" d="M25 43.75c10.355 0 18.75-8.395 18.75-18.75S35.355 6.25 25 6.25S6.25 14.645 6.25 25S14.645 43.75 25 43.75"></path></g></svg>
                <h3 class="text-xl font-semibold">Logout</h3> 
            </button>
       
       </div>

      </section>

      <!------------------User Address popup model -------------------------->

      <div  v-if="isModel"   class="model fixed  z-50 inset-0 bg-gray-900 bg-opacity-60 overflow-y-auto h-full w-full ">
            <div class="relative top-40  mx-auto shadow-xl rounded-md bg-white w-1/3 md:w-2/4 max-sm:w-4/5 ">

                <div class="flex justify-end p-2">
                    <button  @click="isModel = false" type="button"
                        class="text-red-400 bg-transparent hover:bg-gray-200 hover:text-red-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                clip-rule="evenodd"></path>
                        </svg>
                    </button>
                </div>
                
                <div  >
                    <div class=" mt-3 px-5 mx-auto   bg-white"> 
                        <h2 class="font-bold text-2xl text-center text-primary mb-5">New Address</h2>
                    
                        <div class="form-item h-20  md:h-14  max-sm:h-10  ">
                            <input v-model="form.fullname" type="text" class=" font-sans h-10 rounded-md border border-gray-400 p-3 placeholder-black"   placeholder="Full Name" />
                        </div> 
                        <div class="form-item h-20 md:h-14 max-sm:h-10  max-sm:mt-1">
                            <input v-model="form.address" type="text" class=" font-sans h-10 rounded-md border border-gray-400 p-3 placeholder-black"   placeholder="Address" />
                        </div> 
                        <div class="form-item h-20 md:h-14 max-sm:h-10 max-sm:mt-1 ">
                            <input v-model="form.email" type="email" class=" font-sans h-10 rounded-md border border-gray-400 p-3 placeholder-black"  placeholder="Email" />
                        </div> 
                        <div class="max-lg:flex  gap-5 max-sm:gap-1 max-sm:flex md:flex max-lg:w-full ">
                                <div class="form-item h-20 md:h-14 mt-2 max-sm:h-10 max-sm:mt-2  md:mt-2 ">
                                    <input v-model="form.city" type="text" class=" font-sans h-10 rounded-md border border-gray-400 p-3 placeholder-black"   placeholder="City" />
                                </div> 
                                <div class="form-item h-20 md:h-14 mt-2 max-sm:h-10 max-sm:mt-2  md:mt-2 ">
                                    <input v-model="form.state" type="text" class=" font-sans h-10 rounded-md border border-gray-400 p-3 placeholder-black"   placeholder="State" />
                                </div> 
                                <div class="form-item h-20 md:h-14 mt-2 md:mt-2 max-sm:h-10 max-sm:mt-2 ">
                                    <input v-model="form.zipcode" type="text" class=" font-sans h-10 rounded-md border border-gray-400 p-3 placeholder-black"   placeholder="Zip code" />
                                </div> 
                          
                        </div>
                    
                        <div class="form-item h-20 md:h-14 max-sm:mt-2">
                            <input v-model="form.phone" type="number" class=" font-sans h-10 rounded-md border border-gray-400 p-3 placeholder-black"   placeholder="Phone Number" />
                        </div> 
                        <div class="mt-5 max-sm:mt-2 pb-5">
                            <button v-on:click="submitForm()" type="submit" class=" flex justify-center items-center font-sans p-2 rounded-3xl text-lg w-32 h-10 bg-primary hover:bg-purple-900 text-white">Submit</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </AppLayout>
  
  </template>
 
  
  
