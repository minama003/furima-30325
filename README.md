# furima-30325

## 概要

フリマアプリのクローンサイトです。
商品の売り買いが簡単に出来るフリマアプリの機能を再現。
ユーザー登録、商品出品、商品購入などの機能を再現。（実際の取引は出来ません）

## URL

https://furima-30325.herokuapp.com/

ID:george
Pass:0731

## テスト用アカウント

購入者用アカウント
メールアドレス:dedededede@sample
パスワード:a111111
カード情報
番号：424242424242
期限：4/22
セキュリティーコード：123

出品者アカウント
メールアドレス:dedede@sample
パスワード:a111111


## 利用方法

出品者テストアカウントでログイン→トップページから出品ボタン→商品情報入力→商品出品
購入者テストアカウントでログイン→トップページから商品選択→商品購入

確認後ログアウト処理をお願い致します。

## 目指した課題解決

出品から購入作業までが簡単で、誰でも使いやすい。

## テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_reading | string | null: false |
| last_name_reading  | string | null: false |
| birthday           | date | null: false |

### Association
- has_many :items
- has_many :buys



## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name               | string | null: false |
| text               | text   | null: false |
| category_id        | integer | null: false |
| condition_id       | integer | null: false |
| delivery_charge_id | integer | null: false |
| prefecture_id      | integer | null: false  |
| delivery_day_id    | integer | null: false |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buy

## buys テーブル

| Column | Type       |Options                         |
| ------ | ---------- |------------------------------  |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_addesses

## shipping_addresses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| post_code     | string     | null: false  |
| prefecture_id | integer    | null: false  |
| city          | string     | null: false  |
| house_number  | string     | null: false  |
| building_name | string     |  |
| phone_number  | string     |  null: false  |
| buy           | references | null: false, foreign_key: true |

### Association

belongs_to :buy
