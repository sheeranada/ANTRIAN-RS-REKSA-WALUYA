<script setup>
import { ref, onMounted, onUnmounted } from 'vue';
import axios from 'axios';

const antrian = ref([])
const loket1 = ref([])
const loket2 = ref([])
const loket3 = ref([])
const loket4 = ref([])


const fetchAntrian = async () => {
    try {
        const response = await axios.get('/api/loket/tampilkan-antrian')
        antrian.value = response.data
    } catch (error) {
        if (error.response && error.response.status === 429) {
            setTimeout(fetchAntrian, 5000);
        } else {
            console.log(error);

        }
    }
}
const fetchLoket1 = async () => {
    try {
        const response = await axios.get('/api/loket/tampilkan-loket1')
        loket1.value = response.data
    } catch (error) {
        if (error.response && error.response.status === 429) {
            setTimeout(fetchLoket1, 5000);
        } else {
            console.log(error);

        }
    }
}
const fetchLoket2 = async () => {
    try {
        const response = await axios.get('/api/loket/tampilkan-loket2')
        loket2.value = response.data
    } catch (error) {
        if (error.response && error.response.status === 429) {
            setTimeout(fetchLoket2, 5000);
        } else {
            console.log(error);

        }
    }
}
const fetchLoket3 = async () => {
    try {
        const response = await axios.get('/api/loket/tampilkan-loket3')
        loket3.value = response.data
    } catch (error) {
        if (error.response && error.response.status === 429) {
            setTimeout(fetchLoket3, 5000);
        } else {
            console.log(error);

        }
    }
}
const fetchLoket4 = async () => {
    try {
        const response = await axios.get('/api/loket/tampilkan-loket4')
        loket4.value = response.data
    } catch (error) {
        if (error.response && error.response.status === 429) {
            setTimeout(fetchLoket4, 5000);
        } else {
            console.log(error);

        }
    }
}

let currentTime = ref(new Date().toLocaleString());

let intervalId;
onMounted(() => {
    intervalId = setInterval(() => {
        currentTime.value = new Date().toLocaleString();
    }, 1000);
    setInterval(() => {
        fetchAntrian()
        fetchLoket1()
        fetchLoket2()
        fetchLoket3()
        fetchLoket4()
    }, 2500)
});
onUnmounted(() => {
    clearInterval(intervalId);
});

</script>
<template>
    <div class="wrapper">
        <div class="navbar">
            <header class="header">
                <img src="/src/assets/img/logo.jpg" alt="">
                <div class="rs">
                    <h1>RS REKSA WALUYA</h1>
                    <p>Kami Memberi Pelayanan Terbaik</p>
                </div>
            </header>
            <nav class="brand">
                <h1>ANTRIAN LOKET</h1>
                <p>{{ currentTime }}</p>
            </nav>
        </div>
        <div class="loket" v-if="antrian">
            <h1>LOKET {{ antrian.loket }}</h1>
        </div>
        <div class="antrian">
            <div class="antrian-header">
                <h1>ANTRIAN NOMOR</h1>
            </div>
            <div class="antrian-body" v-if="antrian">
                <p>{{ antrian.no_antrian }}</p>
            </div>
        </div>
        <div class="video">
            <iframe
                src="https://www.youtube.com/embed/h9SHLQuukqg?autoplay=1&mute=1&controls=0&loop=1&playlist=h9SHLQuukqg"
                title="YouTube video player" frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

        </div>
        <footer class="footer">
            <div class="card" v-if="loket1">
                <div class="card-header loket1">
                    <h1>LOKET 1</h1>
                </div>
                <div class="card-body">
                    <h1>{{ loket1.no_antrian }}</h1>
                </div>
            </div>
            <div class="card" v-if="loket2">
                <div class="card-header loket2">
                    <h1>LOKET 2</h1>
                </div>
                <div class="card-body">
                    <h1>{{ loket2.no_antrian }}</h1>
                </div>
            </div>
            <div class="card" v-if="loket3">
                <div class="card-header loket3">
                    <h1>LOKET 3</h1>
                </div>
                <div class="card-body">
                    <h1>{{ loket3.no_antrian }}</h1>
                </div>
            </div>
            <div class="card" loket4>
                <div class="card-header loket4">
                    <h1>LOKET 4</h1>
                </div>
                <div class="card-body">
                    <h1>{{ loket4.no_antrian }}</h1>
                </div>
            </div>
        </footer>
    </div>
