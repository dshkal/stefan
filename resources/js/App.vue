<template>
<!--    <div id="app" data-server-rendered="true">-->
<!--    </div>-->
    <div id="app">
        <router-view class="view"></router-view>
        <router-link to="/">Home</router-link>
        <router-link to="/about">About</router-link>
    </div>
</template>

<script>
export default {
  data: () => ({})
}
</script>
