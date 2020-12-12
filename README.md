# README


## usersテーブル
|  Column    |  Type  |  Option    |
| ---------- | ------ | ---------- |
| first_name | string | null:false |
| last_name  | string | null:false |
| password   | string | null:false |
| email      | string | null:false |
| birthday   | string | null:false |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

|   Column   |  Type  |  Option    |
| ---------- | ------ | ---------- |
| name       | string | null:false |
| category   | string | null:false |
| status     | string | null:false |
| method     | string | null:false |
| area       | string | null:false |
| date       | string | null:false |

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
- has_many :users

# ordersテーブル

|   Column   |  Type     |  Option                       |
| ---------- | --------- | ----------------------------- |
| user       | reference | null:false ,foreign_key: true |

### Association
- belongs_to :item
- has_one :card
- has_one :address

# addressesテーブル

|   Column   |  Type  |  Option    |
| ---------- | ------ | ---------- |
| address    | string | null:false |
| prefecture | string | null:false |
| city       | string | null:false |
| street     | string | null:false |
| phone      | integer| null:false |

### Association
- belongs_to :order

# cardsテーブル

|   Column   |  Type  |  Option    |
| ---------- | ------ | ---------- |
| number     | integer| null:false |
| date       | string | null:false |
| code       | integer| null:false |

### Association
- belongs_to :order