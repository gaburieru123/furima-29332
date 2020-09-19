# テーブル設計

## usersテーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false | deviseで設定されているため記入不要
| password              | string | null: false | deviseで設定されているため記入不要
| password_confirmation | string | null: false | deviseで設定されているため記入不要
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| first_name_kana       | string | null: false |
| last_name_kana        | string | null: false |
| birthday              | date   | null: false |

### Association
-has_many :items
-has_many :item_purchases


## itemsテーブル

| Column                | Type    | Options                         |
| --------------------- | ------  | ------------------------------- |
| name                  | string  | null: false                     |
| explanation           | text    | null: false                     |
| category_id           | integer | null: false                     |
| detail_status_id      | integer | null: false                     |
| delivery_price_id     | integer | null: false                     |
| delivery_area_id      | integer | null: false                     |
| delivery_day_id       | integer | null: false                     |
| price                 | integer | null: false                     |
| user_id               | integer | null: false, foreign_key: true  |

### Association
-belongs_to :user
-has_one :item_purchase




## customersテーブル

| Column                | Type    | Options                        |
| --------------------- | ------  | ------------------------------ |
| post_code             | string  | null: false                    |
| prefecture            | integer | null: false                    |
| city                  | string  | null: false                    |
| house_number          | string  | null: false                    |
| building_name         | string  |                                |
| phone_number          | string  | null: false,                   |                    
| item_purchase_id      | integer | null: false, foreign_key: true |                    

### Association
-belongs_to :item_purchase


## item_purchasesテーブル

| Column                | Type    | Options                        |
| --------------------- | ------  | ------------------------------ |
| user_id               | integer | null: false, foreign_key: true |
| item_id               | integer | null: false, foreign_key: true |


### Association

-belongs_to :user
-belongs_to :item
-has_one :customer










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
