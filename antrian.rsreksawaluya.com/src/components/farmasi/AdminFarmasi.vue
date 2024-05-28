<script setup>
import { ref, onMounted, computed } from 'vue';
import axios from 'axios';
import Navbar from '@/components/Navbar.vue';

const listPasien = ref([]);
const pasienDipanggil = ref([]);
const currentPage = ref(1);
const itemsPerPage = ref(10);
const searchQuery = ref('');
const resetSearch = () => {
    searchQuery.value = '';
};
const filterDate = ref('');
const filterStatus = ref('');
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
// END SPEAK DATA

// SUBMIT PANGGIL PASIEN KE DB
const panggilPasien = async (pasien) => {
    try {
        const response = await axios.post('/api/farmasi/panggil-pasien', {
            nm_pasien: pasien.nm_pasien,
            no_rawat: pasien.no_rawat
        });
        alert('Berhasil memanggil pasien');
    } catch (error) {
        if (error.response && error.response.status === 429) {
            setTimeout(panggilPasien, 5000);
        } else {
            console.log(error);
        }
    }
};
// END SUBMIT PANGGIL PASIEN KE DB
// TAMPILKAN ANTRIAN YANG DIPANGGIL
const fetchPasienDipanggil = async () => {
    try {
        const response = await axios.get('/api/farmasi/tampilkan-antrian');
        pasienDipanggil.value = response.data;
        if (previousData === null || previousData.nm_pasien !== response.data.nm_pasien) {
            speak(`Pasien atas nama ${response.data.nm_pasien}, . harap menuju loket farmasi`);
        }
        previousData = response.data;
    } catch (error) {
        if (error.response && error.response.status === 429) {
            setTimeout(fetchPasienDipanggil, 5000);
        } else {
            console.log(error);

        }
    }
};
// END TAMPILKAN ANTRIAN YANG DIPANGGIL
// TAMPILKAN PASIEN
const fetchListPasien = async () => {
    try {
        const response = await axios.get('/api/farmasi/list-pasien');
        listPasien.value = response.data;
    } catch (error) {
        if (error.response && error.response.status === 429) {
            setTimeout(fetchListPasien, 5000);
        } else {
            console.log(error);

        }
    }
};
// END TAMPILKAN PASIEN
// PAGINATED DATA
const paginatedData = computed(() => {
    const start = (currentPage.value - 1) * itemsPerPage.value;
    const end = start + itemsPerPage.value;
    return filteredData.value.slice(start, end);
});
const pageCount = computed(() => {
    return Math.ceil(listPasien.value.length / itemsPerPage.value);
});

const changePage = (newPage) => {
    currentPage.value = newPage;
};
const visiblePages = computed(() => {
    const pages = [];
    const start = Math.max(1, currentPage.value - 2);
    const end = Math.min(pageCount.value, currentPage.value + 2);
    if (start > 1) {
        pages.push('...');
    }
    for (let i = start; i <= end; i++) {
        pages.push(i);
    }
    if (end < pageCount.value) {
        pages.push('...');
    }
    return pages;
});
// END PAGINATED DATA
// FILTERED DATA

const filteredData = computed(() => {
    let filtered = listPasien.value;
    if (searchQuery.value) {
        filtered = filtered.filter(pasien => pasien.nm_pasien.toLowerCase().includes(searchQuery.value.toLowerCase()));
    }
    if (filterDate.value) {
        filtered = filtered.filter(pasien => pasien.tgl_peresepan === filterDate.value);
    }
    if (filterStatus.value) {
        filtered = filtered.filter(pasien => pasien.status.toLowerCase() === filterStatus.value.toLowerCase());
    }
    return filtered;
});
// END FILTERED DATA

onMounted(() => {
    setInterval(() => {
        fetchListPasien();
        fetchPasienDipanggil();
    }, 1000);
});