</template>
<style scoped>
.wrapper {
    height: 100vh;
    width: 100%;
    padding: 0;
    margin: 0;
    background-image: url('/src/assets/img/vector3.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    color: var(--warna11);
    display: grid;
    grid-template-rows: 0.8fr 1fr 2fr 1fr;
    grid-template-columns: 1fr 1fr;
    grid-template-areas:
        "navbar navbar"
        "loket video"
        "antrian video"
        "footer footer";
    gap: 16px;
}

/* #region HEADER */
.navbar {
    color: var(--warna1);
    grid-area: navbar;
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-template-areas: "header brand";
    background: rgba(255, 255, 255, 0.14);
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(9.7px);
    -webkit-backdrop-filter: blur(9.7px);
}

.header {
    display: flex;
    justify-content: start;
    align-items: center;
    padding-left: 16px;

}

.header img {
    width: 40px;
    margin-right: 16px;
    box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.219);
}

.brand {
    grid-area: brand;
    display: flex;
    justify-content: center;
    align-items: center;
}

.rs {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: start;
}

.rs h1,
p {
    margin: 0;
    text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5);
}

.rs h1 {
    font-size: 2em;
    font-weight: 700;
}

.rs p {
    font-size: 1.2em;
    font-family: "Satisfy", cursive;
}

.brand {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.brand h1,
p {
    margin: 0;
    text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5);
}

.brand h1 {
    font-size: 4em;
    font-weight: 700;
}

/* #endregion */
/* #region LOKET */
.loket {
    grid-area: loket;
    display: flex;
    justify-content: center;
    align-items: center;
    color: var(--warna1);
    margin-left: 16px;
    /* From https://css.glass */
    background: rgba(255, 255, 255, 0.16);
    border-radius: 16px;
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.562);
    backdrop-filter: blur(12.5px);
    -webkit-backdrop-filter: blur(12.5px);
    border: 1px solid rgba(255, 255, 255, 0.44);
}

.loket h1 {
    margin: 0;
    font-size: 5em;
    text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.247);
}

/* #endregion */
/* #region ANTRIAN */
.antrian {
    grid-area: antrian;
    display: flex;
    align-items: center;
    flex-direction: column;
    margin-left: 16px;
    background: rgba(255, 255, 255, 0.16);
    border-radius: 16px;
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(12.5px);
    -webkit-backdrop-filter: blur(12.5px);
    border: 1px solid rgba(255, 255, 255, 0.44);
}

.antrian-header {
    display: flex;
    justify-content: center;
    align-items: center;
    border-bottom: 1px solid var(--warna1);
    width: 100%;
    padding: 16px;
}

.antrian-body {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
    padding: 16px;
}

.antrian-body p {
    font-size: 9em;
    font-weight: 700;
}

.antrian-header h1,
p {
    margin: 0;
    color: var(--warna1);
    text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.247);
}

/* #endregion */
/* #region VIDEO */
.video {
    grid-area: video;
    background-color: black;
    display: flex;
    justify-content: center;
    align-items: center;
}

.video iframe {
    width: 100%;
    height: 100%;
}

/* #endregion */
/* #region FOOTER */
.footer {
    grid-area: footer;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 16px;
    margin: 0 16px 16px 16px;
}

.footer h1 {
    margin: 0;
    font-size: 2em;
    text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.247);
    color: var(--warna1);
}

.footer .card {
    width: 100%;
    height: 100%;
    background: rgba(255, 255, 255, 0.16);
    border-radius: 0px 0px 16px 16px;
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.384);
    backdrop-filter: blur(12.5px);
    -webkit-backdrop-filter: blur(12.5px);
    border: 1px solid rgba(255, 255, 255, 0.44);
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.footer .card .card-header {
    width: 100%;
    padding: 8px;
    border-bottom: 1px solid var(--warna1);
    display: flex;
    justify-content: center;
    align-items: center;
}

.footer .card .card-body {
    width: 100%;
    padding: 8px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.footer .card .card-body h1 {
    font-size: 4em;
    font-weight: 600;
    text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.247);
    color: var(--warna1);
}

.footer .loket1 {
    background-color: #eab308;
    border-radius: 0;
}

.footer .loket2 {
    background-color: #84cc16;
    border-radius: 0;
}

.footer .loket3 {
    background-color: #22c55e;
    border-radius: 0;
}

.footer .loket4 {
    background-color: #06b6d4;
    border-radius: 0;
}


/* #endregion */

@media only screen and (max-width: 1024px) {
    .wrapper {
        display: grid;
        grid-template-rows: 1fr 1fr 1fr 1fr;
        grid-template-areas:
            "navbar navbar"
            "loket video"
            "antrian video"
            "footer footer";
    }

    .navbar {
        grid-area: navbar;
    }

    .loket {
        grid-area: loket;
    }

    .antrian {
        grid-area: antrian;
    }

    .video {
        grid-area: video;
    }

    .footer {
        grid-area: footer;
    }


    .brand h1 {
        font-size: 2em;
    }
}
</style>