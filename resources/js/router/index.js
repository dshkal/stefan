import Vue from 'vue';
import Router from "vue-router";
import Home from "../views/Home";
import About from "../views/About";

Vue.use(Router);

// const Home = () => import('../views/Home.vue');
// const About = () => import('../views/About.vue');

export function createRouter () {
    return new Router({
        mode: 'history',
        fallback: false,
        scrollBehavior: () => ({ y: 0 }),
        routes: [
            { path: '/', component: Home, name: 'home' },
            { path: '/', component: About, name: 'about' }
        ]
    });
};
