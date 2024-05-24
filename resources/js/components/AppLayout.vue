<template>
  <div class="lg:hidden flex items-center justify-between py-3 bg-gray-400 px-2 fixed top-0 left-0 right-0 w-full z-50">
    <a href="/">
      <img src="@/assets/images/logo.png" alt="" class="w-14 mr-3" />
    </a>
    <button @click="toggleNav = !toggleNav">
      <svg v-if="toggleNav" xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24"><path fill="#fff" d="M19 6.41L17.59 5L12 10.59L6.41 5L5 6.41L10.59 12L5 17.59L6.41 19L12 13.41L17.59 19L19 17.59L13.41 12z"/></svg>
      <svg v-else xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24"><path fill="#fff" d="M9 18h12v-2H9zM3 6v2h18V6zm6 7h12v-2H9z"/></svg>
    </button>
  </div>
  <nav class="bg-gray-400 text-white text-xl p-5 font-semibold fixed top-0 right-0 bottom-0 w-80 h-screen z-40 lg:hidden transition-all ease-in-out duration-300" :class="{'translate-x-0': toggleNav, 'translate-x-80': !toggleNav}">
    <ul>
      <li class=" py-2">
        <button><svg viewBox="0 0 512 512" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <title>cancel</title> <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> <g id="work-case" fill="#000000" transform="translate(91.520000, 91.520000)"> <polygon id="Close" points="328.96 30.2933333 298.666667 1.42108547e-14 164.48 134.4 30.2933333 1.42108547e-14 1.42108547e-14 30.2933333 134.4 164.48 1.42108547e-14 298.666667 30.2933333 328.96 164.48 194.56 298.666667 328.96 328.96 298.666667 194.56 164.48"> </polygon> </g> </g> </g></svg></button>
      </li>
      <li class=" py-2">
        <a href="/">Home</a>
      </li>
      <li class=" py-2">
        <a href="/products">Products</a>
      </li>
      <li class=" py-2">
        <a href="/blog">Blogs</a>
      </li>
      <li class=" py-2">
        <a href="/contact">Contact</a>
      </li>
      <li class=" py-2">
        <a href="/profile">Profile</a>
      </li>
      <li v-if="auth?.user?.type === 0"  >
            <RouterLink to="/user/dashbord" class="mt-5 px-3 py-1 relative rounded group font-medium text-white inline-block">
              <span class="absolute top-0 left-0 w-full h-full rounded opacity-50 filter blur-sm bg-gradient-to-br from-purple-600 to-blue-500"></span>
              <span class="h-full w-full inset-0 absolute mt-0.5 ml-0.5 bg-gradient-to-br filter group-active:opacity-0 rounded opacity-50 from-purple-600 to-blue-500"></span>
              <span class="absolute inset-0 w-full h-full transition-all duration-200 ease-out rounded shadow-xl bg-gradient-to-br filter group-active:opacity-0 group-hover:blur-sm from-purple-600 to-blue-500"></span>
              <span class="absolute inset-0 w-full h-full transition duration-200 ease-out rounded bg-gradient-to-br to-purple-600 from-blue-500"></span>
              <div  class="relative">{{auth?.user?.name}}</div>
            </RouterLink>
          </li>
          <li v-else>
            <RouterLink to="/login" class="mt-5 px-3 py-1 relative rounded group font-medium text-white inline-block" >
            <span class="absolute top-0 left-0 w-full h-full rounded opacity-50 filter blur-sm bg-gradient-to-br from-purple-600 to-blue-500"></span>
            <span class="h-full w-full inset-0 absolute mt-0.5 ml-0.5 bg-gradient-to-br filter group-active:opacity-0 rounded opacity-50 from-purple-600 to-blue-500"></span>
            <span class="absolute inset-0 w-full h-full transition-all duration-200 ease-out rounded shadow-xl bg-gradient-to-br filter group-active:opacity-0 group-hover:blur-sm from-purple-600 to-blue-500"></span>
            <span class="absolute inset-0 w-full h-full transition duration-200 ease-out rounded bg-gradient-to-br to-purple-600 from-blue-500"></span>
            <div class="relative"> Login</div>
            </RouterLink>
            <!--        login / register  button design  end-->
          </li>
    </ul>
  </nav>

  <nav class="bg-white hidden lg:block">
    <section class="py-3 bg-primary">
      <div class="container flex justify-between">
        <div class="flex gap-5">
          <p class="text-white text-sm "><i class="fa-solid fa-phone"></i> 0199 9988 9988 </p>
          <p class="text-white text-sm"><i class="fa-solid fa-envelope"></i> creative@gmail.com </p>
        </div>

      </div>
    </section>
    <section>
      <div class="container flex justify-between items-center py-4">
        <ul class="flex flex-col lg:flex-row items-center gap-8 text-gray-600 font-semibold text-center">
          <li>
            <div class="">
              <img class="w-16 h-16 rounded-full border-2 border-primary object-cover" src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="">
            </div>
          </li>
          <li><RouterLink to="/" class="nav-style hover:text-primary">HOME</RouterLink></li>
          <li><RouterLink to="/products" class="nav-style hover:text-primary">PRODUCTS</RouterLink></li>
          <li><RouterLink to="/blog" class="nav-style hover:text-primary">BLOGS</RouterLink></li>
          <li><RouterLink to="/contact" class="nav-style hover:text-primary">CONTACT</RouterLink></li>
          <li><RouterLink to="/profile" class="nav-style hover:text-primary">PROFILE</RouterLink></li>
        </ul>

        <ul class="flex items-center">
          <li><a href=""><i class="fa-brands fa-facebook px-2 text-primary hover:text-[#4267B2] text-lg"></i></a></li>
          <li><a href=""><i class="fa-solid fa-basketball px-2 text-primary hover:text-[#DE0082] text-lg"></i></a></li>
          <li><a href=""><i class="fa-brands fa-square-instagram px-2 text-primary hover:text-[#E1306C] text-lg"></i></a></li>
          <li><a href=""><i class="fa-brands fa-twitter px-2 text-primary hover:text-[#1DA1F2] text-lg pr-6"></i></a></li>
          
          <li v-if="auth?.user?.type === 0">
            <RouterLink to="/user/dashbord" class="px-3 py-1 relative rounded group font-medium text-white inline-block">
              <span class="absolute top-0 left-0 w-full h-full rounded opacity-50 filter blur-sm bg-gradient-to-br from-purple-600 to-blue-500"></span>
              <span class="h-full w-full inset-0 absolute mt-0.5 ml-0.5 bg-gradient-to-br filter group-active:opacity-0 rounded opacity-50 from-purple-600 to-blue-500"></span>
              <span class="absolute inset-0 w-full h-full transition-all duration-200 ease-out rounded shadow-xl bg-gradient-to-br filter group-active:opacity-0 group-hover:blur-sm from-purple-600 to-blue-500"></span>
              <span class="absolute inset-0 w-full h-full transition duration-200 ease-out rounded bg-gradient-to-br to-purple-600 from-blue-500"></span>
              <div  class="relative">{{auth?.user?.name}}</div>
            </RouterLink>
          </li>
          <li v-else  class="pl-6 border-l-2 border-gray-500" >
            <!-- login / register button design -->
            <RouterLink to="/login" class="px-3 py-1 relative rounded group font-medium text-white inline-block" >
            <span class="absolute top-0 left-0 w-full h-full rounded opacity-50 filter blur-sm bg-gradient-to-br from-purple-600 to-blue-500"></span>
            <span class="h-full w-full inset-0 absolute mt-0.5 ml-0.5 bg-gradient-to-br filter group-active:opacity-0 rounded opacity-50 from-purple-600 to-blue-500"></span>
            <span class="absolute inset-0 w-full h-full transition-all duration-200 ease-out rounded shadow-xl bg-gradient-to-br filter group-active:opacity-0 group-hover:blur-sm from-purple-600 to-blue-500"></span>
            <span class="absolute inset-0 w-full h-full transition duration-200 ease-out rounded bg-gradient-to-br to-purple-600 from-blue-500"></span>
            <div class="relative"> Login</div>
            </RouterLink>
            <!--        login / register  button design  end-->
          </li>
          
        </ul>
      </div>
    </section>
  </nav>

  <slot />
