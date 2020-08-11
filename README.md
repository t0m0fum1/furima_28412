# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| ------    | ----   | -------     |
| name      | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| firstname | string | null: false |
| lastname  | string | null: false |
| firstname_furigana  | string | null: false |
| lastname_furigana   | string | null: false |
| birthday  | date    | null: false |


### Association
has_many :items
has_many :buys


 ## items テーブル
 
| Column                     | Type   | Options                          |
| -------------------------  | ----   | -------------------------------- |
| user                       | references | null: false foreign_key: true|
| name                       | string  | null: false |
| fee                       | string  | null: false |
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
| item          | references | null: false foreign_key: true |


### Association
belongs_to :user
belongs_to :item
belongs_to :shipping_address


## shipping_address テーブル
| Column        | Type   | Options                           |
| buy          | references | null: false foreign_key: true |
| postal_code   | string | null: false |
| city          | string | null: false |
| address       | string | null: false |
| building_name | string | null: false |
| tel           | string | null: false |

### Association
belongs_to :shipping_address