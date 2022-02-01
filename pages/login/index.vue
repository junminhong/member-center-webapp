<template>
  <v-container>
    <v-row>
      <v-col cols="6">
        <v-img
          height="100%"
          lazy-src="https://picsum.photos/id/11/10/6"
          src="/imgs/singin.jpg"
        ></v-img>
      </v-col>
      <v-col cols="6">
        <v-expand-x-transition>
          <v-container v-show="loginExpend">
            <v-row align="center">
              <v-col cols="9" style="text-align: right"
                >Don't have an account?</v-col
              >
              <v-col cols="3"
                ><v-btn @click="expendRegister()" color="info" outlined rounded
                  >註冊</v-btn
                ></v-col
              >
            </v-row>
            <v-row justify="center">
              <form style="width: 100%">
                <v-text-field label="E-mail"></v-text-field>
                <v-text-field label="password"></v-text-field>

                <v-row align="center">
                  <v-col
                    ><v-switch
                      v-model="rememberMe"
                      inset
                      label="記住我"
                    ></v-switch
                  ></v-col>
                  <v-col style="text-align: right"
                    ><v-btn text> 忘記密碼？ </v-btn></v-col
                  >
                </v-row>

                <v-btn block> 登入 </v-btn>
              </form>
            </v-row>
          </v-container>
        </v-expand-x-transition>
        <v-expand-x-transition>
          <v-container v-show="registerExpend">
            <v-row align="center">
              <v-col cols="9" style="text-align: right"
                >Already a member?</v-col
              >
              <v-col cols="3"
                ><v-btn @click="expendLogin()" color="info" outlined rounded
                  >登入</v-btn
                ></v-col
              >
            </v-row>
            <v-row justify="center">
              <form style="width: 100%">
                <v-text-field label="E-mail"></v-text-field>
                <v-text-field label="password"></v-text-field>
                <v-text-field label="password"></v-text-field>

                <v-switch v-model="rememberMe" inset>
                  <template v-slot:label>
                    我已閱讀並同意<a href="">服務條款</a> 及
                    <a href="">隱私權政策</a>
                  </template></v-switch
                >

                <v-btn block> 註冊 </v-btn>
              </form>
            </v-row>
          </v-container>
        </v-expand-x-transition>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: 'LoginPage',
  data() {
    return {
      loginExpend: true,
      registerExpend: false,
      rememberMe: false,
    }
  },
  methods: {
    expendLogin() {
      this.registerExpend = !this.registerExpend
      setTimeout(() => {
        this.loginExpend = !this.loginExpend
      }, 600)
    },
    expendRegister() {
      this.loginExpend = !this.loginExpend
      setTimeout(() => {
        this.registerExpend = !this.registerExpend
      }, 600)
    },
  },
}
</script>

<style></style>
