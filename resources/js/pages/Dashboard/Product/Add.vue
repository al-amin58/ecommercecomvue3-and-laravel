<script setup>
import AppLayout from '@/components/Dashboard/Applayout/AppLayout.vue';
import useAxios from "@/composables/useAxios"
import { ref, onMounted } from 'vue'
import vSelect from 'vue-select'
const { loading, error, sendRequest } = useAxios();


const form = ref({
  title:null,
    bdt_price:null,
    usa_price:null,
    description:null,
    category_id:null,
    images:[]
  });
  
const submitForm = async () => {

  const response = await sendRequest({
        method: 'POST',
        url: '/api/products',
        headers: {'Content-Type': 'multipart/form-data' },
        data: form.value,
    });
    reset()


 
};

const handleFileChange = (event) => {
    for (let i = 0; i < event.target.files.length; i++) {
        form.value.images.push({
            url: URL.createObjectURL(event.target.files[i]),
            file: event.target.files[i],
        });
    }

};

const removeMedia = (index) => {
    let removedImage = form.value.images[index];
    if (removedImage.url.startsWith('blob:')) {
        URL.revokeObjectURL(removedImage.url);
    }
    form.value.images.splice(index, 1);
};
 const categories = ref();
 const getCategories = (async () => {
  const response = await sendRequest({
      method: 'get',
      url: '/api/categories',
      });
      categories.value= response?.data;
  });
onMounted(()=>{
  getCategories()
});

const reset= () => {
    form.value.title=null,
    form.value.bdt_price=null,
    form.value.usa_price=null,
    form.value.description=null,
    form.value.category_id=null,
    form.value.images=[]
}


</script>

