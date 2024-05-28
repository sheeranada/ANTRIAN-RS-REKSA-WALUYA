import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import { useAuthStore } from "@/stores/auth";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
      meta: {
        guest: true,
      },
    },
    {
      path: "/dashboard",
      name: "dashboard",
      component: () => import("../views/DashboardView.vue"),
      meta: {
        requiresAuth: true,
      },
    },
    {
      path: "/display-admisi",
      name: "display-admisi",
      component: () => import("@/components/admisi/DisplayAdmisi.vue"),
      meta: {
        requiresAuth: true,
      },
    },
    {
      path: "/display-farmasi",
      name: "display-farmasi",
      component: () => import("@/components/farmasi/DisplayFarmasi.vue"),
      meta: {
        requiresAuth: true,
      },
    },
    {
      path: "/display-poli",
      name: "display-poli",
      component: () => import("@/components/poli/DisplayPoli.vue"),
      meta: {
        requiresAuth: true,
      },
    },
    {
      path: "/admin-poli",
      name: "admin-poli",
      component: () => import("@/components/poli/AdminPoli.vue"),
      meta: {
        requiresAuth: true,
      },
    },
    {
      path: "/admin-tpp",
      name: "admin-tpp",
      component: () => import("@/components/admisi/AdminTPP.vue"),
      meta: {
        requiresAuth: true,
      },
    },
    {
      path: "/admin-farmasi",
      name: "admin-farmasi",
      component: () => import("@/components/farmasi/AdminFarmasi.vue"),
      meta: {
        requiresAuth: true,
      },
    },
    {
      path: "/login",
      name: "login",
      component: () => import("@/components/AUTH/LoginView.vue"),
      meta: {
        guest: true,
      },
    },
  ],
});

router.beforeEach(async (to, from, next) => {
  const isLogin = localStorage.getItem("isLogin");

  if (to.meta.requiresAuth && !isLogin) {
    next({ name: "login" });
  } else if (to.meta.guest && isLogin) {
    next({ name: "dashboard" });
  } else {
    next();
  }
});

export default router;
