# DB 設計

## users table (ユーザー情報)

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_date         | date                | null: false               |

### Association

* has_many :items
* has_many :purchase_records

## items table （商品情報）

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| items_name          | string     | null: false                    |
| items_description   | text       | null: false                    |
| category_info       | integer    | null: false                    |
| items_condition     | integer    | null: false                    |
| shipping_fee_burden | integer    | null: false                    |
| shipping_area       | integer    | null: false                    |
| shipping_days       | integer    | null: false                    |
| price               | string    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## purchase_records table (購入記録)

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses table (配送先情報)

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| postal_code      | string     | null: false                    |
| prefecture       | integer    | null: false                    |
| city             | string     | null: false                    |
| street_number    | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_record  | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record


