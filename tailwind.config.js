/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./resources/**/*.blade.php",
    "./resources/**/*.js",
    "./resources/**/*.vue",

  ],
  theme: {
    extend: {
      colors:{
        primary: '#7E22CE'
      }
    },
    fontFamily:{
      primary:"Merienda"
    }
  },
  plugins: [],
}