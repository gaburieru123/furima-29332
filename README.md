# テーブル設計

## usersテーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| first_name_kana       | string | null: false |
| last_name_kana        | string | null: false |
| name_kana             | string | null: false |
| birthday              | date   | null: false |

### Association
-has_many :items
-has_many :card


## itemsテーブル

| Column                | Type    | Options                         |
| --------------------- | ------  | ------------------------------- |
| name                  | string  | null: false                     |
| explanation           | text    | null: false                     |
| details_category      | string  | null: false                     |
| details_status        | integer | null: false                     |
| delivery_price        | integer | null: false                     |
| delivery_area         | integer | null: false                     |
| delivery_days         | integer | null: false                     |
| price                 | integer | null: false                     |
| user_id               | integer | null: false, foreign_key: true  |

### Association
-belongs_to :user


## customersテーブル

| Column                | Type    | Options                        |
| --------------------- | ------  | ------------------------------ |
| post_code             | integer | null: false                    |
| prefecture            | integer | null: false                    |
| city                  | string  | null: false                    |
| house_number          | integer | null: false                    |
| building_name         | string  |                                |
| phone_number          | integer | null: false                    |                    

### Association
-has_one :card


## cardsテーブル

| Column                | Type    | Options                        |
| --------------------- | ------  | ------------------------------ |
| user_id               | integer | null: false, foreign_key: true |
| item_id               | integer | null: false, foreign_key: true |


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
