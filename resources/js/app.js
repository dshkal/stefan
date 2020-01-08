// // require('./bootstrap');
// import App from './App.vue';
// import Vue from 'vue';
// import { createRouter } from './router';
//
// // export default new Vue({
// //     render: h => h(App)
// // });
// export function createApp() {
//     const router = createRouter();
//     const app = new Vue({
//         router,
//         render: h => h(App)
//     });
//     return { app, router };
// };
import App from './App.vue';
import Vue from 'vue';
import router from './router'

export default new Vue({
    router,
    render: h => h(App)
});
