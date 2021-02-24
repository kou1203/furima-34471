# furimaER図

## usersテーブル
  
| Column                | Type           | Options                  |
|---------------------- | -------------- | ------------------------ |
| nickname              | string         | null: false              |
| email                 | string         | unique: true, null false |
| encrypted_password    | string         | null: false              |
| last_name             | string         | null: false              |
| first_name            | string         | null: false              |
| last_name_kana        | string         | null: false              |
| first_name_kana       | string         | null: false              |
| birthday              | date           | null: false              |

### Association
- has_many :product_histories
- has_many :products

## purchasesテーブル

| Column           | Type       | Option                          |
| ---------------- | ---------- | ------------------------------- |
| postal_code      | string     | null: false                     |
| prefecture_id   | integer    | null: false                     |
| municipalities   | string     | null: false                     |
| address          | string     | null: false                     |
| building_name    | string     | NONE                            |
| telephone_number | string     | null: false                     |
| product_history  | references | foreign_key: true, null: false  |

### Association
- belongs_to :product_history


## productsテーブル

| Column             | Type                | Option            |
| ------------------ | ------------------- | ----------------- |
| name               | string              | null: false       |
| description        | text                | null: false       |
| category_id        | integer             | null: false       |
| status_id          | integer             | null: false       |
| shipping_burden_id | integer             | null: false       |
| prefecture_id     | integer             | null: false       |
| days_to_ship_id    | integer             | null: false       |
| price              | integer             | null: false       |
| user               | references          | foreign_key: true |

### Association
- belongs_to :user
- has_one :product_history

## product_historiesテーブル

| Column              | Type       | Option                |
| ------------------- | ---------- | --------------------- |
| user                | references | foreign_key: true     |
| product             | references | foreign_key: true     |

### Association
belongs_to :user
has_one :purchase
belongs_to :product
