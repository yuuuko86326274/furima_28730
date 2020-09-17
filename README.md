# README

# テーブル設計

##  users テーブル

| Column           | Type       | Option                   |
| ---------------- | ---------- | ------------------------ |
| nickname         | string     | null: false              |
| email            | string     | null:false               |
| password         | string     | null: false              |
| first_name       | string     | null: false              |
| last_name        | string     | null: false              |
| first_name_pkey  | string     | null: false              |
| last_name_pkey   | string     | null: false              |
| birthday         | date       | null: false              |

### Association

- has_many :items
- has_many :purchase_items


##  addresses テーブル

| Column           | Type       | Option                                 |
| ---------------- | ---------- | -------------------------------------- |
| postal_code      | string     | null: false                            |
| prefectures_id   | integer    | null: false                            |
| city             | string     | null: false                            |
| adress_num       | string     | null: false                            |
| bilding_name     | string     |                                        |
| tel              | string     | null: false                            |
| purchase_item    | references | null: false, forein_key: true          |

### Association

- belongs_to :purchase_item
- belongs_to_active_hash :prefectures


##  items テーブル

| Column              | Type       | Option                                 |
| ------------------- | ---------- | -------------------------------------- |
| images              | string     | null: false                            |
| name                | string     | null: false                            |
| item_text           | text       | null: false                            |
| price               | integer    | null: false                            |
| user                | references | null: false, forein_key: true          |
| category_id         | integer    | null: false                            |
| item_status_id      | integer    | null: false                            |
| delivery_burden_id  | integer    | null: false                            |
| delivery_area_id    | integer    | null: false                            |
| delivery_days_id    | integer    | null: false                            |

### Association

- belongs_to :user
- has_one :purchase_item, dependent: destroy
- has_many_attached :images
- has_many :item_tag_relations
- has_many :tags, through: :item_tag_relations, dependent: :destroy
- belongs_to_active_hash :category
- belongs_to_active_hash :item_status
- belongs_to_active_hash :delivery_burden
- belongs_to_active_hash :delivery_area
- belongs_to_active_hash :delivery_days


##  tags テーブル

| Column           | Type       | Option                               |
| ---------------- | ---------- | ------------------------------------ |
| tag_name         | string     | uniqueness: true                     |

### Association

- has_many :item_tag_relations
- has_many :items, through: :item_tag_relations


##  item_tag_relations テーブル

| Column           | Type       | Option                               |
| ---------------- | ---------- | ------------------------------------ |
| item             | references | null: false, forein_key: true        |
| tag              | references | null: false, forein_key: true        |

### Association

- belongs_to :item
- belongs_to :tag


##  purchase_items テーブル

| Column           | Type       | Option                               |
| ---------------- | ---------- | ------------------------------------ |
| user             | references | null: false, forein_key: true        |
| item             | references | null: false, forein_key: true        |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address