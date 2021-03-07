#テーブル設計
## usersテーブル　

| Column             | Type    | Options                    |
| ------------------ | ------- | -------------------------- |
| nickname           | string  | null: false                |
| email              | string  | null: false, nuquie: true  |
| encrypted_password | string  | null: false                |
| family_name        | string  | null: false                |
| first_name         | string  | null: false                |
| family_name_kana   | string  | null: false                |
| first_name_kana    | string  | null: false                |
| birthday           | date    | null: false                |

### Association
has_many :items
has_many :buyers

## itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| category_id | integer    | null: false                    |
| state_id    | integer    | null: false                    |
| province_id | integer    | null: false                    |
| souryou_id  | integer    | null: false                    |
| day_id      | integer    | null: false                    |
| price       | integer    | null: false                    |
| comment     | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :buyer
has_one_attached :image

## buyersテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association
belongs_to :item
belongs_to :user
has_one :address

## addressテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | string     | null: false                    |
| province_id | integer    | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     |                                |
| telephone   | string     | null: false                    |
| buyer       | references | null: false, foreign_key: true |

### Association
belongs_to :buyer