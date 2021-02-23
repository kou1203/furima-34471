# FurimaER図

## USERテーブル
  
| Column                | Type           | Options      |
|---------------------- | -------------- | ------------ |
| nickname              | string         | NOT NULL     |
| mail                  | deviseにて実装 | unique: true |
| password              | deviseにて実装 | NOT NULL     |
| password_confirmation | deviseにて実装 | NOT NULL     |
| last_name             | string         | NOT NULL     |
| first_name            | string         | NOT NULL     |
| last_name_kana        | string         | NOT NULL     |
| first_name_kana       | string         | NOT NULL     |
| birthday              | date           | NOT NULL     |

### Association
- has_many :purchases
- has_one :product_history
- has_many :products

## PURCHASEテーブル

| Column           | Type       | Option   |
| ---------------- | ---------- | -------- |
| postal_code      | string     | NOT NULL |
| prefectures_id   | integer    | NOT NULL |
| municipalities   | string     | NOT NULL |
| address          | string     | NOT NULL |
| building_name    | string     | NONE     |
| telephone_number | string     | NOT NULL |
| user             | references | NONE     |

### Association
- belongs_to :user
- belongs_to :product
- has_one :purchase_history


## PRODUCTテーブル

| Column          | Type                | Option            |
| --------------- | ------------------- | ----------------- |
| name            | string              | NOT NULL          |
| description     | text                | NOT NULL          |
| price           | integer             | NOT NULL          |
| user            | references          | foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user

## PRODUCT_HISTORYテーブル

| Column              | Type       | Option                |
| ------------------- | ---------- | --------------------- |
| user                | references | foreign_key: true     |
| product             | references | foreign_key: true     |

### Association
belongs_to :user
belongs_to :product