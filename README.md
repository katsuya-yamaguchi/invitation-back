# invitation-back

invitation-backは、「結婚式の招待状サービス」の招待客の認証を除くバックエンド処理を実現します。  
招待客の認証はFirebaseで行っており、Firebaseから取得したトークンで個人を特定しています。  

Rails APIで実現している機能は以下になります。

**アレルギーの状態を更新**  
招待客のアレルギー状態に関する情報をDB(カラム：allelgy_status)で管理しています。  
(「0」がアレルギー無し。「1」がアレルギー有り。)  
/userでpostリクエスト(Firebaseで取得した招待客の毎のトークンと一緒に)があった場合に、allelgy_statusを更新します。

**結婚式への出席状況を更新**  
招待客の出席状況に関する情報をDB(カラム：attend_status)で管理しています。  
(「0」が出席。「1」が欠席。)  
/userでpatchリクエスト(Firebaseで取得した招待客の毎のトークンと一緒に)があった場合に、attend_statusを更新します。

# Environment
## Dependency
詳細は、Gemfileを参照下さい。

## Database
全ての環境でsqlite3を使用しております。  
以下のようにDB初期化処理を行って下さい。  
`$ bundle exec rails db:migrate RAILS_ENV='[development or production or test]'`

## How to run the test suite
下記で全てのテストを行うことができます。  
`$ bundle exec rspec`

> modles/concerns/decode_jwt.rb の decodeメソッドに関するテストは失敗します。  
> <理由>  
> decodeメソッドは、Firebaseで取得したトークンを公開鍵で復号化しています。トークンは機密情報であるため、テストではトークンをENV['TOKEN']から呼び出して実行しています。そのため、有効なトークンを環境変数に設定せずにテストを行うと失敗します。

# Author
[Katsuya Yamaguchi](https://github.com/katsuya-yamaguchi)
