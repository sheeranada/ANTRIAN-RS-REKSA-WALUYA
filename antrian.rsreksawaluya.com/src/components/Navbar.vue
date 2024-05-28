<template>
    <nav class="navbar navbar-expand-sm py-1">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="/src/assets/img/logo_utama.png" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav ms-auto">
                    <router-link :to="{ name: 'dashboard' }" class="nav-link"
                        aria-current="page">DASHBOARD</router-link>
                    <button class="nav-link" @click="logout"><i class="fas fa-power-off"></i></button>
                </div>
            </div>
        </div>
    </nav>
</template>

<script setup>
import { useAuthStore } from '@/stores/auth';

const storeAuth = useAuthStore();

const logout = async () => {
    await storeAuth.handleLogout();
};
</script>

<style scoped>
.navbar {
    background-color: var(--warna1);
    font-size: 0.8em;
    height: 60px !important;
}

.navbar-brand img {
    width: 100px;
    padding: 15px 0;
}


.navbar-nav button:hover {
    background-color: var(--warna11);
    color: red;
}
</style>