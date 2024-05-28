<script setup>
import { RouterLink } from 'vue-router';
import { onMounted } from 'vue';
import { useAuthStore } from '@/stores/auth';
import Navbar from '@/components/Navbar.vue';

const storeAuth = useAuthStore();

onMounted(async () => {
    await storeAuth.getUser();
});

const logout = async () => {
    await storeAuth.handleLogout();
};
</script>
<template>
    <div class="container-fluid">
        <h1>DASHBOARD</h1>
        <p v-if="storeAuth.user">Welcome, {{ storeAuth.user.name }}</p>
        <nav class="navbar navbar-expand-lg">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <router-link :to="{ name: 'dashboard' }" class="nav-link active"
                            aria-current="page">DASHBOARD</router-link>
                    </li>
                    <li class="nav-item">
                        <router-link :to="{ name: 'display-admisi' }" class="nav-link"
                            aria-current="page">DISPLAY-TPP</router-link>
                    </li>
                    <li class="nav-item">
                        <router-link :to="{ name: 'display-farmasi' }" class="nav-link"
                            aria-current="page">DISPLAY-FARMASI</router-link>
                    </li>
                    <li class="nav-item">
                        <router-link :to="{ name: 'display-poli' }" class="nav-link"
                            aria-current="page">DISPLAY-POLI</router-link>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            ADMIN
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <router-link :to="{ name: 'admin-tpp' }" class="dropdown-item"
                                    href="#">ADMISI</router-link>
                            </li>
                            <li>
                                <router-link :to="{ name: 'admin-poli' }" class="dropdown-item"
                                    href="#">POLI</router-link>
                            </li>
                            <li>
                                <router-link :to="{ name: 'admin-farmasi' }" class="dropdown-item"
                                    href="#">FARMASI</router-link>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <button class="nav-link" @click="logout">LOGOUT</button>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</template>



<style scoped>
.container-fluid {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    width: 100%;
    flex-direction: column;
    background-color: var(--warna1);
}

.container-fluid * {
    color: var(--warna11);
}

.nav-link {
    margin-right: 32px;
    background-color: var(--warna2);
    display: block;
    width: 150px;
    font-size: .7em;
    text-align: center;
}

.nav-link:hover {
    background-color: var(--warna11);
    color: var(--warna1);
}
</style>