# テーブル設計

## usersテーブル

| Column          | Type   | Options  |
| --------------- | ------ | -------- |
| email           | string | NOT NULL | 
| password        | string | NOT NULL | 
| nick_name       | string | NOT NULL |
| last_name       | string | NOT NULL | 
| first_name      | string | NOT NULL | 
| last_name_kana  | string | NOT NULL | 
| first_name_kana | string | NOT NULL | 
| birth_year      | date   | NOT NULL |
| birth_month     | date   | NOT NULL |
| birth_day       | date   | NOT NULL |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| name          | string     | NOT NULL          |
| text          | text       | NOT NULL          |
| category_id   | integer    | NOT NULL          |
| condition_id  | integer    | NOT NULL          |
| charges_id    | integer    | NOT NULL          |
| prefecture_id | integer    | NOT NULL          |
| delivery_id   | integer    | NOT NULL          |
| price         | integer    | NOT NULL          |
| image         |            |                   |
| user          | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association
- belongs_to :item
- has_ome :address

## addressesテーブル

| Column        | Type    | Options  |
| ------------- | ------- | -------- |
| postcode      | string  | NOT NULL |
| prefecture_id | integer | NOT NULL |
| city          | string  | NOT NULL |
| block         | string  | NOT NULL |
| building      | string  | NOT NULL |
| phone_number  | integer | NOT NULL |

### Association
- belong_to :purchase