<!--footer design-->
    <footer class="footer-sec-top bg-white">
      <div class="container">
        <h2 class="text-center text-primary text-3xl font-extrabold p-16">How to Mechatronics</h2>
        <div class="flex flex-col lg:flex-row">
          <div class="w-full lg:w-1/4">
            <div class="text-left text-gray-600 lg:border-gray-600 mb-8 lg:my-10">
              <h2 class="text-3xl font-semibold pl-8">Tred Inc.</h2>
              <p class="text-gray-600 p-10">Lorem ipsum dolor simet and it is a long established fact that a reader will be distracted.</p>
              <div class="pl-8">
                <input class="shadow-purple-300 shadow-lg pl-2 rounded" type="email" name="email" id="email" placeholder=" Your Email ">
              </div>
              <div class="my-10 text-center ">
                <PrimaryButton href="/contact" label="Subscribe" />
              </div>
            </div>
          </div>

          <div class="w-full lg:w-1/4">
            <div class="text-center text-gray-600 lg:border-gray-600 mb-8 lg:my-10">
              <h2 class="text-3xl font-semibold pb-8">Menu</h2>
              <ul class="text-left max-w-16 mx-auto">
                <li class="pb-8 text-gray-700 hover:text-primary font-medium ">
                  <a href="/">HOME</a></li>
                <li class="pb-8 text-gray-700 hover:text-primary font-medium"><a href="/products">PRODUCTS</a></li>
                <li class=" pb-8 text-gray-700 hover:text-primary font-medium"><a href="/blog">BLOG</a></li>
                <li class=" pb-8 text-gray-700 hover:text-primary font-medium"><a href="/contact">CONTACT</a></li>
                <li class=" pb-8 text-gray-700 hover:text-primary font-medium"><a href="/profile">PROFILE</a></li>
              </ul>
            </div>
          </div>

          <div class="w-full lg:w-1/4">
            <div class="text-center text-gray-600  mb-8 lg:my-10">
              <h2 class="text-3xl font-semibold pb-8">Socials</h2>
              <ul class="text-left max-w-32 mx-auto">
                <li class="pb-8"><a href="#"><i class="fa-brands fa-facebook px-2 text-primary hover:text-[#4267B2] text-lg"></i></a>Facebook</li>
                <li class="pb-8"><a href="#"><i class="fa-solid fa-basketball px-2 text-primary hover:text-[#DE0082] text-lg"></i></a>Dribbble</li>
                <li class="pb-8"><a href="#"><i class="fa-brands fa-square-instagram px-2 text-primary hover:text-[#E1306C] text-lg"></i></a>Instagram</li>
                <li><a href="#"><i class="fa-brands fa-twitter px-2 text-primary hover:text-[#1DA1F2] text-lg"></i></a>Twitter</li>
              </ul>
            </div>
          </div>

          <div class="w-full lg:w-1/4">
            <div class="text-center text-gray-600 mb-8 lg:my-10">
              <h2 class="text-3xl font-semibold pb-8">Contact</h2>

              <a class="block" href="tel:0145678978">  1 800 123 4567</a>
                <a class="block" href="mailto:email@email.com">info@example.com</a>
              <address>
                1122 Potter Rd, Antelope,
                CA 32802
              </address>

            </div>
          </div>

        </div>
      </div>


      <!--Footer Border-->


    <section class="footer-style bg-gray-500  border-gray-400 ">
      <div class="container py-2 pt-3 lg:justify-between flex flex-col lg:flex-row text-center">

        <p class="text-white"> &copy; 2024 How to Mechatronics. All Rights Reserved. </p>

        <p class="text-white"><a class="text-white "  target="_blank" href="https://creativetechpark.com/">Web Development Company </a> Creative Tech Park </p>

      </div>
    </section>
  </footer>

</template>

<script setup>
import PrimaryButton from "@/components/PrimaryButton.vue";
import {useAuthStore} from "@/stores/useAuthStore.js";
import {ref, onMounted, onBeforeUnmount} from 'vue'

const auth = useAuthStore();


const isScrolled = ref(false);

const toggleNav = ref(false);
const handleScroll = () => {
  isScrolled.value = window.scrollY > 30;
};

const getUser = ref()

onMounted(() => {
  window.addEventListener('scroll', handleScroll);
});

onBeforeUnmount(() => {
  window.removeEventListener('scroll', handleScroll);
});
</script>

<style scoped>
.scrolled{
  background: rgba(0,0,0, 0.7);

  transition: all 0.8s ease;
}
</style>