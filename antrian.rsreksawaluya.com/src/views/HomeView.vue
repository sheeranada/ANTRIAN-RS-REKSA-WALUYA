<script setup>
import { RouterLink } from 'vue-router';
</script>

<template>
  <main class="container">
    <h1>Hello Gais !</h1>
    <p>SELAMAT DATANG DI APLIKASI ANTRIAN RS REKSA WALUYA</p>
    <router-link :to="{ name: 'login' }">LOGIN DULU</router-link>
  </main>
</template>

<style scoped>
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  flex-direction: column;
}
</style>
