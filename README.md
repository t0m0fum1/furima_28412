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
| burden                     | integer | null: false |
| fee                        | integer | null: false |
| days                       | integer | null: false |
| shipping_origin            | integer | null: false |
| category                   | integer | null: false |
| status                     | integer | null: false |
| explain                    | text    | null: false |

### Association
belongs_to :user
has_one :buy


## buys テーブル

| Column        | Type   | Options                              |
| ------        | ----   | -----------------------------------  |
| user          | references | null: false foreign_key: true |
| item          | references | null: false foreign_key: true |


### Association
belongs_to :user
belongs_to :item
has_one :shipping_address


## shipping_addresses テーブル
| Column        | Type   | Options                           |
| --------------| ----   | -------------------------------   |
| buy           | references | null: false foreign_key: true |
| prefecture    | integer | null: false |
| postal_code   | string  | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| tel           | string  | null: false |

### Association
belongs_to :buy