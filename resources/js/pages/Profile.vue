<template>
  <AppLayout>
    <section class="profile-banner relative">
      <div class="w-full ">
        <img class="w-40 h-40  rounded-full border-4 absolute top-72 left-16 object-cover" src="https://img.freepik.com/free-photo/smiling-young-brunette-caucasian-man-isolated-pink-wall-with-copy-space_141793-116910.jpg?t=st=1714024662~exp=1714028262~hmac=18502621e6c74420be2552e341f903f09ce97e840a685e9b2278b1449f5e8fb9&w=740" alt="">
      </div>
    </section>
    <section>
      <div class="container">
        <div class="w-full lg:w-1/2">
          <h2 class=" lg:pl-40 lg:pt-8 pt-20 text-gray-700 text-xl lg:text-3xl font-semibold">Mohammad Omar Faruk</h2>
          <p class=" lg:pl-40 lg:pt-3  text-gray-700 text-lg font-light">Dhaka, Bangladesh </p>
        </div>
        <div class="flex flex-col lg:flex-row mt-20">
          <div class="w-full lg:w-2/3">
              <div class="lg:ml-16 ml-4">
                <h2 class=" text-gray-700 text-3xl font-semibold"> About Me </h2>
                <p class="pt-6">Hi, my name is Mohammad Omar Faruk and I am currently in grade 12. I have been at County High
                  School for a year now; I joined at the start of 11th grade, and have thoroughly enjoyed
                  myself here.</p> <p class="pt-6"> The school is great, the people are fantastic and the atmosphere is one that
                  makes you actually want to go to school. Before I joined ASB I was studying at the
                  Singapore American School for two years and prior to that I was at the International
                  School of Kuala Lumpur for two years.</p>

                  <div class=" border-2 border-purple-400 p-8 mt-8">
                    <ul class="flex lg:flex-wrap flex-col lg:flex-row">
                      <li class="w-1/2 pb-2">Name : Mohammad Omar Faruk</li>
                      <li class="w-1/2 pb-2">Phone : 019988 7766 6655</li>
                      <li class="w-1/2 pb-2">Skype:omar.faruk</li>
                      <li class="w-1/2 pb-2">Dribble: faruk.dribble</li>
                      <li class="w-1/2 pb-2">facebook: faruk.facebook</li>
                      <li class="w-1/2 pb-2">Instagram: faruk.instagram</li>
                      <li class="w-1/2 pb-2">Twitter:faruk.twitter</li>
                      <li class="w-1/2">Linkedin:faruk.linkedin</li>
                    </ul>
                  </div>
              </div>
          </div>
        </div>
      </div>
    </section>

    <section >
      <div class="container relative">
        <div class="flex flex-col lg:flex-row">
          <div class="w-full lg:w-1/2 lg:ml-16 ml-5">
            <h2 class="font-bold text-2xl lg:text-5xl text-gray-700  lg:pt-28 pt-10">Latest Products</h2>
            <p class="font-normal lg:text-xl text-lg text-gray-700 pt-8 ">Welcome to Tred 3D Printing and Manufacturing, where we transform your ideas into reality.
              </p>
          </div>
        </div>
        <div class="thunder absolute top-28 left-56"></div>

        <div class="flex flex-col lg:flex-row lg:flex-wrap lg:py-24 py-10 relative z-20 ">
          <ProductCard />
        </div>
      </div>

    </section>

  </AppLayout>

</template>

<script setup>
import AppLayout from "@/components/AppLayout.vue";
import ProductCard from "@/components/ProductCard.vue";

</script>

<style lang="scss" scoped>
.profile-banner{
  background: url("https://images.pexels.com/photos/11403744/pexels-photo-11403744.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  @apply bg-no-repeat bg-center bg-cover h-96;
}

</style>
