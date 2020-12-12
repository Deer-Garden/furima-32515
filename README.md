# README


## usersテーブル
|  Column              |  Type  |  Option                 |
| -------------------- | ------ | ----------------------- |
| nickname             | string | null:false              |
| first_name           | string | null:false              |
| last_name            | string | null:false              |
| fname                | string | null:false              |
| lname                | string | null:false              |
| encrypted_password   | string | null:false              |
| email                | string | null:false ,unique: true|
| birthday             | date   | null:false              |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

|   Column      |  Type     |  Option                      |
| ------------- | --------- | ---------------------------- |
| name          | string    | null:false                   |
| price         | integer   | null:false                   |
| explanation   | text      | null:false                   |
| category_id   | integer   | null:false                   |
| status_id     | integer   | null:false                   |
| method_id     | integer   | null:false                   |
| area_id       | integer   | null:false                   | 
| date_id       | integer   | null:false                   |
| user          | reference | null:false, foreign_key:true |

### Association
- has_many :comments
- has_one :order
- belongs_to :user

# commentsテーブル

|   Column   |  Type     |  Option                     |
| ---------- | --------- | --------------------------- |
| text       | string    | null:false                  |
| user       | reference | null:false ,foreign_key:true|
| item       | reference | null:false ,foreign_key:true|

### Association
- belongs_to :item
- belongs_to :user

# ordersテーブル

|   Column   |  Type     |  Option                       |
| ---------- | --------- | ----------------------------- |
| user       | reference | null:false ,foreign_key: true |
| item       | reference | null:false ,foreign_key: true |

### Association
- belongs_to :user
- has_one :address
- belongs_to :item

# addressesテーブル

|   Column      |  Type     |  Option                      |
| ------------- | --------- | ---------------------------- |
| address       | string    | null:false                   |
| prefecture_id | integer   | null:false                   |
| city          | string    | null:false                   |
| street        | string    | null:false                   |
| phone         | string    | null:false                   |
| build         | integer   |                              |
| order         | reference | null:false, foreign_key:true |

### Association
- belongs_to :order