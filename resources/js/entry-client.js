// import Vue from 'vue';
// import 'es6-promise/auto';
// import { createApp } from './app';
//
// Vue.mixin({
//     beforeRouteUpdate (to, from, next) {
//         const { asyncData } = this.$options
//         if (asyncData) {
//             asyncData({
//                 // store: this.$store,
//                 route: to
//             }).then(next).catch(next)
//         } else {
//             next()
//         }
//     }
// });
//
// const { app, router } = createApp();
//
// router.onReady(() => {
//     // Add router hook for handling asyncData.
//     // Doing it after initial route is resolved so that we don't double-fetch
//     // the data that we already have. Using router.beforeResolve() so that all
//     // async components are resolved.
//     router.beforeResolve((to, from, next) => {
//         const matched = router.getMatchedComponents(to);
//         const prevMatched = router.getMatchedComponents(from);
//         let diffed = false;
//         const activated = matched.filter((c, i) => {
//             return diffed || (diffed = (prevMatched[i] !== c));
//         });
//         const asyncDataHooks = activated.map(c => c.asyncData).filter(_ => _);
//         if (!asyncDataHooks.length) {
//             return next();
//         }
//
//         // bar.start()
//         Promise.all(asyncDataHooks.map(hook => hook({route: to})))
//             .then(() => {
//                 // bar.finish()
//                 next();
//             })
//             .catch(next);
//     });
//
//     // actually mount to DOM
//     app.$mount('#app');
// });
//
import app from './app'

app.$mount('#app');
