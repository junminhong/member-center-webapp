<template>
  <v-container fluid fill-height>
    <v-row>
      <v-col>
        <v-window v-model="step">
          <v-window-item :value="1">
            <v-row align="center" justify="center">
              <v-col cols="10">
                <v-card outlined>
                  <v-card-title class="text-h4">立即建立您的帳戶</v-card-title>
                  <v-card-subtitle>持續為您更新有趣的服務</v-card-subtitle>
                  <v-card-text>
                    <v-form>
                      <v-text-field
                        label="email"
                        type="email"
                        prepend-inner-icon="mdi-email"
                        outlined
                      >
                      </v-text-field>
                      <v-text-field
                        v-model="password"
                        prepend-inner-icon="mdi-lock"
                        :append-icon="showEye ? 'mdi-eye' : 'mdi-eye-off'"
                        :rules="[rules.required, rules.min]"
                        :type="showEye ? 'text' : 'password'"
                        name="input-10-1"
                        label="請輸入您的密碼"
                        counter
                        outlined
                        @click:append="showEye = !showEye"
                      ></v-text-field>
                      <v-text-field
                        v-model="repeatPassword"
                        prepend-inner-icon="mdi-lock"
                        :append-icon="showEye2 ? 'mdi-eye' : 'mdi-eye-off'"
                        :rules="[rules.required, rules.min, rules.emailMatch]"
                        :type="showEye2 ? 'text' : 'password'"
                        name="input-10-1"
                        label="請再一次輸入您的密碼"
                        counter
                        outlined
                        @click:append="showEye2 = !showEye2"
                      ></v-text-field>
                    </v-form>
                    <v-row class="pl-4" align="center">
                      <v-switch
                        v-model="people"
                        color="primary"
                        value="ready"
                      ></v-switch>
                      已閱讀讀<a href="#">服務條約</a>
                    </v-row>
                    <v-btn class="primary" width="100%" @click="step++"
                      >註冊</v-btn
                    >
                    <hr class="my-4 ">
                    <v-row justify="end">已有帳戶？<a @click="step++">SIGN IN</a></v-row>
                  </v-card-text>
                </v-card>
              </v-col>
            </v-row>
          </v-window-item>
          <v-window-item :value="2">
            <v-card outlined shaped>
              <v-card-text>
                <v-btn width="100%" @click="step--">註冊</v-btn>
              </v-card-text>
            </v-card>
          </v-window-item>
        </v-window>
      </v-col>
    </v-row>
  </v-container>
</template>

<script scope>
export default {
  data() {
    return {
      showEye: false,
      showEye2: false,
      password: '',
      repeatPassword: '',
      step: 1,
      rules: {
        required: (value) => !!value || '不得為空！',
        min: (v) => v.length >= 8 || '最少八個字元！',
        emailMatch: (value) => this.password === value || `密碼不匹配！`,
      },
    }
  },
}
</script>
