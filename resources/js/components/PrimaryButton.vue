<script setup>
const props = defineProps({
  label: {
    type: String,
    default: 'Button'
  },
  href:{
    type:String,
    default: '/'
  }
});
</script>
<template>
  <RouterLink :to="href" class="relative px-5 py-3 font-medium text-white group inline-block">
    <span :class="`absolute inset-0 w-full h-full transition-all duration-300 ease-out transform translate-x-0 -skew-x-12 bg-purple-500 group-hover:bg-purple-700 group-hover:skew-x-12`"></span>
    <span :class="`absolute inset-0 w-full h-full transition-all duration-300 ease-out transform skew-x-12 bg-purple-700 group-hover:bg-purple-500 group-hover:-skew-x-12`"></span>
    <span :class="`absolute bottom-0 left-0 hidden w-10 h-20 transition-all duration-100 ease-out transform -translate-x-8 translate-y-10 bg-purple-600 -rotate-12`"></span>
    <span :class="`absolute bottom-0 right-0 hidden w-10 h-20 transition-all duration-100 ease-out transform translate-x-10 translate-y-8 bg-purple-400 -rotate-12`"></span>
    <span class="relative">{{label}}</span>
  </RouterLink>
</template>