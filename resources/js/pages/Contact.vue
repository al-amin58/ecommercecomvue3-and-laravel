<template>
  <AppLayout>
    <section class="contact">
        <h2 class="py-24 text-6xl font-bold text-center text-white">Contact US</h2>
    </section>
    <section>
      <div class="container">
        <div class="flex flex-col lg:flex-row ">
          <div class="w-full lg:w-1/2">
            <h2 class="py-16 text-3xl font-bold text-center text-gray-700">Get in Touch</h2>
            <form action="">
              <div>
                <label for="name" ></label>
                <input type="text" name="name" id="name" class="block w-full lg:w-1/2 rounded-md border-0 py-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 px-3 mx-auto mb-10" placeholder="Your Name*">
              </div>
              <div>
                <label for="email" ></label>
                <input type="email" name="email" id="email" class="block w-full lg:w-1/2 rounded-md border-0 py-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 px-3 mx-auto mb-10" placeholder="Your Email*">
              </div>
              <div>
                <label for="message" ></label>
                <textarea id="message" name="message" rows="7" class="focus:ring-purple-500 focus:outline-0 block w-full lg:w-1/2 rounded-md border-0 py-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 px-3 mx-auto mb-10" placeholder="Write Message... "></textarea>
              </div>
              <div class="text-center pt-16">
                <PrimaryButton href="/contact" label="Submit" />
              </div>
            </form>
          </div>
          <div class="w-full lg:w-1/2">
              <div class="py-16">
                <img src="https://images.pexels.com/photos/17485607/pexels-photo-17485607/free-photo-of-an-artist-s-illustration-of-artificial-intelligence-ai-this-image-represents-ai-assitance-in-the-control-systems-needed-to-create-fusion-energy-it-was-created-by-khyati-trehan-as-part.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="">
              </div>
          </div>
        </div>
      </div>
    </section>
  </AppLayout>
</template>

<script setup>


import AppLayout from "@/components/AppLayout.vue";
import PrimaryButton from "@/components/PrimaryButton.vue";

</script>

<style  scoped>
.contact{
  background: url("https://images.pexels.com/photos/19295658/pexels-photo-19295658/free-photo-of-spiral-star-trails.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  @apply bg-no-repeat bg-center bg-cover ;
}
</style>