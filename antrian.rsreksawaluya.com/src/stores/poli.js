// stores/poli.js
import { defineStore } from "pinia";
import axios from "axios";

export const usePoliStore = defineStore({
  id: "poli",
  state: () => ({
    pasienList: [],
    selectedDoctor: "",
    selectedDate: "",
    selectedPoli: "",
    currentPage: 1,
    itemsPerPage: 10,
  }),
  getters: {
    filteredPasienList(state) {
      let filtered = state.pasienList;
      if (state.selectedDoctor) {
        filtered = filtered.filter(
          (pasien) => pasien.nm_dokter === state.selectedDoctor
        );
      }
      if (state.selectedDate) {
        filtered = filtered.filter(
          (pasien) => pasien.tgl_registrasi === state.selectedDate
        );
      }
      return filtered;
    },
    paginatedList(state, getters) {
      const start = (state.currentPage - 1) * state.itemsPerPage;
      const end = start + state.itemsPerPage;
      return getters.filteredPasienList.slice(start, end);
    },
    totalPages(state, getters) {
      return Math.ceil(getters.filteredPasienList.length / state.itemsPerPage);
    },
    startPage(state, getters) {
      if (state.currentPage <= 5) {
        return 1;
      } else if (state.currentPage > getters.totalPages - 5) {
        return getters.totalPages - 9;
      } else {
        return state.currentPage - 4;
      }
    },
    endPage(state, getters) {
      if (state.currentPage <= 5) {
        return 10;
      } else if (state.currentPage > getters.totalPages - 5) {
        return getters.totalPages;
      } else {
        return state.currentPage + 5;
      }
    },
    doctorList(state) {
      const allDoctors = state.pasienList.map((pasien) => pasien.nm_dokter);
      return [...new Set(allDoctors)];
    },
  },
  actions: {
    async fetchPasienList() {
      try {
        const response = await axios.get("api/poli/list-pasien");
        this.pasienList = response.data;
      } catch (error) {
        console.error(error);
      }
    },
    async callPatient(pasien) {
      if (!this.selectedPoli || !this.selectedDoctor || !this.selectedDate) {
        alert("Poli, Dokter, dan Tanggal tidak boleh kosong");
        return;
      }

      try {
        const response = await axios.post("/api/poli/panggil-pasien", {
          nm_pasien: pasien.nm_pasien,
          no_rawat: pasien.no_rawat,
          poli_nomor: this.selectedPoli,
          nm_dokter: pasien.nm_dokter,
        });
        console.log(response.data);
      } catch (error) {
        console.error(error);
      }
    },
    setPage(page) {
      this.currentPage = page;
    },
    nextPage(getters) {
      if (this.currentPage < getters.totalPages) {
        this.currentPage++;
      }
    },
    prevPage() {
      if (this.currentPage > 1) {
        this.currentPage--;
      }
    },
  },
});
