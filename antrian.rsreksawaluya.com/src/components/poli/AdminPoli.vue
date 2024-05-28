<script setup>
import { ref, onMounted, onUnmounted, computed } from 'vue';
import axios from 'axios';
import Navbar from '@/components/Navbar.vue';

const pasienList = ref([]);
const selectedDoctor = ref('');
const selectedDate = ref('');
const selectedPoli = ref('');
const currentPage = ref(1);
const itemsPerPage = ref(10);
const tampilkanAntrian = ref([]);


const fetchTampilkanAntrian = async () => {
    try {
        const response = await axios.get('/api/poli/tampilkan-antrian');
        tampilkanAntrian.value = response.data;
    } catch (error) {
        if (error.response && error.response.status === 429) {
            setTimeout(fetchTampilkanAntrian, 5000);
        } else {
            console.log(error);
        }
    }
}

const callPatient = async (pasien) => {
    if (!selectedPoli.value || !selectedDoctor.value || !selectedDate.value) {
        alert('Poli, Dokter, dan Tanggal tidak boleh kosong');
        return;
    }

    try {
        const response = await axios.post('/api/poli/panggil-pasien', {
            nm_pasien: pasien.nm_pasien,
            no_rawat: pasien.no_rawat,
            poli_nomor: selectedPoli.value,
            nm_dokter: pasien.nm_dokter
        });
        console.log(response.data);
        alert('Berhasil memanggil pasien');
    } catch (error) {
        if (error.response && error.response.status === 429) {
            setTimeout(callPatient, 5000);
        } else {
            console.log(error);
        }
    }
};

const fetchData = async () => {
    try {
        const response = await axios.get('api/poli/list-pasien');
        pasienList.value = response.data;
    } catch (error) {
        if (error.response && error.response.status === 429) {
            setTimeout(fetchData, 5000);
        } else {
            console.log(error);
        }
    }
};
let intervalId;

onMounted(() => {
    setInterval(() => {
        fetchTampilkanAntrian()
        fetchData()
    }, 2500)
    intervalId = setInterval(fetchData, 5000);
});

onUnmounted(() => {
    clearInterval(intervalId);
});

const filteredPasienList = computed(() => {
    let filtered = pasienList.value;
    if (selectedDoctor.value) {
        filtered = filtered.filter(pasien => pasien.nm_dokter === selectedDoctor.value);
    }
    if (selectedDate.value) {
        filtered = filtered.filter(pasien => pasien.tgl_registrasi === selectedDate.value);
    }
    return filtered;
});

const paginatedList = computed(() => {
    const start = (currentPage.value - 1) * itemsPerPage.value;
    const end = start + itemsPerPage.value;
    return filteredPasienList.value.slice(start, end);
});

const totalPages = computed(() => Math.ceil(filteredPasienList.value.length / itemsPerPage.value));

const startPage = computed(() => {
    if (currentPage.value <= 5) {
        return 1;
    } else if (currentPage.value > totalPages.value - 5) {
        return totalPages.value - 9;
    } else {
        return currentPage.value - 4;
    }
});

const endPage = computed(() => {
    if (currentPage.value <= 5) {
        return 10;
    } else if (currentPage.value > totalPages.value - 5) {
        return totalPages.value;
    } else {
        return currentPage.value + 5;
    }
});

const doctorList = computed(() => {
    const allDoctors = pasienList.value.map(pasien => pasien.nm_dokter);
    return [...new Set(allDoctors)];
});

const setPage = (page) => {
    currentPage.value = page;
};

const nextPage = () => {
    if (currentPage.value < totalPages.value) {
        currentPage.value++;
    }
};

const prevPage = () => {
    if (currentPage.value > 1) {
        currentPage.value--;
    }
};
</script>
<template>
    <Navbar />
    <main class="container">
        <div class="row mt-5 mb-3">
            <div class="col">
                <h1 class="text-center">DATA PASIEN RAWAT JALAN</h1>
            </div>
        </div>
        <div class="row">
            <div class="col d-flex justify-content-end">
                <div class="alert alert-info alert-dismissible fade show w-50 " role="alert" v-if="tampilkanAntrian">
                    Pasien dipanggil : <strong>{{ tampilkanAntrian.nm_pasien }}</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <select class="form-select" aria-label="Default select example" v-model="selectedDoctor">
                    <option selected disabled value="">Pilih Dokter</option>
                    <option v-for="doctor in doctorList" :value="doctor">{{ doctor }}</option>
                </select>
            </div>
            <div class="col">
                <input type="date" class="form-control" v-model="selectedDate">
            </div>
            <div class="col">
                <select class="form-select" aria-label="Default select example" v-model="selectedPoli">
                    <option selected disabled value="">Pilih Poli</option>
                    <option v-for="poli in Array(14).fill().map((_, i) => i + 1)" :value="poli">{{ poli }}</option>
                </select>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col">
                <table class="table table-bordered table-hover table-responsive table-sm table-striped">
                    <thead>
                        <tr>
                            <th>TANGGAL REGISTRASI</th>
                            <th>NO RAWAT</th>
                            <th>NO RM</th>
                            <th>NAMA PASIEN</th>
                            <th>DOKTER</th>
                            <th>PANGGIL</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="pasien in paginatedList" :key="pasien.id">
                            <td>{{ pasien.tgl_registrasi }}</td>
                            <td>{{ pasien.no_rawat }}</td>
                            <td>{{ pasien.no_rkm_medis }}</td>
                            <td>{{ pasien.nm_pasien }}</td>
                            <td>{{ pasien.nm_dokter }}</td>
                            <td class="text-center">
                                <button type="button" value="Panggil" class="btn btn-primary btn-sm"
                                    @click="callPatient(pasien)">
                                    <i class="fas fa-volume-high"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-end">
                        <li class="page-item" :class="{ disabled: currentPage === 1 }">
                            <a class="page-link" href="#" @click.prevent="prevPage">Previous</a>
                        </li>
                        <li class="page-item" v-if="startPage > 1">
                            <a class="page-link" href="#">...</a>
                        </li>
                        <li class="page-item"
                            v-for="page in Array(endPage - startPage + 1).fill().map((_, i) => i + startPage)"
                            :key="page" :class="{ active: currentPage === page }">
                            <a class="page-link" href="#" @click.prevent="setPage(page)">{{ page }}</a>
                        </li>
                        <li class="page-item" v-if="endPage < totalPages">
                            <a class="page-link" href="#">...</a>
                        </li>
                        <li class="page-item" :class="{ disabled: currentPage === totalPages }">
                            <a class="page-link" href="#" @click.prevent="nextPage">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </main>
</template>



<style scoped></style>