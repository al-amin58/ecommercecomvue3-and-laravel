<template>
  <AppLayout>
    <div class="bg-[url('https://img.freepik.com/free-vector/dark-wavy-colors-background_23-2148403785.jpg?w=740&t=st=1715430584~exp=1715431184~hmac=92f39c9ce57753407e3f1f7ab4e004e97a5607328321a0894fa0011a426812c8')]
            w-full h-screen bg-no-repeat bg-center bg-cover flex justify-center items-center">
      <div class="w-full max-w-xs bg-white rounded-lg">
        <h2 class="text-center text-gray-700 font-bold text-2xl py-10">Registration</h2>
        <div class="px-8">

          <div>
            <label for="name" class="block pb-3">Name</label>
            <input type="text" name="name" v-model="form.name" id="name" class="block w-full rounded-md border-0 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 px-3 mb-6" placeholder="Your Name">
          </div>

          <div>
            <label for="email" class="block pb-3" >Email</label>
            <input type="email" name="email" v-model="form.email" id="email" class="block w-full rounded-md border-0 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 px-3 mb-6" placeholder="Your Email">
          </div>
          <div>
            <label for="password" class="block pb-3">Password</label>
            <input type="password" name="password" v-model="form.password" id="password" class="block w-full rounded-md border-0 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 px-3 mb-6" placeholder="Your Password">
          </div>

          <div class="text-center py-5">
            <button @click="onLogin()" type="submit" class="relative px-5 py-3 font-medium text-white group inline-block">
                <span :class="`absolute inset-0 w-full h-full transition-all duration-300 ease-out transform translate-x-0 -skew-x-12 bg-purple-500 group-hover:bg-purple-700 group-hover:skew-x-12`"></span>
                <span :class="`absolute inset-0 w-full h-full transition-all duration-300 ease-out transform skew-x-12 bg-purple-700 group-hover:bg-purple-500 group-hover:-skew-x-12`"></span>
                <span :class="`absolute bottom-0 left-0 hidden w-10 h-20 transition-all duration-100 ease-out transform -translate-x-8 translate-y-10 bg-purple-600 -rotate-12`"></span>
                <span :class="`absolute bottom-0 right-0 hidden w-10 h-20 transition-all duration-100 ease-out transform translate-x-10 translate-y-8 bg-purple-400 -rotate-12`"></span>
                <span class="relative">Register</span>
              </button>
          </div>

          <p class="font-light text-sm p-3 text-center">Already Have an Account?
            <RouterLink to="/login" class="flex items-center justify-center hover:font-semibold hover:text-primary ">Login
              <vue-feather type="log-in" size="18" class="text-primary"></vue-feather>
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
import { ref } from 'vue'
import { useRouter } from "vue-router";

const { loading, error, sendRequest } = useAxios();

const form = ref({
  name: null,
  email: null,
  password: null
});
const router = useRouter();

const onLogin = async () => {
const response = await sendRequest({
      method: 'POST',
      url: '/api/register',
      data: form.value
  });
  router.push('/login')
};

</script>

<style lang="scss" scoped>

</style>