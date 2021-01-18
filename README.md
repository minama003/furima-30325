# テーブル設計

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
