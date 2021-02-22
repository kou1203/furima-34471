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
- has_many :product_histories
- has_many :product, through: :product_histories

## PURCHASEテーブル

| Column           | Typ        | Option   |
| ---------------- | ---------- | -------- |
| postal_code      | string     | NOT NULL |
| prefectures_id   | integer    | NOT NULL |
| municipalities   | string     | NOT NULL |
| address          | integer    | NOT NULL |
| building_name    | integer    | NONE     |
| telephone_number | string     | NOT NULL |
| user             | references | NONE     |
| product          | references | NONE     |

### Association
- belongs_to :user
- belongs_to :product


## PRODUCTテーブル

| Column          | Type                | Option   |
| --------------- | ------------------- | -------- |
| image           | ActiveStorageで実装 | NOT NULL |
| name            | string              | NOT NULL |
| description     | text                | NOT NULL |
| category        | string              | NOT NULL |
| status          | string              | NOT NULL | 
| shipping_burden | string              | NOT NULL |
| shipping_area   | string              | NOT NULL |
| days_to_ship    | string              | NOT NULL |
| price           | integer             | NOT NULL |
| user            | references          | NONE     |

### Association
- has_one :purchase
- has_many :product_histories
- has_many :users, through: :product_histories

## PRODUCT_HISTORYテーブル

| Column           | Type       | Option       |
| ---------------- | ---------- | ------------ |
| user             | references | NOT NULL     |
| product          | references | NOT NULL     |

### Association
belongs_to :user
belongs_to :product