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

| Column           | Type       | Option                   |
| ---------------- | ---------- | ------------------------ |
| nickname         | string     | null: false              |
| mail             | string     | null: false              |
| password         | string     | null: false              |
| first_name       | string     | null: false              |
| last_name        | string     | null: false              |
| first_name_pkey  | string     | null: false              |
| last_name_pkey   | string     | null: false              |
| birth_year_id    | integer    | null: false              |
| birth_month_id   | integer    | null: false              |
| birth_day_id     | integer    | null: false              |
| adress           | references | null: false, forein_key: |
| purchace_items   | references | null: false, forein_key: |

### Association

- has_one :address
- has_many :purchace_items
- belongs_to_ active_hash :birth_year
- belongs_to_ active_hash :birth_month
- belongs_to_ active_hash :birth_day



##  addresses テーブル

| Column           | Type       | Option                                 |
| ---------------- | ---------- | -------------------------------------- |
| postal_code      | string     | null: false                            |
| prefectures_id   | integer    | null: false                            |
| city             | string     | null: false                            |
| adress_num       | string     | null: false                            |
| bilding_name     | string     |                                        |
| tel              | string     | null: false                            |
| user             | references | null: false, forein_key: true          |
| item             | references | null: false, forein_key: true          |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to_active_hash :prefectures


##  items テーブル

| Column              | Type       | Option                                 |
| ------------------- | ---------- | -------------------------------------- |
| image               | string     | null: false                            |
| item                | string     | null: false                            |
| item_text           | text       | null: false                            |
| price               | string     | null: false                            |
| sales_fee           | string     | null: false                            |
| sales_profit        | string     | null: false                            |
| purchase_item       | references | null: false, forein_key: true          |
| address             | references | null: false, forein_key: true          |
| category_id         | integer    | null: false                            |
| item_status_id      | integer    | null: false                            |
| delivery_burden_id  | integer    | null: false                            |
| delivery_area_id    | integer    | null: false                            |
| delivery_days_id    | integer    | null: false                            |

### Association

- belongs_to :purchase_item
- has_one :address
- belongs_to_active_hash :category
- belongs_to_active_hash :item_status
- belongs_to_active_hash :delivery_burden
- belongs_to_active_hash :delivery_area
- belongs_to_active_hash :delivery_days


##  purchase_items テーブル

| Column           | Type       | Option                               |
| ---------------- | ---------- | ------------------------------------ |
| user             | references | null: false, forein_key: true        |
| item             | references | null: false, forein_key: true        |

### Association

- belongs_to :user
- belongs_to :item