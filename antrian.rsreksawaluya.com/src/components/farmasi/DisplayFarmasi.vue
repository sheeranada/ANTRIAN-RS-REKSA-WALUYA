<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import axios from 'axios'

const antrian = ref([])
const racik = ref([])
const nonRacik = ref([])

const fetchAntrian = async () => {
    try {
        const response = await axios.get('/api/farmasi/tampilkan-antrian')
        antrian.value = response.data
    } catch (error) {
        console.error(error)
    }
}
const fetchRacik = async () => {
    try {
        const response = await axios.get('/api/farmasi/obat-racik-dilayani')
        racik.value = response.data
    } catch (error) {
        console.error(error)
    }
}
const fetchNonRacik = async () => {
    try {
        const response = await axios.get('/api/farmasi/non-racik-dilayani')
        nonRacik.value = response.data
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
    setInterval(() => {
        fetchRacik()
        fetchNonRacik()
        fetchAntrian()
    }, 1000)
})
onUnmounted(() => {
    clearInterval(intervalId);
});

</script>
<template>
    <div class="wrapper">
        <header class="header">
            <h1>ANTRIAN FARMASI</h1>
            <p>{{ currentTime }}</p>
        </header>
        <div class="brand">
            <img src="/src/assets/img/logo.jpg" alt="">
            <h1>RS REKSA WALUYA</h1>
            <p>Kami Memberi Pelayanan Terbaik</p>
        </div>
        <div class="pasien" v-if="antrian">
            <p>PASIEN ATAS NAMA :</p>
            <h1>{{ antrian.nm_pasien }}</h1>
            <h5>NO RAWAT : {{ antrian.no_rawat }}</h5>
        </div>
        <div class="video">
            <iframe
                src="https://www.youtube.com/embed/h9SHLQuukqg?autoplay=1&mute=1&controls=0&loop=1&playlist=h9SHLQuukqg"
                title="YouTube video player" frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


        </div>
        <div class="racik">
            <div class="card">
                <div class="card-header">
                    <h1>OBAT RACIK DILAYANI</h1>
                </div>
                <div class="card-body">
                    <ul v-for="list in racik" :key="list.id">
                        <li class="list-nama">
                            <p>{{ list.nm_pasien }}</p>
                            <span class="h6">
                                <p>NO RAWAT : {{ list.no_rawat }}</p>
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="non-racik">
            <div class="card">
                <div class="card-header">
                    <h1>OBAT NON-RACIK DILAYANI</h1>
                </div>
                <div class="card-body">
                    <ul v-for="list in nonRacik" :key="list.id" class="d-flex">
                        <li class="list-nama">
                            <p>{{ list.nm_pasien }}</p>
                            <span class="h6">
                                <p>NO RAWAT : {{ list.no_rawat }}</p>
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</template>


<style scoped>
.wrapper {
    display: grid;
    grid-template-columns: 0.5fr 0.5fr 1.2fr;
    grid-template-rows: 0.75fr 1.5fr 1fr;
    gap: 16px;
    grid-template-areas:
        "header header header"
        "racik non-racik video"
        "brand brand pasien";
    ;
    width: 100%;
    height: 100vh;
    background-image: url('/src/assets/img/vector3.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    margin: 0;
    padding: 0;
    color: var(--warna1);
}

.card {
    width: 100%;
    height: 100%;
    background: rgba(255, 255, 255, 0.1);
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(9.1px);
    -webkit-backdrop-filter: blur(9.1px);
    border-bottom: 1px solid rgba(255, 255, 255, 0.3);
    color: var(--warna1);
}

.card-header {
    border-bottom: 1px solid rgba(255, 255, 255, 0.3);
    width: 100%;
    padding: 8px;
}

.card-header h1 {
    font-size: 0.8em;
    text-align: center;
    padding: 0.5rem;
    color: var(--warna2);

}

ul li.list-nama p {
    font-size: 0.75em;
    margin: 0;
    font-weight: 700;
}

ul {
    list-style-type: square;
}

/* #region HEADER */

.header {
    grid-area: header;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    background: rgba(255, 255, 255, 0.1);
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(9.1px);
    -webkit-backdrop-filter: blur(9.1px);
    border-bottom: 1px solid rgba(255, 255, 255, 0.3);
}

/* #endregion HEADER */
/* #region RACIK */
.racik {
    grid-area: racik;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 16px;
}

/* #endregion RACIK */
/* #region NON-RACIK */
.non-racik {
    grid-area: non-racik;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* #endregion NON-RACIK */
/* #region VIDEO */
.video {
    grid-area: video;
    background-color: black;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-right: 16px;
}

.video iframe {
    width: 100%;
    height: 100%;
}

/* #endregion VIDEO */
/* #region PASIEN */
.pasien {
    grid-area: pasien;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin: 0 0 8px 0;
    border-radius: 50px 0 0 50px;
    background: rgb(4, 4, 4);
    background: linear-gradient(310deg, rgba(4, 4, 4, 1) 0%, rgba(32, 185, 246, 0.29698375870069604) 100%);
    backdrop-filter: blur(12.5px);
    -webkit-backdrop-filter: blur(12.5px);
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.678);
}

.pasien h1 {
    font-size: 1.5em;
    font-weight: bold;
    text-shadow: 2px 2px 4px rgb(0, 0, 0);
    margin: 0;
    padding: 16px 0;
}

.pasien h5 {
    font-size: 0.75em;
}

/* #endregion PASIEN */
/* #region BRAND */
.brand {
    grid-area: brand;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    border-radius: 0 50px 50px 0;
    background: rgb(4, 4, 4);
    background: linear-gradient(49deg, rgba(4, 4, 4, 1) 0%, rgba(32, 185, 246, 0.5) 100%);
    backdrop-filter: blur(12.5px);
    -webkit-backdrop-filter: blur(12.5px);
    margin-bottom: 8px;
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.678);
}

.brand img {
    width: 60px;
    padding: 8px;
    margin-bottom: 8px;
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.295);
}

.brand h1 {
    font-size: 2em;
    font-weight: bold;
    text-shadow: 2px 2px 4px rgb(0, 0, 0);
}

.brand p {
    font-family: "Satisfy", cursive;
    font-size: 1.2em;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.534);
}

/* #endregion BRAND */
/* #region LAYAR LEBAR */
@media only screen and (min-width: 1200px) {
    .wrapper {
        grid-template-columns: 0.5fr 0.5fr 1fr;
        grid-template-rows: 0.5fr 1.5fr 0.75fr;
        gap: 16px;
    }

    .racik li,
    .non-racik li {
        font-size: 1.2em;
        font-weight: 200;
    }

    .racik .card-header h1,
    .non-racik .card-header h1 {
        font-size: 1em;
    }

    .brand h1 {
        font-size: 2em;
    }

    .brand p {
        font-size: 1.2em;
    }

    .brand img {
        width: 50px;
    }
}

@media only screen and (min-width: 1400px) {
    .header h1 {
        font-size: 5em;
    }

    .header p {
        font-size: 1.5em;
    }

    .pasien h1 {
        font-size: 3em;
    }

    .pasien h5 {
        font-size: 1.2em;
    }

    .pasien p {
        font-size: 1.5em;
    }

    .brand h1 {
        font-size: 3em;
    }

    .brand p {
        font-size: 1.2em;
    }

    .brand img {
        width: 70px;
    }

}

/* #endregion LAYAR LEBAR */
</style>