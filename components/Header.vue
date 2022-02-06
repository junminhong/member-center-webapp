<template>
  <v-app-bar :clipped-left="clipped" fixed app>
    <v-toolbar-title v-text="title" @click="gotoHomePage()" />
    <v-spacer />
    <div>Enjoy this world！</div>
    <v-spacer></v-spacer>
    <v-badge :content="messages" :value="messages" color="red" overlap>
      <v-icon large> mdi-bell </v-icon>
    </v-badge>
    <v-avatar color="primary" style="margin-left: 20px"></v-avatar>
    <v-btn v-show="false" @click="gotoLoginPage()"> 登入 </v-btn>
  </v-app-bar>
</template>

<script>
export default {
  name: 'HeaderComponent',
  data() {
    return {
      clipped: false,
      title: '原子世界',
      messages: 1,
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
