<template>
  <AppLayout>

    <section>
        <div class="flex flex-col lg:flex-row ">
            <div class="w-full lg:w-5/6 lg:ml-20 relative">
              <h2 class="font-bold text-2xl lg:text-5xl text-gray-700 mt-20  text-center lg:text-left  ">
                We welcome a new <br> era of 3D printing <br> with Tred.
              </h2>
              <p class="py-8 text-gray-500 ml-5">Welcome to Tred 3D Printing and Manufacturing, where we transform your <br>
                ideas into reality. We are committed to provide a range of services.</p>
                <div class="py-8 text-gray-700 ml-5">
                  <ul class="list-[square]">
                    <li>Rapid Prototyping - We offer rapid prototyping.</li>
                    <li> Large-Scale Manufacturing - Lorem ipsum dolor simet.</li>
                    <li>Small-Batch Production - We offer small batch production.</li>
                  </ul>
                </div>
                <div class="thunder absolute lg:right-8 right-0 lg:bottom-24 bottom-0"></div>


              <div class="my-10 ml-5">
                <PrimaryButton href="/contact" label="Learn More" />
              </div>

            </div>

          <div class=" w-full lg:w-1/2">
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
                    <SwiperSlide><img class="w-full h-full" src="https://images.pexels.com/photos/4485456/pexels-photo-4485456.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt=" "></SwiperSlide>
                    <SwiperSlide><img class="w-full h-full" src="https://images.pexels.com/photos/8865186/pexels-photo-8865186.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt=""></SwiperSlide>
                    <SwiperSlide><img class="w-full h-full" src="https://images.pexels.com/photos/7789669/pexels-photo-7789669.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt=""></SwiperSlide>
                    <SwiperSlide><img class="w-full h-full" src="https://images.pexels.com/photos/14596555/pexels-photo-14596555.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt=""></SwiperSlide>
                  </Swiper>

                </div>
              </div>
          </div>

        </div>
    </section>

    <section>
      <div class="container mb-16">
        <div class="flex flex-col lg:flex-row pt-20 gap-8">
          <div class="w-full lg:w-1/4">
            <div class="text-center">
              <vue-feather type="package" size="70" class="text-primary mt-6" animation="spin" animation-speed="slow"></vue-feather>
              <h2 class="text-2xl text-gray-700 pt-2 font-semibold">3D Printing </h2>
              <p class="text-blue-700 pt-2">-> FDM, SLA, and SLS </p>
              <p class="pt-2 text-gray-700">High-quality parts and products using materials like plastics,
                metals, and ceramics.</p>
                <!-- <button >-->
               <div class="py-6">
                 <a href="#" class="relative inline-flex items-center justify-start px-5 py-2 overflow-hidden font-medium transition-all bg-primary  group">
                    <span class="absolute top-0 right-0 inline-block w-4 h-4 transition-all duration-500 ease-in-out bg-purple-500  group-hover:-mr-4 group-hover:-mt-4">
                    <span class="absolute top-0 right-0 w-5 h-5 rotate-45 translate-x-1/2 -translate-y-1/2 bg-white"></span>
                   </span>
                   <span class="absolute bottom-0 left-0 w-full h-full transition-all duration-500 ease-in-out delay-200 -translate-x-full translate-y-full bg-purple-500  group-hover:mb-12 group-hover:translate-x-0"></span>
                   <span class="relative w-full text-left text-white transition-colors duration-200 ease-in-out group-hover:text-white">Learn More</span>
                 </a>
               </div>
            </div>
          </div>
          <div class="w-full lg:w-1/4">
            <div class=" text-center">
              <vue-feather type="command" size="70" class="text-primary mt-6" animation="spin" animation-speed="slow"></vue-feather>
              <h2 class="text-2xl text-gray-700 pt-2 font-semibold">Rapid Prototyping.</h2>
              <p class="text-blue-700 pt-2">-> FDM, SLA, and SLS </p>
              <p class="pt-2 text-gray-700">High-quality parts and products using materials like plastics,
                metals, and ceramics.</p>
                <!-- <button >-->
               <div class="py-6">
                 <a href="#" class="relative inline-flex items-center justify-start px-5 py-2 overflow-hidden font-medium transition-all bg-primary  group">
                    <span class="absolute top-0 right-0 inline-block w-4 h-4 transition-all duration-500 ease-in-out bg-purple-500  group-hover:-mr-4 group-hover:-mt-4">
                    <span class="absolute top-0 right-0 w-5 h-5 rotate-45 translate-x-1/2 -translate-y-1/2 bg-white"></span>
                   </span>
                   <span class="absolute bottom-0 left-0 w-full h-full transition-all duration-500 ease-in-out delay-200 -translate-x-full translate-y-full bg-purple-500  group-hover:mb-12 group-hover:translate-x-0"></span>
                   <span class="relative w-full text-left text-white transition-colors duration-200 ease-in-out group-hover:text-white">Learn More</span>
                 </a>
               </div>
            </div>
          </div>
          <div class="w-full lg:w-1/4">
            <div class=" text-center">
              <vue-feather type="slack" size="70" class="text-primary mt-6" animation="spin" animation-speed="slow"></vue-feather>
              <h2 class="text-2xl text-gray-700 pt-2 font-semibold">Product Testing.</h2>
              <p class="text-blue-700 pt-2">-> FDM, SLA, and SLS </p>
              <p class="pt-2 text-gray-700">High-quality parts and products using materials like plastics,
                metals, and ceramics.</p>
                <!-- <button >-->
               <div class="py-6">
                 <a href="#" class="relative inline-flex items-center justify-start px-5 py-2 overflow-hidden font-medium transition-all bg-primary  group">
                    <span class="absolute top-0 right-0 inline-block w-4 h-4 transition-all duration-500 ease-in-out bg-purple-500  group-hover:-mr-4 group-hover:-mt-4">
                    <span class="absolute top-0 right-0 w-5 h-5 rotate-45 translate-x-1/2 -translate-y-1/2 bg-white"></span>
                   </span>
                   <span class="absolute bottom-0 left-0 w-full h-full transition-all duration-500 ease-in-out delay-200 -translate-x-full translate-y-full bg-purple-500  group-hover:mb-12 group-hover:translate-x-0"></span>
                   <span class="relative w-full text-left text-white transition-colors duration-200 ease-in-out group-hover:text-white">Learn More</span>
                 </a>
               </div>
            </div>
          </div>
          <div class="w-full lg:w-1/4">
            <div class=" text-center">
              <vue-feather type="move" size="70" class="text-primary mt-6" animation="spin" animation-speed="slow"></vue-feather>
              <h2 class="text-2xl text-gray-700 pt-2 font-semibold">Quality Control.</h2>
              <p class="text-blue-700 pt-2">-> FDM, SLA, and SLS </p>
              <p class="pt-2 text-gray-700">High-quality parts and products using materials like plastics,
                metals, and ceramics.</p>
                <!-- <button >-->
               <div class="py-6">
                 <a href="#" class="relative inline-flex items-center justify-start px-5 py-2 overflow-hidden font-medium transition-all bg-primary  group">
                    <span class="absolute top-0 right-0 inline-block w-4 h-4 transition-all duration-500 ease-in-out bg-purple-500  group-hover:-mr-4 group-hover:-mt-4">
                    <span class="absolute top-0 right-0 w-5 h-5 rotate-45 translate-x-1/2 -translate-y-1/2 bg-white"></span>
                   </span>
                   <span class="absolute bottom-0 left-0 w-full h-full transition-all duration-500 ease-in-out delay-200 -translate-x-full translate-y-full bg-purple-500  group-hover:mb-12 group-hover:translate-x-0"></span>
                   <span class="relative w-full text-left text-white transition-colors duration-200 ease-in-out group-hover:text-white">Learn More</span>
                 </a>
               </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section>
      <div class="container relative">
        <div class="flex flex-col lg:flex-row pt-16 gap-20">
          <div class="w-full lg:w-1/2">
            <div class=" w-full lg:w-4/6 ml-auto shadow-purple-500 shadow-lg">
              <div class="thunder absolute top-3 left-36"></div>
              <img class="w-full h-[600px]" src="https://images.pexels.com/photos/1007066/pexels-photo-1007066.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="">
            </div>
          </div>
          <div class="w-full lg:w-1/2">
            <div>
              <h2 class="font-bold text-5xl text-gray-700 text-left pb-12">About </h2>
              <p class="font-normal text-gray-600 ">Welcome to Tred 3D Printing and Manufacturing, where we transform your ideas into reality.
                We are committed to provide a range of services.</p>
              <div class="thunder absolute "></div>
              <p class="ml-28 py-5 text-gray-600">There are many variations of passages of Lorem Ipsum available, but the majority have suffered
                alteration in some form, by injected humour, or randomised words which don't look even slightly
                believable. If you are going to use a passage of Lorem Ipsum.</p>
              <p class="py-5 text-gray-600">
                Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of
                the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the
                cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes
                from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and
                Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular
                during the Renaissance.
              </p>
              <h2 class="font-medium text-xl text-gray-700 pt-8">Welcome to Tred 3D Printing and Manufacturing, where we transform your ideas into reality. </h2>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section >
      <div class="container relative">
        <div class="flex flex-col lg:flex-row">
          <div class="w-full lg:w-1/2 mx-auto">
            <h2 class="font-bold text-5xl text-gray-700 text-center pt-28">Latest Products</h2>
            <p class="font-normal text-xl text-gray-700 pt-8 text-center">Welcome to Tred 3D Printing and Manufacturing, where we transform your ideas into reality.
              We are committed to provide a range of services.</p>
          </div>
        </div>
        <div class="thunder absolute lg:top-28 lg:left-56 top-0"></div>
        <div class="pt-24 relative z-20 ">
         <ProductCard />
        </div>
        <div class="flex justify-center items-center mt-10 mb-20">
          <RouterLink to="/products" class=" w-40 relative px-5 py-3 font-medium text-white group inline-block">
            <span :class="`absolute inset-0 w-full h-full transition-all duration-300 ease-out transform translate-x-0 -skew-x-12 bg-purple-500 group-hover:bg-purple-700 group-hover:skew-x-12`"></span>
            <span :class="`absolute inset-0 w-full h-full transition-all duration-300 ease-out transform skew-x-12 bg-purple-700 group-hover:bg-purple-500 group-hover:-skew-x-12`"></span>
            <span :class="`absolute bottom-0 left-0 hidden w-10 h-20 transition-all duration-100 ease-out transform -translate-x-8 translate-y-10 bg-purple-600 -rotate-12`"></span>
            <span :class="`absolute bottom-0 right-0 hidden w-10 h-20 transition-all duration-100 ease-out transform translate-x-10 translate-y-8 bg-purple-400 -rotate-12`"></span>
            <span class="relative flex justify-center items-center uppercase">View All </span>
          </RouterLink>
        </div>
      </div>

    </section>
    <section>
      <div class="container relative">
        <div class="flex flex-col lg:flex-row">
          <div class="w-full lg:w-1/2 mx-auto">
            <h2 class="font-bold text-5xl text-gray-700 text-center">Latest Blogs</h2>
            <p class="font-normal text-xl text-gray-700 pt-8 text-center">Welcome to Tred 3D Printing and Manufacturing, where we transform your ideas into reality.
              We are committed to provide a range of services.</p>
          </div>
        </div>
        <div class="thunder absolute lg:top-0 lg:right-56 left-0 -top-32"></div>
        <div class=" pt-24 relative z-20">
           <BlogCard />
        </div>
        <div class="flex justify-center items-center mt-10 mb-20">
          <RouterLink to="/blog" class=" w-40 relative px-5 py-3 font-medium text-white group inline-block">
            <span :class="`absolute inset-0 w-full h-full transition-all duration-300 ease-out transform translate-x-0 -skew-x-12 bg-purple-500 group-hover:bg-purple-700 group-hover:skew-x-12`"></span>
            <span :class="`absolute inset-0 w-full h-full transition-all duration-300 ease-out transform skew-x-12 bg-purple-700 group-hover:bg-purple-500 group-hover:-skew-x-12`"></span>
            <span :class="`absolute bottom-0 left-0 hidden w-10 h-20 transition-all duration-100 ease-out transform -translate-x-8 translate-y-10 bg-purple-600 -rotate-12`"></span>
            <span :class="`absolute bottom-0 right-0 hidden w-10 h-20 transition-all duration-100 ease-out transform translate-x-10 translate-y-8 bg-purple-400 -rotate-12`"></span>
            <span class="relative flex justify-center items-center uppercase">View All </span>
          </RouterLink>
        </div>
      </div>
    </section>

    <section class="back-img">
      <div class="container relative">
        <div class="flex flex-col lg:flex-row ">
          <div class="thunder absolute -top-36"></div>
          <div class="w-full lg:w-1/2 mx-auto">
            <div class="lg:py-20">
              <h2  class="font-bold text-2xl lg:text-4xl text-white text-center py-12">Get your ideas into the real world with Tred today!</h2>
              <p class="font-normal text-white text-center lg:text-lg">Welcome to Tred 3D Printing and Manufacturing, where we transform your ideas into reality.
                We are committed to provide a range of services.</p>
              <div class="my-10 text-center ">
                <PrimaryButton href="/contact" label="Get An Instant Quote" />
              </div>

            </div>
          </div>
          <div class="thunder absolute right-0 -bottom-28"></div>
        </div>
      </div>
    </section>

  </AppLayout>

</template>

<script setup>
import AppLayout from "@/components/AppLayout.vue";
import ProductCard from "@/components/ProductCard.vue";
import PrimaryButton from "@/components/PrimaryButton.vue";
import {Swiper, SwiperSlide} from "swiper/vue";
import { Autoplay, Navigation } from 'swiper/modules';
import 'swiper/css';
import 'swiper/css/navigation';
import BlogCard from "@/components/BlogCard.vue";


const modules = [ Autoplay, Navigation];
</script>

<style scoped>
.thunder {
  height: 190px; /* control the size */
  aspect-ratio: 0.56;
  clip-path: polygon(100% 0, 23% 46%, 46% 44%, 15% 69%, 38% 67%, 0 100%, 76% 57%, 53% 58%, 88% 33%, 60% 37%);
 @apply bg-primary;
}
.back-img{
  background: url("https://images.pexels.com/photos/8657160/pexels-photo-8657160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  @apply bg-no-repeat bg-center bg-cover h-[500px] bg-fixed;
}
</style>
