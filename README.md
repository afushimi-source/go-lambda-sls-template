# go-lambda-sls

## 概要
goで作ったAWS lambdaをserverless frameworkでデプロイする勉強のために作成した。
`serverless create -t aws-go-mod -p <destination>`でテンプレを作成し、sls offlineを追加するなど一部変更を行った。

## 機能
| # | 機能名 | 説明 |
| - | - | - |
| 1 | hello | textを出力 |
| 2 | world | textを出力 |

## 要件
|#|言語|バージョン|
|-|-|-|
|1|go|1.19|
|2|npm|8.19.2|

## ローカル環境構築
- serverlessのinstall(install済みならスキップ)
  - `npm install -g serverless`
- serverless offlineなどをinstall
  - `npm i`
- goの実行バイナリを生成
  - `make`
- sls offlineでローカルにサーバーを立ち上げる
  - `make start`
- ローカルサーバーにアクセス
  - `curl localhost:3000`
  - `{"message":"Go Serverless v1.0! Your function executed successfully!"}`
  - と表示されれば問題ない。
  - ※ 自分の環境の場合、正常に実行できるようになるまで少し時間がかかり、最初の実行時に`timeout error`が発生したが、暫く待つとアクセスできる。

## デプロイ
`make deploy`
※ aws credentialsを設定すること
※ region: ap-northeast-1

## 削除
`make destroy`