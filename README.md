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

# テーブル設計

##  users テーブル

| Column         | Type       | Option          |
| -------------- | ---------- | --------------- |
| nickname       | string     | null: false     |
| mail           | string     | null: false     |
| password       | string     | null: false     |
| personal_files | references | null: false     |
| items          | references | null: false     |
### Association


- has_one :personal_file
- has_many :items 



##  personal_files テーブル

| Column           | Type       | Option          |
| ---------------- | ---------- | --------------- |
| first_name       | string     | null: false     |
| last_name        | string     | null: false     |
| first_name_pkey  | string     | null: false     |
| last_name_pkey   | string     | null: false     |
| birthday         | string     | null: false     |
| user             | references | null: false     |
| address          | references | null: false     |

### Association

- belongs_to :user
- has_one :address
- belongs_to_ active_hash :year
- belongs_to_ active_hash :month
- belongs_to_ active_hash :day


##  addresses テーブル

| Column           | Type       | Option          |
| ---------------- | ---------- | --------------- |
| postal_code      | string     | null: false     |
| prefectures      | string     | null: false     |
| city             | string     | null: false     |
| adress_num       | string     | null: false     |
| bilding_name     | string     |                 |
| tel              | string     | null: false     |
| personal_file    | references | null: false     |
| item             | references | null: false     |

### Association

- belongs_to :personal_file
- belongs_to :item
- belongs_to_active_hash :prefectures


##  items テーブル

| Column           | Type       | Option          |
| ---------------- | ---------- | --------------- |
| image            | string     | null: false     |
| item             | string     | null: false     |
| item_text        | text       | null: false     |
| price            | string     | null: false     |
| user             | references | null: false     |
| address          | references | null: false     |


### Association

- belongs_to :user
- has_one :address
- belongs_to_active_hash :category
- belongs_to_active_hash :item_status
- belongs_to_active_hash :delivery_burden
- belongs_to_active_hash :area
- belongs_to_active_hash :delivery_days