# DB 設計

## users table (ユーザー情報)

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |
| profile            | text                | null: false               |
| occupation         | text                | null: false               |
| position           | text                | null: false               |

### Association

* has_many :items
* has_many :purchase_records

## items table （商品情報）

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| items_image        | string     | null: false                    |
| items_name         | string     | null: false                    |
| items_description  | text       | null: false                    |
| category_info      | string     | null: false                    |
| items_condition    | string     | null: false                    |

### Association

- belongs_to :user
- has_one :purchase_record

## purchase_records table (購入記録)

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses table (発送先情報)

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| purchase_record  | references | null: false, foreign_key: true |
| address          | string     | null: false                    |
| phone_number     | string     | null: false                    |

### Association

- belongs_to :purchase_record


