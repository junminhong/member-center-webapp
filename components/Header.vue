<template>
  <v-app-bar :clipped-left="clipped" fixed app>
    <v-toolbar-title v-text="title" @click="gotoHomePage()"/>
    <v-spacer></v-spacer>
    <v-btn @click="gotoLoginPage()"> 登入 </v-btn>
  </v-app-bar>
</template>

<script>
export default {
  name: 'HeaderComponent',
  data() {
    return {
      clipped: false,
      title: '原子世界',
    }
  },
  methods: {
    gotoHomePage() {
      this.$router.push('/')
    },
    gotoLoginPage() {
      this.$router.push('login')
    },
  },
}
</script>

<style></style>
