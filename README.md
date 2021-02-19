#テーブル設計
## usersテーブル　

| Column            | Type    | Options      |
| ----------------- | ------- | ------------ |
| nickname          | string  | null: false  |
| email             | string  | null: false  |
| password          | string  | null: false  |
| family name       | string  | null: false  |
| first name        | string  | null: false  |
| family name(kana) | string  | null: false  |
| first name(kana)  | string  | null: false  |
| birthday          | date    | null: false  |

### Association
has_many :items
has_many :buyers

## itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| category_id | integer    | null: false                    |
| price       | integer    | null: false                    |
| text        | text       |                                |
| user_id     | references | null: false, foreign_key: true |
| state       | string     |                                |
| souryou     | string     |                                |

### Association
belongs_to :user
has_one :buyers
has_one_attached :image

## buyersテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_id    | references | null: false, foreign_key: true |
| user_id    | references | null: false, foreign_key: true |

### Association
belong_to :item
belong_to :user
has_one :adress

## adressテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal code | string     |                                |
| adress      | string     |                                |
| user_id     | references | null: false, foreign_key: true |

### Association
belong_to :buyers