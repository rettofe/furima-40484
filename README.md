# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options        |
| ------------------ | ---------- | -------------- |
| title              | string     | null: false    |
| description        | text       | null: false    |
| category_id        | integer    | null: false    |
| condition_id       | integer    | null: false    |
| delivery_charge_id | integer    | null: false    |
| shipping_source_id | integer    | null: false    |
| shipping_day_id    | integer    | null: false    |
| price              | integer    | null: false    |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order


## shippings テーブル

| Column             | Type       | Options      |
| ------------------ | ---------- | ------------------------------ |
| post_number        | string     | null: false  |
| order           | references | null: false, foreign_key: true |
| shipping_source_id | string     | null: false  |
| city               | string     | null: false  |
| street             | string     | null: false  |
| building           | string     |              |
| phone_number       | string     | null: false  |



### Association

- belongs_to :order

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |




### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping
