# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true | 
| encrypted_password | string | null: false               | 
| nick_name          | string | null: false               |
| last_name          | string | null: false               | 
| first_name         | string | null: false               | 
| last_name_kana     | string | null: false               | 
| first_name_kana    | string | null: false               | 
| birthday           | date   | null: false               |


### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| name          | string     | null: false       |
| text          | text       | null: false       |
| category_id   | integer    | null: false       |
| condition_id  | integer    | null: false       |
| charge_id     | integer    | null: false       |
| prefecture_id | integer    | null: false       |
| delivery_id   | integer    | null: false       |
| price         | integer    | null: false       |
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
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postcode      | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| block         | string     | null: false       |
| building      | string     |                   |
| phone_number  | string     | null: false       |
| purchase      | references | foreign_key: true |

### Association
- belong_to :purchase