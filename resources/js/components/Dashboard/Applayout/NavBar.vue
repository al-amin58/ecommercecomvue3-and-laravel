<script setup>

import useAxios from "@/composables/useAxios"
import { ref,onMounted } from 'vue'
import { useRouter } from "vue-router";
import {useAuthStore} from "@/stores/useAuthStore.js";
const { loading, error, sendRequest } = useAxios();

const router = useRouter();

const auth = useAuthStore();
const handelLogout =  ()=>{
    auth.logout();
    router.push({ path: "/" });
}

import { Menu, MenuButton, MenuItem, MenuItems } from '@headlessui/vue'

 const profile = ref({
    url:'https://imgs.search.brave.com/yNv0_T8qGn81mq-deafGOVoeWCI76kq08bi2uc7JTms/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTQ3/NjE3MDk2OS9waG90/by9wb3J0cmFpdC1v/Zi15b3VuZy1tYW4t/cmVhZHktZm9yLWpv/Yi1idXNpbmVzcy1j/b25jZXB0LmpwZz9z/PTYxMng2MTImdz0w/Jms9MjAmYz13OFNs/S3YtNHU2eFl5VTA3/Q1hlQlJ2Zlc2RjBp/WXgtYTdIUjJDaE04/WmJVPQ',
 }
)



const orders = ref(null);
const getOrder = (async () =>{
  const response = await sendRequest({
   method: 'get',
   url:'/api/orders',
  });
  orders.value = response.data;
});

onMounted(() =>{
 getOrder()
});
</script>
<template>
    <div class="bg-white shadow-sm flex flex-row-reverse min-h-20 content-center align-middle ">
        <div class="flex ">
            <div class="min-h-20  content-center align-middle me-5 font-bold text-3xl ">
                <p class="w-60 max-sm:hidden h-10 font-light font-sans text-base border border-primary rounded-3xl flex justify-center items-center">{{new Date().toLocaleString()}}</p>
            </div>
            <div class=" min-h-20 content-center align-middle me-5  ">
                <Menu as="div" class="relative inline-block text-left">
                    <div>
                        
                        <MenuButton class="h-10 w-10 relative inline-flex justify-center  items-center gap-x-1.5 text-sm font-semibold   text-primary border border-primary rounded-full">
                            <svg  class="h-7 w-7" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24"><path fill="currentColor" d="M4 19v-2h2v-7q0-2.075 1.25-3.687T10.5 4.2V2h3v2.2q2 .5 3.25 2.113T18 10v7h2v2zm8 3q-.825 0-1.412-.587T10 20h4q0 .825-.587 1.413T12 22m-4-5h8v-7q0-1.65-1.175-2.825T12 6T9.175 7.175T8 10z"></path></svg>
                            <span class="flex absolute h-3 w-3 top-0 right-0  ">
                                <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-sky-400 opacity-75"></span>
                                <span class="relative inline-flex rounded-full h-3 w-3 bg-sky-500"></span>
                            </span>
                        <!-- <ChevronDownIcon class=" text-gray-400" aria-hidden="true" /> -->
                    </MenuButton>
                    </div>

                    <transition enter-active-class="transition ease-out duration-100" enter-from-class="transform opacity-0 scale-95" enter-to-class="transform opacity-100 scale-100" leave-active-class="transition ease-in duration-75" leave-from-class="transform opacity-100 scale-100" leave-to-class="transform opacity-0 scale-95">
                        <MenuItems  v-if="orders" class="absolute right-0 z-10 mt-2 w-56 origin-top-right rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none">
                            <div v-for="(order, index) in orders.slice(0, 5)" :key="order.id"   class="py-1">
                                <MenuItem v-slot="{ active }" >
                                    <div class="flex ">
                                        <a href="#" :class="[active ? 'bg-gray-100 text-gray-900' : 'text-gray-700', 'block px-4 py-2 text-sm']">{{order?.order_id}}</a>
                                        <p :class="[active ? 'bg-gray-100 text-gray-900' : 'text-gray-700', 'block px-4 py-2 text-sm']">{{order?.order_date}}</p>
                                    </div>
                                </MenuItem>
                                
                            
                            </div>
                        </MenuItems>
                    </transition>
                </Menu>
            </div>

            <div class="min-h-20 content-center align-middle me-5  ">
                <Menu as="div" class="relative inline-block text-left">
                    <div>
                        <MenuButton class=" inline-flex flex-col justify-center  items-center gap-x-1.5 text-sm font-semibold   text-primary border border-primary rounded-full">
                            <img  :src="profile?.url" class="h-10 w-10 border border-primary rounded-full" >
                        </MenuButton>
                    </div>

                    <transition enter-active-class="transition ease-out duration-100" enter-from-class="transform opacity-0 scale-95" enter-to-class="transform opacity-100 scale-100" leave-active-class="transition ease-in duration-75" leave-from-class="transform opacity-100 scale-100" leave-to-class="transform opacity-0 scale-95">
                        <MenuItems class="absolute right-0 z-10 mt-2 w-56 origin-top-right rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none">
                        <div class="py-1">
                            <MenuItem v-slot="{ active }">
                                <a href="#" :class="[active ? 'bg-gray-100 text-gray-900' : 'text-gray-700', 'block px-4 py-2 text-sm']">Account settings</a>
                            </MenuItem>
                            <MenuItem v-slot="{ active } " @click="handelLogout">
                            <button type="submit" :class="[active ? 'bg-gray-100 text-gray-900' : 'text-gray-700', 'block w-full px-4 py-2 text-left text-sm']">Sign out</button>
                            </MenuItem>
                        </div>
                        </MenuItems>
                    </transition>
                </Menu>
            </div>

        </div>
        
    </div>
    
</template>
<style>
.active{
    display: block;
}
</style>



  


 
  
  
  

