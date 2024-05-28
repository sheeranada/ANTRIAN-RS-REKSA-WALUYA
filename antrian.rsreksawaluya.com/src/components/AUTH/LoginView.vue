<script setup>
import { ref } from 'vue';
import { useAuthStore } from '@/stores/auth';

const authStore = useAuthStore()
const form = ref({
    email: "",
    password: "",
})

</script>
<template>
    <div class="container-fluid" id="login">
        <img src="/src/assets/img/logo.jpg" alt="">
        <h1 class="text-white">LOGIN DULU</h1>
        <form @submit.prevent="authStore.handleLogin(form)">
            <div class="form-floating mb-3">
                <input type="email" class="form-control" id="floatingInputValue" placeholder="name@example.com"
                    v-model="form.email">
                <label for="floatingInputValue">EMAIL</label>
            </div>
            <div class="form-floating mb-3">
                <input type="password" class="form-control" id="floatingInputValuepassword"
                    placeholder="name@example.com" v-model="form.password">
                <label for="floatingInputValuepassword">PASSWORD</label>
            </div>
            <button class="btn" type="submit">
                <i class="fas fa-power-off"></i> LOGIN
            </button>
        </form>
    </div>
</template>

<style scoped>
.container-fluid {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    flex-direction: column;
    position: relative;
    z-index: -1;
}

form {
    width: 25%;
    text-align: right;
}

button {
    background-color: red;
    color: white;
    border: none;
    padding: 10px;
    border-radius: 5px;
    cursor: pointer;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.288);
    position: relative;
}

button:hover {
    background-color: var(--warna11);
    color: white;
}

button h1 {
    color: var(--warna1);
    padding: 30px;
    font-size: 2em;
    position: relative;
}
</style>