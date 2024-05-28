<script setup>
import { ref, onMounted, onUnmounted } from 'vue';
import axios from 'axios';

const antrianPoli = ref()
let previousData = null;


const speak = (text) => {
    let utterance = new SpeechSynthesisUtterance(text);
    utterance.lang = 'id-ID';
    utterance.rate = 0.9;

    let voices = window.speechSynthesis.getVoices();
    let indonesianMaleVoice = voices.find(voice => voice.lang === 'id-ID' && voice.gender === 'male');

    if (indonesianMaleVoice) {
        utterance.voice = indonesianMaleVoice;
    }

    window.speechSynthesis.speak(utterance);
}

const fetchPasien = async () => {
    try {
        const response = await axios.get('/api/poli/tampilkan-antrian')
        antrianPoli.value = response.data
        if (previousData === null || previousData.nm_pasien !== response.data.nm_pasien || previousData.poli_nomor !== response.data.poli_nomor) {
            speak(`Pasien atas nama ${response.data.nm_pasien}, . harap menuju poli nomor . ${response.data.poli_nomor}`);
        }
        previousData = response.data;
    } catch (error) {
        console.error(error)
    }
}


let currentTime = ref(new Date().toLocaleString());

let intervalId;

onMounted(() => {
    intervalId = setInterval(() => {
        currentTime.value = new Date().toLocaleString();
    }, 1000);
    setInterval(fetchPasien, 2500);
});

onUnmounted(() => {
    clearInterval(intervalId);
});
</script>
<template>
    <div class="wrapper">
        <header class="header">
            <div class="header-content">
                <router-link :to="{ name: 'dashboard' }">
                    <img src="/src/assets/img/logo.jpg" alt="">
                </router-link>
                <h1>RS REKSA WALUYA</h1>

            </div>
            <div class="jam">
                <p>{{ currentTime }}</p>
            </div>
        </header>
        <div class="title">
            <h1>ANTRIAN RAWAT JALAN</h1>
        </div>
        <div class="poli card">
            <div class="card-header">
                <h2>POLI NOMOR</h2>
            </div>
            <div class="card-body">
                <h1 v-if="antrianPoli">{{ antrianPoli.poli_nomor }}</h1>
            </div>
        </div>
        <div class="nama-pasien card">
            <div class="card-header">
                <h2>PASIEN ATAS NAMA</h2>
            </div>
            <div class="card-body" v-if="antrianPoli">
                <h1>{{ antrianPoli.nm_pasien }}</h1>
                <p>ke dokter : {{ antrianPoli.nm_dokter }}</p>
            </div>
        </div>
        <div class="video">
            <iframe
                src="https://www.youtube.com/embed/XwBX-VHX2Y8?autoplay=1&mute=1&loop=1&playlist=XwBX-VHX2Y8&controls=0"
                title="YouTube video player" frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
        <footer class="footer">
            <div class="footer-brand">
                Kami Memberi Pelayanan Terbaik
            </div>
            <div class="footer-dev">
                dev. by unit TI RS Reksa Waluya 2024 <p> &copy; didit@rsreksawaluya.com</p>
            </div>
        </footer>
    </div>


</template>



<style scoped>
.wrapper {
    width: 100%;
    height: 100vh;
    background-image: url('/src/assets/img/vector5.jpg');
    background-size: cover;
    background-position: center;
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-template-rows: 1fr 1fr 2fr 4fr 1fr;
    grid-template-areas:
        "header header"
        "title title"
        "poli video"
        "nama-pasien video"
        "footer footer";
    ;
    color: var(--warna1);
    gap: 10px;
}

/* HEADER */
.header {
    grid-area: header;
    background: rgb(0, 0, 0);
    background: linear-gradient(49deg, rgba(0, 0, 0, 0.548) 0%, rgba(43, 0, 160, 0.486) 100%);
    padding: 0 50px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header-content {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    padding: 10px 0;
}

.header-content img {
    width: 20px;
    margin-right: 20px;
    box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5);
}

.header-content h1 {
    font-size: 2em;
    font-weight: 700;
    margin: 0;
    text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5);
}

.header .jam {
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
    font-size: 1rem;
    font-weight: 400;
    text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5);


}

.header .jam p {
    font-family: "Wallpoet", sans-serif;
    font-size: 1.5rem;
    margin: 0;
    padding: 0;
}

/* END HEADER */

/* TITLE */
.title {
    grid-area: title;
    display: flex;
    justify-content: center;
    align-items: center;
    background: rgba(255, 255, 255, 0.2);
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(5px);
    -webkit-backdrop-filter: blur(5px);
    border: 1px solid rgba(255, 255, 255, 0.3);
    padding: 10px 20px;
    color: var(--warna11);
    font-size: 4em;
    text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.247);
    color: var(--warna1);
}

.title h1 {
    margin: 0;
    font-size: 1em;
    font-weight: 700;
}

/* END TITLE */

/* POLI */
.poli {
    grid-area: poli;
    text-align: center;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 16px;
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(5px);
    -webkit-backdrop-filter: blur(5px);
    border: 1px solid rgba(255, 255, 255, 0.3);
    padding: 10px 20px;
    color: var(--warna1);
    font-size: 4em;
    text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.247);
}

.poli h1 {
    margin: 0;
    font-size: 2em;
}

/* END POLI */
.nama-pasien {
    grid-area: nama-pasien;
    text-align: center;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 16px;
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(5px);
    -webkit-backdrop-filter: blur(5px);
    border: 1px solid rgba(255, 255, 255, 0.3);
    padding: 10px 20px;
    color: var(--warna1);
    font-size: 4em;
    text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.247);
}

.nama-pasien h1 {
    margin: 0;
    font-size: .8em;
    text-align: center;
    font-weight: 700;
}

.nama-pasien p {
    margin: 0;
    font-size: .5em;
    text-align: center;
    font-weight: 200;
    margin-top: 30px;
}

.nama-pasien .card-body {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100%;
}

.video {
    grid-area: video;
    background-color: black;
    display: flex;
    justify-content: center;
    align-items: center;
}

.footer {
    grid-area: footer;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 10px;
    background: rgb(0, 0, 0);
    background: linear-gradient(49deg, rgb(0, 0, 0) 0%, rgba(37, 1, 167, 0.733) 100%);
}

.footer-brand {
    display: flex;
    justify-content: start;
    margin-left: 50px;
    font-family: "Satisfy", cursive;
    font-size: 1.5em;
    font-weight: 200;
    color: var(--warna1);
    font-size: 1.5em;
    text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5);
}

.footer-dev {
    display: flex;
    justify-content: end;
    margin-right: 50px;
    font-size: 1.5em;
    font-weight: 200;
    color: var(--warna1);
    font-size: .9em;
    text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5);
}

.footer-dev p {
    margin: 0;
    margin-left: 5px;
}

.message {
    margin-right: 550px;
    font-size: 1.5em;
    font-weight: 700;
}

.video {
    grid-area: video;
    background-color: black;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
    overflow: hidden;
    /* 16:9 aspect ratio */
    padding-top: 56.25%;
}

.video iframe {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}
</style>