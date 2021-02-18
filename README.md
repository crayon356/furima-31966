#テーブル設計
## usersテーブル　

| Column     | Type    | Options      |
| ---------- | ------- | ------------ |
| nickname   | string  | null: false  |
| email      | string  | null: false  |
| password   | string  | null: false  |
| name       | string  | null: false  |
| birthday   | intger  | null: false  |

### Association
has_many :items
has_one :buyers

## itemsテーブル

| Column     | Type    | Options      |
| ---------- | ------- | ------------ |
| syouhin    | string  | null: false  |
| category   | string  | null: false  |
| price      | intger  | null: false  |
| text       | text    |              |
| seller     | string  | null: false  |

### Association
belongs_to :users
belong_to :buyers
has_one_attached :image


## buyersテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| adress     | string     | null: false                    |
| comment    | text       |                                |
| user       | references | null: false, foreign_key: true |

### Association
has_many :items
belong_to :users