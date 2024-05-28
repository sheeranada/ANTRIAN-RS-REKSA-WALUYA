import { defineStore } from "pinia";
import axios from "axios";
import router from "@/router";

export const useAuthStore = defineStore("auth", {
  state: () => ({
    authUser: null,
    isLogin: null,
  }),
  getters: {
    user: (state) => state.authUser,
  },
  actions: {
    async getUser() {
      try {
        const response = await axios.get("/api/user/show");
        this.authUser = response.data;
        this.isLogin = this.authUser.id;
      } catch (error) {
        if (error.response && error.response.status === 401) {
          localStorage.removeItem("isLogin");
          this.authUser = null;
          this.isLogin = null;
          router.push({ name: "home" });
        } else {
          console.error("Error while fetching user:", error);
        }
      }
    },
    async getToken() {
      await this.getUser();
      localStorage.setItem("isLogin", this.authUser.id);
    },
    async handleLogout() {
      await axios.post("/api/user/logout");
      localStorage.removeItem("isLogin");
      this.authUser = null;
      this.isLogin = null;
      router.push({ name: "home" });
    },
    async handleLogin(data) {
      await axios.post("/api/user/login", {
        email: data.email,
        password: data.password,
      });
      await this.getToken();
      router.push({ name: "dashboard" });
    },
  },
});
