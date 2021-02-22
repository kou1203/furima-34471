# FurimaER図

## USERテーブル
  
| Column                | Type    | Options  |
|---------------------- | ------- | -------- |
| nickname              | string  | NOT NULL |
| mail                  | string  | NOT NULL |
| password              | string  | NOT NULL |
| password_confirmation | string  | NOT NULL |
| last_name             | string  | NOT NULL |
| first_name            | string  | NOT NULL |
| birthday              | integer | NOT NULL |

### Association
- has_many :purchase
- has_many :product

## PURCHASEテーブル

| Column           | Typ        | Option   |
| ---------------- | ---------- | -------- |
| credit           | integer    | NOT NULL |
| expiration_date  | integer    | NOT NULL |
| security_code    | integer    | NOT NULL |
| postal_code      | integer    | NOT NULL |
| prefectures      | string     | NOT NULL |
| municipalities   | string     | NOT NULL |
| address          | integer    | NOT NULL |
| building_name    | integer    | NONE     |
| telephone_number | integer    | NOT NULL |
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

## Association
- belongs_to :user
- has_one :purchase