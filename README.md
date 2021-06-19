# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| email              | string | null: false, unique: true |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name_kana   | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_many :purchases
## items テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| item_name       | string     | null: false                   |
| category_id     | integer    | null: false                   |
| quality_id      | integer    | null: false                   |
| delivery_cost_id| integer    | null: false                   |
| delivery_day_id | integer    | null: false                   |
| item_cost_id    | integer    | null: false                   |
| user            | references | null: false, foreign_key: true|
| description     | text       | null: false                   |
| price           | integer    | null: false                   |

### Association
- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :address
- belongs_to :item

## addresses テーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| postal_code    | string     | null: false                   |
| prefecture_id  | integer    | null: false                   |
| city           | string     | null: false                   |
| number         | string     | null: false                   |
| build_name     | string     |                               |
| telephone      | string     | null: false                   |
| purchase       | references | null: false, foreign_key: true|


### Association
- belongs_to :purchase