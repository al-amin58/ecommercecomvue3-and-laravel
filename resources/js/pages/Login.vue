<template>
  <AppLayout>
    <div class="bg-[url('https://img.freepik.com/free-vector/dark-wavy-colors-background_23-2148403785.jpg?w=740&t=st=1715430584~exp=1715431184~hmac=92f39c9ce57753407e3f1f7ab4e004e97a5607328321a0894fa0011a426812c8')]
            w-full h-screen bg-no-repeat bg-center bg-cover flex justify-center items-center">
        <div class="w-full max-w-xs bg-white rounded-lg">
          <h2 class="text-center text-gray-700 font-bold text-2xl py-10">Login</h2>
          <div class="px-8">
          <form @submit.prevent="onLogin">
            <div>
              <label  class="block pb-3" >email</label>
              <input type="email" v-model="form.email"  class="block w-full rounded-md border-0 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 px-3 mb-6 autofill:" placeholder="Your Email">
              <!-- <small class="text-danger" v-if="auth.error?.data?.errors?.email">{{ auth.error?.data?.errors?.email[0] }}</small> -->
            </div>
            <div>
              <label  class="block pb-3">Password</label>
              <input type="password"  v-model="form.password"  class="block w-full rounded-md border-0 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 px-3 mb-6 autofill:" placeholder="Your Password">
              <!-- <small class="text-danger" v-if="auth.error?.data?.error?.password">{{ auth.error?.data?.error?.password[0] }}</small> -->
            </div>
          
            <div class="text-center py-5">
              <button  type="submit" class="relative px-5 py-3 font-medium text-white group inline-block">
                <span :class="`absolute inset-0 w-full h-full transition-all duration-300 ease-out transform translate-x-0 -skew-x-12 bg-purple-500 group-hover:bg-purple-700 group-hover:skew-x-12`"></span>
                <span :class="`absolute inset-0 w-full h-full transition-all duration-300 ease-out transform skew-x-12 bg-purple-700 group-hover:bg-purple-500 group-hover:-skew-x-12`"></span>
                <span :class="`absolute bottom-0 left-0 hidden w-10 h-20 transition-all duration-100 ease-out transform -translate-x-8 translate-y-10 bg-purple-600 -rotate-12`"></span>
                <span :class="`absolute bottom-0 right-0 hidden w-10 h-20 transition-all duration-100 ease-out transform translate-x-10 translate-y-8 bg-purple-400 -rotate-12`"></span>
                <span class="relative">Log In</span>
              </button>
            </div>
          </form>
            <p class="font-light text-sm p-3 text-center">Don't Have an Account ?
              <RouterLink to="/register" class="flex items-center justify-center hover:text-primary hover:font-semibold">Create Account
                <vue-feather type="user" size="18" class="text-primary ring-1 ring-purple-500 rounded-full ml-3"></vue-feather>
              </RouterLink>
            </p>
         
          </div>
          
        
        </div>

    </div>
  </AppLayout>
</template>

<script setup>

import AppLayout from "@/components/AppLayout.vue";
import useAxios from "@/composables/useAxios"
import { ref, onMounted } from 'vue'
import {useAuthStore} from "@/stores/useAuthStore.js";
import { useRouter } from "vue-router";
const { loading, error, sendRequest } = useAxios();


const auth = useAuthStore();
const router = useRouter();

const form = ref({
  email: null,
  password: null,
});

const onLogin = async () => {
  auth.error = null;
  try {
    await auth.login(form.value);
    if(auth?.user?.type ===1){
      await router.push({ path: "/dashboard" });
    }else{
      await router.push({ path: "/" });
    }
    
  } catch (error) {
    console.error("Error during login:", error);
  }
}


</script>

<style scoped>

</style>
 