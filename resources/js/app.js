import { createApp } from 'vue'
import App from './App.vue'
import 'aos/dist/aos.css'
import './assets/css/app.css'
import Aos from 'aos'
import router from "@/router/index.js";
import VueFeather from 'vue-feather';
import 'vue-select/dist/vue-select.css';
import { createPinia } from 'pinia'


Aos.init()

const pinia = createPinia()

const app = createApp(App)
app.use(pinia)
    .use(router )
    .component(VueFeather.name, VueFeather)
   
    .mount("#app")
