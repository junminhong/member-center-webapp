# member-center-webapp
一個為了Member Center而生的Web APP。

## 串接文件
[API DOC](https://member-center.jmh-su.com/swagger/index.html)
[Live Demo - 開發中](https://member.jmh-su.com)

## 已完成串接功能
- [x] 登入會員
- [x] 註冊會員
- [x] 驗證信件Token

## 如何啟動部署
```bash
docker build -t member-center-webapp .
docker run -it -d -p 3000:3000 --name member-center-webapp member-center-webapp
```