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
| last_name                | string     | null: false                |お名前（全角・性）
| first_name               | string     | null: false                |お名前（全角・名）
| last_name_kana           | string     | null: false                |お名前（カナ・性）
| first_name_kana          | string     | null: false                |お名前（カナ・名）
| date                     | date       | null: false                |生年月日


### Association
- has_many :items
- has_many :purchases

##　itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_cost_id   | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

##　ordersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

##　addressesテーブル
| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| post_code          | string       | null: false                    |
| prefecture_id      | integer      | null: false                    |
| municipality       | string       | null: false                    |
| street_address     | string       | null: false                    |
| building_name      | string       |                                |
| phone_number       | string       | null: false                    |
| order              | references   | null: false, foreign_key: true |

### Association
- belongs_to :order