# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| password           | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :shouhins
- has_many :hassousaki

## shouhins テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| shouhin_setumei    | text       | null: false                    |
| category           | string     | null: false                    |
| shouhin_joutai     | string     | null: false                    |
| haisouryou         | string     | null: false                    |
| hassou_moto        | string     | null: false                    |
| hassou_nissuu      | string     | null: false                    |
| hanbaikakaku       | integra    | null: false                    |
| user_id            | reference  | null: false, foreign_key: true |
| image              | string     | null: false                    |


### Association

- belongs_to :user
- has_one :hassousaki


## hassousakis テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| yuubin             | integra    | null: false                    |
| shouhin_id         | references | null: false, foreign_key: true |
| user_id            | references | null: false, foreign_key: true |
| todoufuken         | string     | null: false                    |
| sikutyouson        | string     | null: false                    |
| bancht             | string     | null: false                    |
| tatemono           | string     | null: false                    |
| denwa              | string     | null: false                    |



### Association

- belongs_to :user
- belongs_to :shouhin
- has_one    :kounyuu

## kounyuus テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| kounyuubi          | integra    | null: false                    |
| user_id            | references | null: false, foreign_key: true |




### Association

- belongs_to :user
- belongs_to :hassousaki