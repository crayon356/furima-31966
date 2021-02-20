#テーブル設計
## usersテーブル　

| Column             | Type    | Options                    |
| ------------------ | ------- | -------------------------- |
| nickname           | string  | null: false                |
| email              | string  | null: false, nuquie: true  |
| encrypted_password | string  | null: false                |
| family_name        | string  | null: false                |
| first_name         | string  | null: false                |
| family_name(kana)  | string  | null: false                |
| first_name(kana)   | string  | null: false                |
| birthday           | date    | null: false                |

### Association
has_many :items
has_many :buyers

## itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name_id     | integer    | null: false                    |
| category_id | integer    | null: false                    |
| state_id    | integer    |                                |
| souryou_id  | integer    |                                |
| day_id      | integer    | null: false                    |
| price       | integer    | null: false                    |
| comment     | text       |                                |
| user        | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :buyers
has_one_attached :image

## buyersテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association
belong_to :item
belong_to :user
has_one :adress

## adressテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | integer    | null: false                    |
| province    | string     | null: false                    |
| city        | string     | null: false                    |
| adress      | integer    | null: false                    |
| building    | string     |                                |
| telephone   | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
belong_to :buyers