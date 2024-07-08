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

- has_many :item
- has_many :shipping

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| shipping_source_id | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| price              | integer    | null: false
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :shipping


## shippings テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_number        | string     | null: false                    |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| street             | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |



### Association

- belongs_to :user
- belongs_to :item
- has_one    :purchase

## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| purchases_date     | integra    | null: false                    |
| user               | references | null: false, foreign_key: true |




### Association

- belongs_to :user
- belongs_to :shipping