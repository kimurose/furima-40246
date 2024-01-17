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
| Column             | Type       | Options                    |
| ------------------ | ---------- | -------------------------- |
| email              | string     | null: false, unique: true  |
| encrypted_password | string     | null: false                |
| nickname           | string     | null: false                |ユーザー名
| name_full-width    | string     | null: false                |お名前（全角）
| name_pronunciation | string     | null: false                |お名前（カナ）
| date_of_birth      | text       | null: false                |生年月日


### Association
- has_many :item
- has_many :purchases

##　itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| image              | text       | null: false                    |
| explanation        | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :purchases

##　purchasesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | string     | null: false                    |
| place              | string     | null: false                    |
| item               | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- has_one :users
- has_one :prototypes