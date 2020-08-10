# テーブル設計

## users テーブル

| Column  | Type   | Options     |
| ------  | ----   | -------     |
| name    | string | null: false |
| email   | string | null: false |
| pasword | string | null: false |

### Association
has_many :item
has_many :buy

 ## items テーブル
 
| Column                     | Type   | Options                          |
| -------------------------  | ----   | -------------------------------- |
| user_id                    | references | null: false foreign_key: true|
| item                       | string | null: false |
| image                      | string | null: false |
| fee                        | string | null: false |
| days                       | string | null: false |
| burden                     | string | null: false |
| shipping_origin : string   | string | null: false |
| category                   | string | null: false |
| status                     | string | null: false |

### Association
belongs_to :users
has_many :buy


## buy テーブル

| Column        | Type   | Options                              |
| ------        | ----   | -----------------------------------  |
| user_id       | references | null: false foreign_key: true |
| item_id       | references | null: false foreign_key: true |
| card_num      | string | null: false |
| card_limit    | string | null: false |
| card_security | string | null: false |
| address       | string | null: false |
| tel           | string | null: false |


### Association
belongs_to :users
belongs_to :item