<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'
import { useAuthStore } from '@/stores/auth';

const storeAuth = useAuthStore();

const antrian = ref([])
const lastPrint = ref([])
const lastCall = ref([])
const lastCallPlus = ref([])
const pilihLoket = ref(null)

const no_antrian = ref('')
const loket = ref('')
const noAntrianManual = ref(0)
let previousData = null;

// SPEAK DATA
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

const fetchAntrian = async () => {
  try {
    const response = await axios.get('/api/loket/tampilkan-antrian')
    antrian.value = response.data
    if (previousData === null || previousData.no_antrian !== response.data.no_antrian || previousData.loket !== response.data.loket) {
      speak(`nomor antrian ${response.data.no_antrian}, . harap menuju loket . ${response.data.loket}`);
    }
    previousData = response.data;
  } catch (error) {
    if (error.response && error.response.status === 429) {
      setTimeout(fetchAntrian, 5000);
    } else {
      console.log(error);

    }
  }
}
// END SPEAK DATA

const callPatien = async (no_antrian, loket) => {
  try {
    const response = await axios.post('/api/loket/panggil-antrian', {
      no_antrian: no_antrian,
      loket: pilihLoket.value

    })
    alert('Panggilan Berhasil')
  } catch (error) {
    alert('PANGGILAN GAGAL ! PASTIKAN LOKET SUDAH DIPILIH DAN NO ANTRIAN SESUAI DENGAN YANG DIPANGGIL')
    if (error.response && error.response.status === 429) {
      // Terlalu banyak permintaan, atur backoff sebelum mencoba lagi
      setTimeout(callPatien, 5000); // Tunggu 5 detik sebelum mencoba lagi
    } else {
      console.log(error);

    }

  }
}
const callPatienManual = async () => {
  try {
    const response = await axios.post('/api/loket/panggil-antrian-manual', {
      no_antrian: noAntrianManual.value,
      loket: pilihLoket.value
    })
    noAntrianManual.value = 0
    alert('Panggilan Berhasil')
  } catch (error) {
    alert('PANGGILAN GAGAL ! PASTIKAN LOKET SUDAH DIPILIH DAN NO ANTRIAN SESUAI DENGAN YANG DIPANGGIL')
    if (error.response && error.response.status === 429) {
      // Terlalu banyak permintaan, atur backoff sebelum mencoba lagi
      setTimeout(callPatienManual, 5000); // Tunggu 5 detik sebelum mencoba lagi
    } else {
      console.log(error);
    }
  }

}


const fetchLastPrint = async () => {
  try {
    const response = await axios.get('/api/loket/last-cetak')
    lastPrint.value = response.data
  } catch (error) {
    if (error.response && error.response.status === 429) {
      // Terlalu banyak permintaan, atur backoff sebelum mencoba lagi
      setTimeout(fetchLastPrint, 5000); // Tunggu 5 detik sebelum mencoba lagi
    } else {
      console.log(error);
    }
  }
}

const fetchLastCallPlus = async () => {
  try {
    const response = await axios.get('/api/loket/last-call-ticket')
    lastCallPlus.value = { ...response.data, no_antrian: parseInt(response.data.no_antrian) + 1 }
  } catch (error) {
    if (error.response && error.response.status === 429) {
      // Terlalu banyak permintaan, atur backoff sebelum mencoba lagi
      setTimeout(fetchLastCallPlus, 5000); // Tunggu 5 detik sebelum mencoba lagi
    } else {
      console.log(error);
    }
  }
}
const fetchLastCall = async () => {
  try {
    const response = await axios.get('/api/loket/last-call-ticket')
    lastCall.value = response.data
  } catch (error) {
    if (error.response && error.response.status === 429) {
      // Terlalu banyak permintaan, atur backoff sebelum mencoba lagi
      setTimeout(fetchLastCall, 5000); // Tunggu 5 detik sebelum mencoba lagi
    } else {
      console.log(error);
    }
  }
}


onMounted(() => {
  setInterval(() => {
    fetchLastCall()
    fetchLastCallPlus()
    fetchAntrian()
  }, 1000)
  setInterval(() => {
    fetchLastPrint()
  }, 10000)
})


