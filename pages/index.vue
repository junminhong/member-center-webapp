<template>
  <v-container>
    <v-img :src="testImage" max-height="150" max-width="250"></v-img>
    <v-card>
      <v-toolbar flat color="primary" dark>
        <v-toolbar-title></v-toolbar-title>
      </v-toolbar>
      <v-tabs vertical>
        <v-tab>
          <v-icon left> mdi-account </v-icon>
          基本資料
        </v-tab>
        <v-tab>
          <v-icon left> mdi-lock </v-icon>
          密碼變更
        </v-tab>
        <v-tab>
          <v-icon left> mdi-access-point </v-icon>
          社群帳戶
        </v-tab>
        <v-tab>
          <v-icon left> mdi-server </v-icon>
          產品服務
        </v-tab>
        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <v-container style="margin-left: 30px">
                <v-row>
                  <v-avatar color="primary"></v-avatar>
                  <v-btn
                    color="blue-grey"
                    class="ma-2 white--text"
                    @click="loader = 'loading3'"
                  >
                    上傳大頭貼
                    <v-icon right dark> mdi-cloud-upload </v-icon>
                  </v-btn>
                </v-row>
                <v-row style="margin-top: 30px; width: 100%">
                  <v-form style="width: 100%">
                    使用者暱稱(可更改)：
                    <v-text-field label="使用者暱稱" solo></v-text-field>
                    E-mail
                    <v-text-field
                      label="test@gmail.com"
                      disabled
                      solo
                    ></v-text-field
                    ><v-btn block>保存</v-btn>
                  </v-form></v-row
                >
              </v-container>
            </v-card-text>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <v-form>
                舊密碼：
                <v-text-field label="舊密碼" solo></v-text-field>
                新密碼：
                <v-text-field label="新密碼" solo></v-text-field>
                確認新密碼：
                <v-text-field label="確認新密碼" solo></v-text-field>
                <v-btn block>變更</v-btn>
              </v-form>
            </v-card-text>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <v-alert border="top" colored-border type="info" elevation="2">
                暫時不開放此功能，未來此功能會用做支援新的產品服務。
              </v-alert>
              <v-form>
                LinkedIn：
                <v-text-field label="LinkedIn Url" solo></v-text-field>
                Facebook：
                <v-text-field label="Facebook url" solo></v-text-field>
                Instagram：
                <v-text-field label="Instagram url" solo></v-text-field>
                Twitter：
                <v-text-field label="Twitter url" solo></v-text-field>
                <v-btn block>連結社群</v-btn>
              </v-form>
            </v-card-text>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <v-container fluid>
                <v-row dense>
                  <v-col cols="6">
                    <v-card>
                      <v-img
                        src="/imgs/thrurl.png"
                        class="white--text align-end"
                        gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                        height="200px"
                      >
                        <v-card-title>Thrurl</v-card-title>
                      </v-img>

                      <v-card-subtitle
                        >一個簡單且易用的短網址服務</v-card-subtitle
                      >
                      <v-card-text></v-card-text>
                      <v-card-actions>
                        <v-spacer></v-spacer>

                        <v-btn
                          >使用此服務
                          <v-icon>mdi-arrow-u-right-top</v-icon>
                        </v-btn>
                      </v-card-actions>
                    </v-card>
                  </v-col>
                  <v-col cols="6">
                    <v-card>
                      <v-img
                        src="/imgs/comingsoon.jpg"
                        class="white--text align-end"
                        gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                        height="200px"
                      >
                        <v-card-title>Toot Clock</v-card-title>
                      </v-img>

                      <v-card-subtitle>台鐵時刻表查詢</v-card-subtitle>
                      <v-card-text></v-card-text>
                      <v-card-actions>
                        <v-spacer></v-spacer>

                        <v-btn disabled
                          >使用此服務(Coming Soon)
                          <v-icon>mdi-arrow-u-right-top</v-icon>
                        </v-btn>
                      </v-card-actions>
                    </v-card>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>
          </v-card>
        </v-tab-item>
      </v-tabs>
    </v-card>
  </v-container>
</template>

<script>
export default {
  name: 'IndexPage',
  data() {
    return {
      testImage: '',
    }
  },
  mounted() {
    this.getImage()
  },
  methods: {
    getImage() {
      this.$axios
        .$post('http://127.0.0.1:9010/api/v1/member/upload-mug-shot')
        .then((result) => {
          this.testImage = result.pathname
          console.log(result.pathname)
        })
    },
  },
}
</script>
