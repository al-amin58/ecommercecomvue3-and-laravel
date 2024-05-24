<script setup>
  import SideMenu from '@/components/Dashboard/SideMenu/SideMenu.vue'
  import NavBar from './NavBar.vue'
  
</script>
<template>
    <div class="w-full bg-white flex">
           <aside class="fixed w-[230px] left-0 top-0 bottom-0 drop-shadow-md bg-white max-sm:hidden ">
               <SideMenu/>
           </aside>
           <main class="bg-white ms-[230px] w-full top-0 max-sm:ms-0">
              <header class="max-sm:hidden">
                <NavBar/>
                <!-- <h1>header</h1> -->
              </header>
              <main>
                <slot/>
              </main>
           </main>
    </div>
</template>