</script>
<template>
  <div class="container-fluid">
    <header class="header">
      <h1>The Story of a Family Champion</h1>
    </header>
    <div class="caption">
      "Tetaplah <span>berjuang</span>, meski jalan <span>terasa berat</span>. <br> Karena setiap
      <span>langkah</span> yang kita
      ambil, <br>
      adalah hadiah
      <span>berharga </span><br>
      untuk masa depan <span>keluarga kita</span>. 💪❤️"
      <br><br>
      <p>dev.by Didit © 2024 - RS REKSA WALUYA</p>
    </div>
    <form action="">

    </form>
    <div class="workspace">
      <div class="row">
        <div class="col">
          <p v-if="storeAuth.user">Welcome, {{ storeAuth.user.name }}</p>
        </div>
      </div>
      <div class="row d-flex">
        <div class="col d-flex justify-content-center align-items-center">
          <div class="card">
            <div class="row g-0">
              <div class="last-print col-10 d-flex justify-center align-items-center">
                CETAK TERAKHIR (DI SECURITY) NOMOR :
              </div>
              <div class="col-2">
                <div class="card-body" v-if="lastPrint">
                  <h1>{{ lastPrint.nomor }}</h1>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row d-flex">
        <div class="col d-flex justify-content-center align-items-center">
          <div class="card">
            <div class="row g-0">
              <div class="last-print col-10 d-flex justify-center align-items-center">
                TERAKHIR DIPANGGIL NOMOR :
              </div>
              <div class="col-2">
                <div class="card-body" v-if="lastCall">
                  <h1>{{ lastCall.no_antrian }}</h1>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <div class="form-floating">
            <select class="form-select" id="floatingSelect" aria-label="Floating label select example"
              v-model="pilihLoket" required>
              <option selected disabled value="">Loket berapa ?</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
            </select>
            <label for="floatingSelect">Pilih Loket</label>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <div class="card">
            <div class="card-header text-center">
              PANGGIL SESUAI URUTAN
            </div>
            <div class="card-body row d-flex ">
              <div class="col-6 d-flex justify-content-center align-items-center" v-if="lastCallPlus">
                <!-- <h1>{{ lastCallPlus.no_antrian }}</h1> -->
                <input class="form-control text-center" type="number" name="no_antrian" id=""
                  v-model="lastCallPlus.no_antrian" value="{{ lastCallPlus.no_antrian }}" readonly>
              </div>
              <div class="col-6 d-flex justify-content-center align-items-center">
                <button type="submit" class="btn btn-primary" @click="callPatien(lastCallPlus.no_antrian, loket)">
                  PANGGIL
                  <i class="fas fa-bullhorn"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card">
            <div class="card-header text-center">
              PANGGIL MANUAL
            </div>
            <div class="card-body row d-flex ">
              <div class="col-6 d-flex justify-content-center align-content-center">
                <input type="number" class="form-control text-center" id="exampleInputEmail1"
                  aria-describedby="emailHelp" v-model="noAntrianManual">
              </div>
              <div class="col-6 d-flex justify-content-center align-items-center">
                <button type="submit" class="btn btn-danger" @click="callPatienManual(noAntrianManual, loket)">
                  PANGGIL
                  <i class="fas fa-bullhorn"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
    <footer class="footer">

    </footer>
  </div>
</template>



<style scoped>
.container-fluid {
  background-image: url('/src/assets/img/vector1.jpg');
  background-size: cover;
  background-position: top center;
  background-repeat: no-repeat;
  height: 100vh;
  width: 100%;
  padding: 0px 50px 0 50px;
  font-family: "Poppins", sans-serif;
  color: var(--warna11);
  display: grid;
  gap: 32px;
  grid-template-rows: 1fr 2fr;
  grid-template-columns: 1fr 2fr;
  grid-template-areas:
    "header header"
    "workspace caption"
  ;
}

h1 {
  margin: 0;
}

.header {
  grid-area: header;
  display: flex;
  justify-content: end;
  align-items: center;
  top: 0;
}

.header h1 {
  font-size: 3em;
  color: var(--warna11);
  text-shadow: 5px 2px 10px rgb(255, 255, 255);
  font-family: "Pacifico", cursive;
}

.caption {
  grid-area: caption;
  align-content: center;
  font-size: 2em;
  font-weight: bold;
  text-align: right;
  color: var(--warna11);
  text-shadow: 5px 2px 10px rgb(255, 253, 253);
}

.caption P {
  font-size: .5em;
  font-weight: 900;
  color: var(--warna11);

}

.caption span {
  font-size: 1.2em;
  text-transform: uppercase;
  font-weight: 900;
}

/* WORKSPACE */
.workspace {
  grid-area: workspace;
  gap: 16px;
  padding: 16px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-content: center;
  background: rgba(255, 255, 255, 0.096);
  border-radius: 16px;
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(9.8px);
  -webkit-backdrop-filter: blur(9.8px);
  border: 1px solid rgba(255, 255, 255, 0.28);

}

.workspace .card {
  width: 100%;
  background: rgba(255, 255, 255, 0.096);
  border-radius: 16px;
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(9.8px);
  -webkit-backdrop-filter: blur(9.8px);
  border: 1px solid rgba(255, 255, 255, 0.28);
}

