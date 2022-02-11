<template>
  <v-row>
    <v-col cols="auto">
      <v-dialog
        transition="dialog-top-transition"
        max-width="600"
        v-model="dialog"
      >
        <template >
          <v-card>
            <v-toolbar :color="authType" dark>驗證信箱</v-toolbar>
            <v-card-text>
              <div class="text-h2 pa-12">{{ authMsg }}</div>
            </v-card-text>
            <v-card-actions class="justify-end">
              <v-btn text @click="gotoLogin">關閉</v-btn>
            </v-card-actions>
          </v-card>
        </template>
      </v-dialog>
    </v-col>
  </v-row>
</template>

<script>
export default {
  name: 'AuthEmailPage',
  data() {
    return {
      dialog: false,
      authType: 'primary',
      authMsg: '信箱驗證成功',
    }
  },
  mounted() {
    this.authEmailToken()
  },
  methods: {
    authEmailToken() {
      if (this.$route.query.email_token !== undefined) {
        this.$axios
          .post('/api/v1/auth/email?email_token=' + this.$route.query.email_token)
          .then((result) => {
            switch (result.data.result_code) {
              case 1013:
                this.dialog = true
                this.authType = 'error'
                this.authMsg = 'Email Token已經過期'
                break
              case 1014:
                this.dialog = true
                this.authType = 'success'
                this.authMsg = '信箱驗證成功'
                break
            }
          })
      } else {
        console.log('沒有要驗證')
        this.dialog = true
        this.authType = 'error'
        this.authMsg = '信箱驗證失敗'
      }
    },
    gotoLogin(){
        this.$router.push('/login')
    }
  },
}
</script>

<style></style>
