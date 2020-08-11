# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| ------    | ----   | -------     |
| name      | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| firstname | string | null: false |
| lastname  | string | null: false |
| birthday  | string | null: false |


### Association
has_many :items
has_many :buys
has_one :shipping_address


 ## items テーブル
 
| Column                     | Type   | Options                          |
| -------------------------  | ----   | -------------------------------- |
| user                       | references | null: false foreign_key: true|
| item_name                  | string  | null: false |
| image                      | string  | null: false |
| fee                        | string  | null: false |
| days                       | string  | null: false |
| burden                     | integer | null: false |
| shipping_origin : string   | integer | null: false |
| category                   | integer | null: false |
| status                     | integer | null: false |

### Association
belongs_to :user
has_one :buy


## buy テーブル

| Column        | Type   | Options                              |
| ------        | ----   | -----------------------------------  |
| user          | references | null: false foreign_key: true |


### Association
belongs_to :user
belongs_to :item
belongs_to :shipping_address


## shipping_address テーブル
| Column        | Type   | Options                           |
| user          | references | null: false foreign_key: true |
| address       | string | null: false |
| tel           | string | null: false |

### Association
belongs_to :user
belongs_to :shipping_address