</script>
<template>
    <Navbar />
    <div class="container vw-100 vh-100">
        <div class="row mb-5 mt-5">
            <div class="col d-flex justify-content-center align-items-center">
                <h1>ANTRIAN FARMASI</h1>
            </div>
        </div>
        <div class="row">
            <div class="col d-flex justify-content-end">
                <div class="alert alert-info alert-dismissible fade show w-50 " role="alert" v-if="pasienDipanggil">
                    Pasien dipanggil : <strong>{{ pasienDipanggil.nm_pasien }}</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-4">
                <div class="form-floating">
                    <input type="date" class="form-control" id="floatingInputValue" placeholder="name@example.com"
                        value="test@example.com" v-model="filterDate">
                    <label for="floatingInputValue">FILTER TANGGAL PERESEPAN</label>
                </div>
            </div>
            <div class="col-4">
                <div class="form-floating">
                    <select class="form-select" id="floatingSelect" aria-label="Floating label select example"
                        v-model="filterStatus">
                        <option selected value disabled>STATUS</option>
                        <option value="ranap">RANAP</option>
                        <option value="ralan">RALAN</option>
                    </select>
                    <label for="floatingSelect">RANAP / RALAN</label>
                </div>
            </div>
            <div class="col-4 d-flex justify-content-between align-items-center gap-2">
                <div class="form-floating w-100">
                    <input type="text" class="form-control" id="floatingInputValue" placeholder="cari"
                        v-model="searchQuery">
                    <label for="floatingInputValue">
                        <i class="fas fa-search"></i>
                        Cari Pasien
                    </label>
                </div>
                <button type="button" class="btn btn-secondary h-100 w-25" @click="resetSearch">
                    <i class="fas fa-x"></i>
                </button>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <table class="table
                table-striped table-hover
                table-bordered table-responsive
                table-sm
                ">
                    <thead>
                        <tr class="text-center">
                            <th>TANGGAL PERESEPAN</th>
                            <th>NO RAWAT</th>
                            <th>NO RM</th>
                            <th>NAMA PASIEN</th>
                            <th>STATUS</th>
                            <th><i class="fas fa-gear"></i></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="text-uppercase text-center" v-for="pasien in paginatedData" :key="pasien.no_rawat"
                            v-if="paginatedData.length">
                            <td>{{ pasien.tgl_peresepan }}</td>
                            <td>{{ pasien.no_rawat }}</td>
                            <td>{{ pasien.no_rkm_medis }}</td>
                            <td class="text-start">{{ pasien.nm_pasien }}</td>
                            <td>{{ pasien.status }}</td>
                            <td class="text-center">
                                <button class="btn btn-primary btn-sm" @click="panggilPasien(pasien)">
                                    <i class="fas fa-play"></i>
                                </button>
                            </td>
                        </tr>
                        <tr v-else>
                            <td colspan="6" class="text-center">DATA KOSONG</td>
                        </tr>
                    </tbody>
                </table>
                <nav aria-label="Page navigation example" class="d-flex justify-content-end">
                    <ul class="pagination">
                        <li class="page-item" :class="{ 'disabled': currentPage === 1 }">
                            <a class="page-link" href="#" @click.prevent="changePage(currentPage - 1)">Previous</a>
                        </li>
                        <li class="page-item" v-for="n in visiblePages" :key="n"
                            :class="{ 'active': n === currentPage }">
                            <a class="page-link" href="#" @click.prevent="changePage(n)">{{ n }}</a>
                        </li>
                        <li class="page-item" :class="{ 'disabled': currentPage === pageCount }">
                            <a class="page-link" href="#" @click.prevent="changePage(currentPage + 1)">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <nav class="navbar navbar-light bg-light fixed-bottom">
            <div class="container-fluid justify-content-end">
                <span class="navbar-text text-small">
                    antrian.rsreksawaluya.com v.2.0 - 2024 - All Rights Reserved &copy; didit@rsreksawaluya.com
                </span>
            </div>
        </nav>
    </div>
</template>