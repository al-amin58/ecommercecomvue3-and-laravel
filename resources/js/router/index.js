import {createRouter, createWebHistory} from "vue-router"
import {useAuthStore} from "@/stores/useAuthStore.js";




const router = createRouter({
   history: createWebHistory(),
   routes:[
   
       {path:"/",
           name:'Index',
           component:()=>import('@/pages/Index.vue')
       },
       {path:"/products",
           name:"Products",
           component:()=>import("@/pages/Products.vue")
       },
       {path:"/product-detail/:id",
           name:"ProductDetail",
           component:()=>import("@/pages/ProductDetail.vue")
       },
       {path:"/contact",
           name:"Contact",
           component:()=>import("@/pages/Contact.vue")
       },
       {path:"/blog",
           name:"Blog",
           component:()=>import("@/pages/Blog.vue")
       },
       {path:"/blog-detail/:id",
           name:"BlogDetail",
           component:()=>import("@/pages/BlogDetail.vue")
       },
       {path:"/profile",
           name:"Profile",
           component:()=>import("@/pages/Profile.vue")
      },
      //.....................Auth.....................................
      {
        path:"/login",
           name:"Login",
           meta:{layout:"auth"},
           component:()=>import("@/pages/Login.vue"),
          //  beforeEnter: (to, from, next) => {
          //   const auth = useAuthStore();
          //   if (auth?.user?.type === 1) {

          //     if(auth?.user?.type === 0){
          //       next({path:'/'})
          //     }
          //     next({ path: '/dashboard' });
          //   }
          //   else{
          //     next();
          //   }
          //  }
        },
       {path:"/register",
           name:"Register",
           component:()=>import("@/pages/Register.vue")
       },
       //.................................Admin Route start..................................................
      {
        path:"/dashboard",
        name: "dashboard",
        beforeEnter:(to, from, next) =>
        {
          const auth = useAuthStore();
          if(auth?.user?.type === 1){
            next()
            
          }else{
            next({path: '/login', replace: true})
          }
        },
        component:()=>import("@/pages/Dashboard/Index.vue"),
      },
      {
        path:"/product",
        name: "product",
        beforeEnter:(to, from, next) =>{
          const auth = useAuthStore();
         if(auth?.user?.type === 1){
            next() 
         }else{
          next({path: '/login', replace:true})
         }
        },
        component:()=>import("@/pages/Dashboard/Product/Index.vue")    
      },
      {
        path:"/add-product",
        name: "add-product",
        beforeEnter:(to, from, next) =>{
          const auth = useAuthStore();
          if(auth?.user?.type === 1){
            next()
            
          }else{
           next({path: '/login', replace:true})
          }
         },
        component:()=>import("@/pages/Dashboard/Product/Add.vue")    
      },
      {
        path:'/edit-product/:id',
        name: "edit-product",
        beforeEnter:(to, from, next) =>{
          const auth = useAuthStore();
          if(auth?.user?.type === 1){
            next()
            
          }else{
           next({path: '/login', replace:true})
          }
         },
        component:()=>import("@/pages/Dashboard/Product/Edit.vue")    
      },
      {
        path:'/delete-image',
        name:'delete-image',
        beforeEnter:(to, from, next) =>{
          const auth = useAuthStore();
          if(auth?.user?.type === 1){
            next()
            
          }else{
           next({path: '/login', replace:true})
          }
         },
      },
      {
        path:"/category",
        name: "category",
        beforeEnter:(to, from, next) =>{
          const auth = useAuthStore();
          if(auth?.user?.type === 1){
            next()
            
          }else{
           next({path: '/login', replace:true})
          }
         },
        component:()=>import("@/pages/Dashboard/Category/Index.vue")
      },
      {
        path:'/edit-category',
        name:'edit-category',
        beforeEnter:(to, from, next) =>{
          const auth = useAuthStore();
          if(auth?.user?.type === 1){
            next()
            
          }else{
           next({path: '/login', replace:true})
          }
         },
      },
      {
        path:"/blogs",
        name: "blogs",
        beforeEnter:(to, from, next) =>{
          const auth = useAuthStore();
          if(auth?.user?.type === 1){
            next()
            
          }else{
           next({path: '/login', replace:true})
          }
         },
        component:()=>import("@/pages/Dashboard/Blog/Index.vue")
      },
      {
        path:"/add-blogs",
        name: "add-blogs",
        beforeEnter:(to, from, next) =>{
          const auth = useAuthStore();
          if(auth?.user?.type === 1){
            next()
            
          }else{
           next({path: '/login', replace:true})
          }
         },
        component:()=>import("@/pages/Dashboard/Blog/Add.vue")
      },
      {
        path:"/edit-blog/:id",
        name: "edit-blog",
        beforeEnter:(to, from, next) =>{
          const auth = useAuthStore();
          if(auth?.user?.type === 1){
            next()
            
          }else{
           next({path: '/login', replace:true})
          }
         },
        component:()=>import("@/pages/Dashboard/Blog/Edit.vue")
      },
      
      {
        path:"/order",
        name: "order",
        beforeEnter:(to, from, next) =>{
          const auth = useAuthStore();
          if(auth?.user?.type === 1){
            next()
            
          }else{
           next({path: '/login', replace:true})
          }
         },
        component:()=>import("@/pages/Dashboard/Order/Index.vue")
      },
      {
        path:"/order-customar/:id",
        name: "order-customar",
        beforeEnter:(to, from, next) =>{
          const auth = useAuthStore();
          if(auth?.user?.type === 1){
            next()
            
          }else{
           next({path: '/login', replace:true})
          }
         },
        component:()=>import("@/components/Dashboard/OrderCustomar.vue")
      },
      {
        path:"/users",
        name: "users",
        beforeEnter:(to, from, next) =>{
          const auth = useAuthStore();
          if(auth?.user?.type === 1){
            next()
            
          }else{
           next({path: '/login', replace:true})
          }
         },
        component:()=>import("@/pages/Dashboard/Users/Index.vue")
      },
      

      //..............order checkout for customar
      {
        path:"/checkout/:id",
        name: "checkout",
        beforeEnter:(to, from, next) =>{
          const auth = useAuthStore();
          if(auth?.user?.type === 0){
            next()
            
          }else{
           next({path: '/login', replace:true})
          }
         },
        component:()=>import("@/pages/CheckOut.vue")
      },
      {
        path:"/paymentmethod/:id",
        name: "paymentmethod",
        beforeEnter:(to, from, next) =>{
          const auth = useAuthStore();
          if(auth?.user?.type === 0){
            next()
            
          }else{
           next({path: '/login', replace:true})
          }
         },
        component:()=>import("@/pages/PaymentMethod.vue")
      },
      {
        path:"/user/dashbord",
        name: "userdashbord",
        beforeEnter:(to, from, next) =>{
          const auth = useAuthStore();
          if(auth?.user?.type === 0){
            next()
            
          }else{
           next({path: '/login', replace:true})
          }
         },
        component:()=>import("@/pages/UserDashbord.vue")
      },
      {
        path:"/user/customerorderlist",
        name: "customerorderlist",
        beforeEnter:(to, from, next) =>{
          const auth = useAuthStore();
          if(auth?.user?.type === 0){
            next()
            
          }else{
           next({path: '/login', replace:true})
          }
         },
        component:()=>import("@/components/CustomerOrderList.vue")
      },
      {
        path:"/user/customerorderview",
        name: "customerorderview",
        beforeEnter:(to, from, next) =>{
          const auth = useAuthStore();
          if(auth?.user?.type === 0){
            next()
            
          }else{
           next({path: '/login', replace:true})
          }
         },
        component:()=>import("@/components/CustomerOrderView.vue")
      },
      
    
   ]
});



export default router;
