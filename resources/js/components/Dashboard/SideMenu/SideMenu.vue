
<template>
    <div class="">
        <div class="flex justify-center mt-10 mb-5 cursor-pointer">
          <img src="@/assets/images/dashboard-logo.png" class="w-10 rounded-full ">
          <h4 class="text-3xl mt-1 me-2 ms-1">FARUK</h4>
        </div>
        <hr class=" mx-5 border border-black">
        <div class="ms-4 mt-5 me-1 " >
            <ul>
                <li class="mb-3  hover:rounded-3xl  hover:drop-shadow-2xl text-lg font-sans font-medium p-1   text-black hover:bg-primary hover:text-white">
                    <RouterLink to="/dashboard" class="flex content-center align-middle">
                        <svg class="me-1 border border-primary rounded-full w-7 h-7 p-1 drop-shadow-2xl" xmlns="http://www.w3.org/2000/svg" width="1em" viewBox="0 0 20 20"><path fill="currentColor" d="M6 15V2h10v13zm-1 1h8v2H3V5h2z"></path></svg>
                        Dashboard
                    </RouterLink>
                </li>
                <li class="mb-3 hover:rounded-3xl hover:drop-shadow-2xl text-lg font-sans font-medium p-1 text-black hover:bg-primary hover:text-white">
                    <RouterLink to="/category" class="flex content-center align-middle">
                       <svg class="me-1 border border-primary rounded-full w-7 h-7 p-1 drop-shadow-2xl" xmlns="http://www.w3.org/2000/svg" width="1em" viewBox="0 0 20 20"><path fill="currentColor" d="M5 7h13v10H2V4h7l2 2H4v9h1z"></path></svg>
                        Category
                    </RouterLink>
                </li>
                <li class="mb-3 hover:rounded-3xl hover:drop-shadow-2xl text-lg font-sans font-medium p-1 text-black hover:bg-primary hover:text-white">
                    <RouterLink to="/product" class="flex content-center align-middle">
                        <svg class="me-1 border border-primary rounded-full w-7 h-7 p-1 drop-shadow-2xl" xmlns="http://www.w3.org/2000/svg" width="1em" viewBox="0 0 24 24"><g fill="none"><g clipPath="url(#akarIconsProductHuntFill0)"><path fill="currentColor" d="M15.402 10.2c0 .992-.808 1.8-1.8 1.8H10.2V8.4h3.402c.992 0 1.8.808 1.8 1.8M24 12c0 6.629-5.371 12-12 12S0 18.629 0 12S5.371 0 12 0s12 5.371 12 12m-6.198-1.8c0-2.318-1.883-4.2-4.2-4.2H7.8v12h2.4v-3.6h3.402c2.317 0 4.2-1.882 4.2-4.2"></path></g><defs><clipPath id="akarIconsProductHuntFill0"><path fill="#fff" d="M0 0h24v24H0z"></path></clipPath></defs></g></svg>
                        Proudct
                    </RouterLink>
                </li>
                <li class="mb-3 hover:rounded-3xl  hover:drop-shadow-2xl text-lg font-sans font-medium p-1 text-black hover:bg-primary hover:text-white">
                    <RouterLink to="/blogs" class="flex content-center align-middle">
                        <svg class="me-1 border border-primary rounded-full w-7 h-7 p-1 drop-shadow-2xl" xmlns="http://www.w3.org/2000/svg" width="1em"  viewBox="0 0 990.933 1000"><path fill="currentColor" d="M550.422 0L249.556 1.285C122.233 18.801 13.145 97.717 3.51 232.349c-3.046 12.359-1.544 24.907-1.975 36.389C.147 327.571.48 390.867 1.379 451.439c.24 95.584-2.583 172.602-.783 243.664c1.153 208.816 124.429 306.403 348.288 302.339c55.46-1.007 118.876-1.368 191.602.533c72.331.488 128.091 5.253 177.78-1.818c220.679-31.402 263.696-179.41 272.657-299.236V559.699c-6.44-139.393-107.508-177.77-193.922-180.601c9.288-34.845 11.521-82.219 3.385-146.029c-10.471-123.99-98.471-220.938-249.964-233.07zM298.828 187.246h244.761c135.326 18.024 128.953 163.934 0 184.864H298.828c-135.326-18.024-128.953-163.934 0-184.864m-55.572 403.798l449.653 1.536c135.976 17.536 136.359 183.07 4.733 203.325l-449.653-1.568c-139.444-17.144-137.487-182.865-4.733-203.294z"></path></svg>
                        Blog
                    </RouterLink>
                </li>
                <li class="mb-3 hover:rounded-3xl  hover:drop-shadow-2xl text-lg font-sans font-medium p-1 text-black hover:bg-primary hover:text-white">
                    <RouterLink to="/users" class="flex content-center align-middle">
                        <svg class="me-1 border border-primary rounded-full w-7 h-7 p-1 drop-shadow-2xl" xmlns="http://www.w3.org/2000/svg" width="1em"  viewBox="0 0 64 64"><path fill="currentColor" d="M32 2C15.432 2 2 15.431 2 32c0 16.568 13.432 30 30 30s30-13.432 30-30C62 15.431 48.568 2 32 2m14.709 10.471v3.801h-9.555l-.949-3.801zm-9.555 4.751h9.555v4.751c0 4.764-9.555 4.764-9.555 0v-1.9h-3.801zm-5.73 32.305h-14v-6h-6V29.528h6v13.999h14zm-5.449-7.75h-5.701l13.502-14.104h14.402L33.785 42.082v-8.465zm24.601 7.752H33.785v-5.045h16.791zm0-6.724H35.463l15.113-15.131z"></path></svg>
                        Users
                    </RouterLink>
                </li>
                <li class="mb-3 hover:rounded-3xl  hover:drop-shadow-2xl text-lg font-sans font-medium p-1 text-black hover:bg-primary hover:text-white">
                    <RouterLink to="/order" class="flex content-center align-middle">
                        <svg class="me-1 border border-primary rounded-full w-7 h-7 p-1 drop-shadow-2xl " xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24"><path fill="currentColor" d="M7 22q-.825 0-1.413-.588T5 20q0-.825.588-1.413T7 18q.825 0 1.413.588T9 20q0 .825-.588 1.413T7 22Zm10 0q-.825 0-1.413-.588T15 20q0-.825.588-1.413T17 18q.825 0 1.413.588T19 20q0 .825-.588 1.413T17 22ZM12 9.5q-.425 0-.713-.288T11 8.5q0-.425.288-.713T12 7.5q.425 0 .713.288T13 8.5q0 .425-.288.713T12 9.5ZM11 6V1h2v5h-2ZM7 17q-1.15 0-1.738-.988T5.25 14.05L6.6 11.6L3 4H2q-.425 0-.713-.288T1 3q0-.425.288-.713T2 2h1.65q.275 0 .525.15t.375.425L8.525 11h7.025l3.6-6.5q.125-.225.35-.363T20 4q.575 0 .863.488t.012.987L17.3 11.95q-.275.5-.738.775T15.55 13H8.1L7 15h11q.425 0 .713.288T19 16q0 .425-.288.713T18 17H7Z"></path></svg>
                        Order
                    </RouterLink>
                </li>
            </ul>
        </div>
    </div>
</template>
<style>
 
</style>



  


  




  



  



    

  

 


    
 
  


  
 