.workspace .card-header {
  color: var(--warna11);
  font-weight: bold;
  font-size: 1em;
  border-radius: 16px 16px 0 0;
}

.workspace .card-body {
  padding: 16px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.workspace input {
  font-size: 1em;
  width: 100%;
  height: 60px;
}

.workspace h1 {
  font-weight: bold;
  color: var(--warna11);
  margin: 0;
  text-align: right;
  font-size: 1.5em;
}

.workspace h5,
p {
  margin: 0;
  margin-right: 16px;
  font-weight: 400;
  font-style: normal;
  color: var(--warna11);

}

.last-print {
  font-weight: bold;
  padding: 16px;
}

/* END WORKSPACE */

@media only screen and (max-width: 600px) {
  .container-fluid {
    padding: 0px 10px 0 10px;
    display: grid;
    gap: 16px;
    grid-template-rows: 1fr 2fr auto;
    grid-template-columns: 1fr;
    grid-template-areas:
      "header"
      "workspace"
      "caption";
  }

  .header {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .header h1 {
    font-size: 2em;
    text-align: center;
  }

  .caption {
    font-size: 1em;
  }

  .caption P {
    font-size: .7em;
  }

  .caption span {
    font-size: .8em;
  }

  .workspace {
    padding: 8px;
    height: 100%;
  }

  .workspace .card {
    width: 100%;
    height: 100%;
    padding: 8px;
    display: flex;
  }

  .workspace .card-body {
    padding: 8px;
    display: flex;
    justify-content: center;
    align-items: center;

  }

  .workspace .card-header {
    font-size: .6em;
  }

  .workspace h5,
  p {
    font-size: .8em;
  }

  .workspace input {
    font-size: .8em;
    width: 100%;
    height: 50px;
  }

  .last-print {
    font-size: .8em;
  }
}

@media only screen and (max-width: 768px) {
  .container-fluid {
    padding: 0px 50px 0 50px;
    display: grid;
    gap: 32px;
    grid-template-rows: 1fr 2fr;
    grid-template-columns: 1fr 2fr;
    grid-template-areas:
      "header header"
      "workspace workspace"
      "caption caption";
  }
}

@media only screen and (max-width: 992px) {
  .container-fluid {
    padding: 0px 50px 0 50px;
    display: grid;
    gap: 32px;
    grid-template-rows: 1fr 2fr;
    grid-template-columns: 1fr 2fr;
    grid-template-areas:
      "header header"
      "workspace workspace"
      "caption caption";
  }

  .header {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .header h1 {
    font-size: 2em;
    text-align: center;
  }

  .caption {
    font-size: 1em;
  }

  .caption P {
    font-size: .7em;
  }

  .caption span {
    font-size: .8em;
  }

  .workspace {
    padding: 8px;
    height: 100%;
  }

  .workspace .card {
    width: 100%;
    height: 100%;
    padding: 8px;
    display: flex;
  }

  .workspace .card-body {
    padding: 8px;
    display: flex;
    justify-content: center;
    align-items: center;

  }

  .workspace .card-header {
    font-size: .6em;
  }

  .workspace h5,
  p {
    font-size: .8em;
  }

  .workspace input {
    font-size: .8em;
    width: 100%;
    height: 50px;
  }

  .last-print {
    font-size: .8em;
  }
}

@media only screen and (max-width: 1200px) {
  .container-fluid {
    padding: 0px 50px 0 50px;
    display: grid;
    gap: 32px;
    grid-template-rows: 1fr 2fr;
    grid-template-columns: 1fr 2fr;
    grid-template-areas:
      "header header"
      "workspace workspace"
      "caption caption";
  }

  .header {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .header h1 {
    font-size: 2em;
    text-align: center;
  }

  .caption {
    font-size: 1em;
  }

  .caption P {
    font-size: .7em;
  }

  .caption span {
    font-size: .8em;
  }

  .workspace {
    padding: 8px;
    height: 100%;
  }

  .workspace .card {
    width: 100%;
    height: 100%;
    padding: 8px;
    display: flex;
  }

  .workspace .card-body {
    padding: 8px;
    display: flex;
    justify-content: center;
    align-items: center;

  }

  .workspace .card-header {
    font-size: .6em;
  }

  .workspace h1 {
    font-size: 1.5em;
  }

  .workspace .workspace h5,
  p {
    font-size: .8em;
  }

  .workspace input {
    font-size: .8em;
    width: 100%;
    height: 50px;
  }

  .last-print {
    font-size: .8em;
  }
}
</style>