<template>
  
  <AppLayout>
    
    <div class="mt-5"> 
        <div class=" overflow-hidden  p-10">
          <h2 class="font-sans font-semibold underline decoration-wavy text-3xl text-center mb-10">Add Product</h2>
              <div class="form-item h-20 mt-2 ">
                <label for="name" class="w-48 font-sans text-xl mb-1">Product Name:</label>
                <input v-model="form.title" type="text" class=" font-sans h-10 rounded-md border border-gray-400 p-3" name="name" id="name"  placeholder="Enter Product Name" />
              </div>
              <div class="flex justify-between mt-2"> 
                <div class="form-item h-20 font-sans">
                  <label for="bdt" class="w-48 text-xl">Category:</label>
                  <v-select
                    label="name"
                    v-model="form.category_id"
                    placeholder="Add Category.."
                    :reduce="category => category.id"
                    :options="categories"
                    :searchable="false"
                    class="bt-border-color w-72"
                    return-object
                ></v-select>
                </div>
                
              </div> 
              <div class="flex justify-between mt-2"> 
                <div class="form-item h-20">
                  <label for="bdt" class="w-48 font-sans text-xl">BDT Price:</label>
                  <input  v-model="form.bdt_price" type="number" class="font-sans h-10 rounded-md border border-gray-400 p-3" name="bdt" id="bdt" placeholder="Enter BDT Price"/>
                </div>
                <div class="form-item h-20 ms-20 ">
                  <label for="usd" class="w-48 font-sans text-xl">USA Price:</label>
                  <input v-model="form.usa_price"  type="number" class="font-sans h-10 rounded-md border border-gray-400 p-3" name="usd" id="usd" placeholder="Enter USD Price" />
                </div>
              </div> 
              <!-----Editor------->
              <div class="mt-2" >
                <label for="bdt" class="w-48 font-sans text-xl pb-1">Description:</label>
                <textarea v-model="form.description" class="w-full font-sans border rounded  border-gray-400 p-3" placeholder="Enter Your Description"></textarea>
              </div>
               <!--IMAGES PREVIEW-->
              <div class="mt-2 w-auto " id="v-pills-image" role="tabpanel" aria-labelledby="v-pills-image-tab" tabindex="0">
                <div class="p-4 rounded-md bg-white shadow mb-4 border-dashed border-2 border-primary  ">
                  <h4 class="pb-3">Image Upload Requirements</h4>
                  <ul style="list-style:disc;" class="ps-4 ">
                      <li>1 MB limit.</li>
                      <li>300 * 200 Size</li>
                      <li>Allowed types: <span class="primary-color"> JPG</span>, <span class="primary-color">JPEG</span>, <span class="primary-color">PNG</span>.</li>
                  </ul>
                  <div class=" bg-white shadow-md">
                    <div class="flex flex-row gap-2 p-2">
                      <!--IMAGES PREVIEW-->
                      <div v-for="(image, index) in form.images"  :key="image.index" class="h-24 relative">
                        <button @click="removeMedia(index)"  class="w-5 h-5 absolute top-0 right-0  text-primary" type="button">
                            <svg class="" viewBox="0 0 512 512" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="currentColor"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <title>cancel</title> <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> <g id="work-case" fill="currentColor" transform="translate(91.520000, 91.520000)"> <polygon id="Close" points="328.96 30.2933333 298.666667 1.42108547e-14 164.48 134.4 30.2933333 1.42108547e-14 1.42108547e-14 30.2933333 134.4 164.48 1.42108547e-14 298.666667 30.2933333 328.96 164.48 194.56 298.666667 328.96 328.96 298.666667 194.56 164.48"> </polygon> </g> </g> </g></svg>
                        </button>
                        <img :src="image.url" class="w-20 h-24">
                        
                      </div>
                        <!--UPLOAD BUTTON-->
                      <div class=" fle justify-center items-center w-24 rounded-md box-decoration-slice bg-gradient-to-r from-indigo-600 to-pink-500 text-white px-2">
                        <label for="mu-file-input" class=" ">
                            <span>
                                <svg viewBox="0 0 1024 1024" class="w-20" version="1.1" xmlns="http://www.w3.org/2000/svg" fill="#D74825"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M736.68 435.86a173.773 173.773 0 0 1 172.042 172.038c0.578 44.907-18.093 87.822-48.461 119.698-32.761 34.387-76.991 51.744-123.581 52.343-68.202 0.876-68.284 106.718 0 105.841 152.654-1.964 275.918-125.229 277.883-277.883 1.964-152.664-128.188-275.956-277.883-277.879-68.284-0.878-68.202 104.965 0 105.842zM285.262 779.307A173.773 173.773 0 0 1 113.22 607.266c-0.577-44.909 18.09-87.823 48.461-119.705 32.759-34.386 76.988-51.737 123.58-52.337 68.2-0.877 68.284-106.721 0-105.842C132.605 331.344 9.341 454.607 7.379 607.266 5.417 759.929 135.565 883.225 285.262 885.148c68.284 0.876 68.2-104.965 0-105.841z" fill="#312782"></path><path d="M339.68 384.204a173.762 173.762 0 0 1 172.037-172.038c44.908-0.577 87.822 18.092 119.698 48.462 34.388 32.759 51.743 76.985 52.343 123.576 0.877 68.199 106.72 68.284 105.843 0-1.964-152.653-125.231-275.917-277.884-277.879-152.664-1.962-275.954 128.182-277.878 277.879-0.88 68.284 104.964 68.199 105.841 0z" fill="#D74825"></path><path d="M545.039 473.078c16.542 16.542 16.542 43.356 0 59.896l-122.89 122.895c-16.542 16.538-43.357 16.538-59.896 0-16.542-16.546-16.542-43.362 0-59.899l122.892-122.892c16.537-16.542 43.355-16.542 59.894 0z" fill="#312782"></path><path d="M485.17 473.078c16.537-16.539 43.354-16.539 59.892 0l122.896 122.896c16.538 16.533 16.538 43.354 0 59.896-16.541 16.538-43.361 16.538-59.898 0L485.17 532.979c-16.547-16.543-16.547-43.359 0-59.901z" fill="#312782"></path><path d="M514.045 634.097c23.972 0 43.402 19.433 43.402 43.399v178.086c0 23.968-19.432 43.398-43.402 43.398-23.964 0-43.396-19.432-43.396-43.398V677.496c0.001-23.968 19.433-43.399 43.396-43.399z" fill="#$secondary-color: var(--secondary-color, #D74825);"></path></g></svg>
                            </span>
                        </label>
                        <input @change="handleFileChange"  id="mu-file-input" type="file" accept="image/*" multiple hidden>
                      </div>
                    </div>
                  </div>
                </div>
              </div>              
              <button v-on:click="submitForm()" type="submit" class="font-sans p-2 mt-10 rounded-3xl text-xl w-28 h- bg-primary hover:bg-purple-900 text-white">Submit</button>
        </div>
    </div>
  </AppLayout>

</template>




