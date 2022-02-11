<template>
  <v-container>
    <v-alert v-model="alert" :type="alertType" dismissible>
      {{ alertMsg }}
    </v-alert>
    <v-row>
      <v-col cols="6">
        <v-img
          max-height="100%"
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
                <v-text-field label="E-mail" v-model="email"></v-text-field>
                <v-text-field
                  label="password"
                  v-model="password"
                ></v-text-field>

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

                <v-btn block @click="loginHandler()"> 登入 </v-btn>
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
                <v-text-field label="E-mail" v-model="email"></v-text-field>
                <v-text-field
                  label="password"
                  v-model="password"
                ></v-text-field>
                <v-text-field label="暱稱" v-model="nickName"></v-text-field>

                <v-switch v-model="readMe" inset>
                  <template v-slot:label>
                    我已閱讀並同意<a href="">服務條款</a> 及
                    <a href="">隱私權政策</a>
                  </template></v-switch
                >

                <v-btn block @click="registerHandler()"> 註冊 </v-btn>
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
      email: '',
      password: '',
      nickName: '',
      alert: false,
      alertType: 'info',
      alertMsg: '',
      readMe: false,
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
    async loginHandler() {
      await this.$axios
        .post('/api/v1/member/login', {
          email: this.email,
          password: this.password,
        })
        .then((result) => {
          switch (result.data.result_code) {
            case 1005:
              this.alert = true
              this.alertType = 'error'
              this.alertMsg = '該信箱尚未註冊'
              break
            case 1006:
              this.alert = true
              this.alertType = 'error'
              this.alertMsg = '密碼輸入錯誤'
              break
            case 1007:
              this.$cookies.set(
                'atomic_token',
                result.data.data.refresh_atomic_token,
                {
                  maxAge:  60 * 60 * 4,
                }
              )
              this.$cookies.set(
                'refresh_atomic_token',
                result.data.data.refresh_atomic_token,
                {
                  maxAge:  60 * 60 * 24,
                }
              )
              this.$router.push('/')
              break
            case 1012:
              this.alert = true
              this.alertType = 'error'
              this.alertMsg = '該信箱尚未驗證'
              break
          }
          this.email = ''
          this.password = ''
        })
    },
    async registerHandler() {
      if (this.readMe) {
        await this.$axios
          .post('/api/v1/member', {
            email: this.email,
            password: this.password,
            nick_name: this.nickName,
          })
          .then((result) => {
            switch (result.data.result_code) {
              case 1002:
                this.alert = true
                this.alertType = 'error'
                this.alertMsg = '該信箱已經註冊'
                break
              case 1003:
                this.alert = true
                this.alertType = 'error'
                this.alertMsg = '帳號註冊失敗'
                break
              case 1004:
                this.alert = true
                this.alertType = 'success'
                this.alertMsg = '帳號註冊成功'
                break
            }
            this.email = ''
            this.password = ''
            this.nickName = ''
          })
      } else {
        this.alert = true
        this.alertType = 'warning'
        this.alertMsg = '要同意服務條款跟隱私權政策才能註冊哦'
      }
    },
  },
}
</script>

<style></style>
