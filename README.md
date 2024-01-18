# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

##　usersテーブル
| Column                   | Type       | Options                    |
| ------------------------ | ---------- | -------------------------- |
| nickname                 | string     | null: false                |ユーザー名
| email                    | string     | null: false, unique: true  |
| encrypted_password       | string     | null: false                |
| last_name_full-width     | string     | null: false                |お名前（全角・性）
| first_name_full-width    | string     | null: false                |お名前（全角・名）
| last_name_pronunciation  | string     | null: false                |お名前（カナ・性）
| first_name_pronunciation | string     | null: false                |お名前（カナ・名）
| date                     | text       | null: false                |生年月日


### Association
- has_many :items
- has_many :purchases

##　itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | string     | null: references               |
| product_name       | string     | null: false                    |
| explanation        | text       | null: false                    |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchas

##　purchasesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| shipping_source    | string     | null: false                    |
| shipping_address   | string     | null: false                    |
| burden             | references | null: false                    |
| days               | references | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association
- has_one :user
- has_one :item

##　addressesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_information   | string     | null: false                    |
| expiry             | string     | null: false                    |
| security_code      | string     | null: false                    |
| post_code          | string     | null: false                    |
| prefectures        | text       | null: false                    |
| municipalities     | text       | null: false                    |
| street_address     | text       | null: false                    |
| building_name      | text       | null: true                     |
| phone_number       | text       | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
- has_one :user
- has_one :item