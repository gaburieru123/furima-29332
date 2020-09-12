# テーブル設計

## usersテーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| name                  | string | null: false |
| birthday              | string | null: false |

### Association
-has_many :items
-has_one :customer
-has_one :card


## itemsテーブル

| Column                | Type    | Options                         |
| --------------------- | ------  | ------------------------------- |
| image                 | string  | null: false                     |
| name                  | string  | null: false                     |
| explanation           | text    | null: false                     |
| details_category      | string  | null: false                     |
| details_status        | string  | null: false                     |
| delivery_price        | string  | null: false                     |
| delivery_area         | string  | null: false                     |
| delivery_days         | integer | null: false                     |
| price                 | string  | null: false                     |
| user_id               | integer | null: false, foreign_key: true |
| customer_id           | integer | null: false, foreign_key: true |

### Association
-belongs_to :user
-belongs_to :customer


## customersテーブル

| Column                | Type    | Options                        |
| --------------------- | ------  | ------------------------------ |
| post_code             | integer | null: false                    |
| prefecture            | string  | null: false                    |
| city                  | string  | null: false                    |
| house_number          | integer | null: false                    |
| building_name         | string  |                                |
| phone_number          | integer | null: false                    |                    
| user_id               | integer | null: false, foreign_key: true |

### Association
-belongs_to :user
-has_many :items
-has_one :card


## cardsテーブル

| Column                | Type    | Options                        |
| --------------------- | ------  | ------------------------------ |
| user_id               | integer | null: false, foreign_key: true |
| customer_id           | integer | null: false, foreign_key: true |
| card_id               | integer | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :customer










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
