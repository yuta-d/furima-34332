# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| password           | string | null: false |
| email              | string | null: false |
| first_name         | string | null: false |
| family_name        | string | null: false |
| first_name_kana    | string | null: false |
| family_name_kana   | string | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :items
- has_many :purchases
## items テーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| item_name      | string     | null: false                   |
| category       | string     | null: false                   |
| quality        | string     | null: false                   |
| delivery_cost  | string     | null: false                   |
| delivery_days  | string     | null: false                   |
| item_cost      | string     | null: false                   |
| user_id        | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :address
- has_one :item

## address テーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| postal_code    | string     | null: false                   |
| prefecture     | string     | null: false                   |
| city           | string     | null: false                   |
| number         | string     | null: false                   |
| telephone      | string     | null: false                   |

### Association
- has_one :purchase