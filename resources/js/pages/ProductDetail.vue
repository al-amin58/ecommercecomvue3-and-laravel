<template>
  <AppLayout>
    <div class="container">
      <h2 class="font-bold text-[#822EF5] text-3xl pt-16 pb-10">{{product?.title}}</h2>
      <div class="flex flex-col lg:flex-row">
        <div class="w-full lg:w-1/2">
          <div class="flex flex-row flex-wrap ">
            <div class="w-full h-full">
              <Swiper
                  :spaceBetween="40"
                  :centeredSlides="true"
                  :autoplay="{
                  delay: 3000,
                    disableOnInteraction: false,
                  }"
                  :pagination="{
                    clickable: true,
                  }"
                  :modules="modules"
                  class="mySwiper"
              
              >
                <SwiperSlide v-if="product" v-for="image in product.images" :key="image.id">
                  <img class="w-full h-[500px]" :src="image?.url" alt=" no image ..!">
                </SwiperSlide>
              </Swiper>
            </div>
          </div>
        </div>
        <div class="w-full lg:w-1/2">
          <div class="pl-5">
            <RouterLink :to="`/checkout/${product?.id}`">
              <button class="w-full text-white bg-[#3a3047] py-3 rounded mb-5 "><i class="fa-solid fa-download px-3"></i>DOWNLOAD </button>
            </RouterLink>
            <RouterLink :to="`/checkout/${product?.id}`" class="hidden">
              <button class="w-full text-white bg-[#3a3047] py-3 rounded mb-5 "><i class="fa-solid fa-download px-3"></i>Order Now </button>
            </RouterLink>
            <div class="flex flex-col lg:flex-row lg:flex-wrap">
              <div class="w-full lg:w-1/2 p-2">
                <button class="bg-[#E6E6E6] py-2 rounded text-[#822EF5] w-full"><i class="fa-solid fa-heart px-3"></i>LIKE</button>
              </div>
              <div class="w-full lg:w-1/2 p-2">
                <button class="bg-[#E6E6E6] py-2 rounded text-[#822EF5] w-full "><i class="fa-solid fa-share px-3"></i>SHARE</button>
              </div>
              <div class="w-full lg:w-1/2 p-2">
                <button class="bg-[#E6E6E6] py-2 rounded text-[#822EF5] w-full"><i class="fa-solid fa-square-plus px-3"></i>ADD TO</button>
              </div>
              <div class="w-full lg:w-1/2 p-2">
                <button class="bg-[#E6E6E6] py-2 rounded text-[#822EF5] w-full"><i class="fa-brands fa-slack px-3"></i>MAKE</button>
              </div>
            </div>

            <div class="w-full bg-[#E6E6E6] py-8 rounded text-[#822EF5] text-center mt-5">
              <p> <i class="fa-solid fa-wand-magic-sparkles "></i> Advertising</p>
            </div>

            <div class="w-full py-4 rounded text-[#822EF5] text-left mt-5 border-b-2 pl-16">
              <i class="fa-solid fa-star text-xl px-2"></i><i class="fa-solid fa-star text-xl px-2"></i><i class="fa-solid fa-star text-xl px-2"></i><i class="fa-solid fa-star text-xl px-2"></i><i class="fa-solid fa-star text-xl px-2"></i>
            </div>
            <div class="w-full py-4 rounded text-[#822EF5] text-left mt-5 border-b-2 p-6">
              <ul class="flex flex-col lg:flex-row lg:flex-wrap text-gray-700 ">
                <li class="px-3"><i class="fa-regular fa-eye px-1"></i>6.5k views</li>
                <li class="px-3"><i class="fa-solid fa-heart px-1"></i>54 likes</li>
                <li class="px-3"><i class="fa-solid fa-download px-1"></i> 150 downloads</li>
                <li class="px-3"><i class="fa-solid fa-square-plus px-1"></i>2 collections</li>
              </ul>
            </div>

            <div class="flex flex-col lg:flex-row w-full py-4 rounded text-gray-700 text-left mt-5 border-b-2 p-6">
              <div class="w-full lg:w-1/2">
                <ul class="leading-loose">
                  <li>LICENSE</li>
                  <li>3D DESIGN FORMA</li>
                  <li>LAST UPDATE</li>
                  <li>PUBLICATION DATE</li>
                  <li>DESIGN NUMBER</li>
                </ul>
              </div>
              <div class="w-full lg:w-1/2">
                <ul class="leading-loose">
                  <li class="text-[#822EF5]"><i class="fa-regular fa-copyright px-1 text-[#822EF5]"></i>CULTS PU</li>
                  <li>STL Folder Details</li>
                  <li>	2023-10-22 at 19:12</li>
                  <li>2023-07-25 at 16:14</li>
                  <li>  {{product?.category_id}} </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="w-full lg:w-3/4">
        <div class=" py-4 text-left mt-5 p-6">
          <p class="text-black">  
           {{product?.description}} 
          </p>
        </div>
      </div>
    </div>
  </AppLayout>
</template>

<script setup>
import AppLayout from "@/components/AppLayout.vue";
const { loading, error, sendRequest } = useAxios();
import useAxios from "@/composables/useAxios.js"
import { useRoute } from 'vue-router'
import { ref, onMounted } from 'vue'
import {Swiper, SwiperSlide} from "swiper/vue";
import { Autoplay, Navigation } from 'swiper/modules';
import 'swiper/css';
import 'swiper/css/navigation';
const modules = [ Autoplay, Navigation];

const { params } = useRoute();


 const product = ref()

const getProduct = (async () => {

  const response = await sendRequest({
      method: 'get',
      url: `api/products/${params.id} `,
      });
      product.value = response.data;
      // response.data.massage

     
});
onMounted(()=>{
  getProduct()
});
</script>

