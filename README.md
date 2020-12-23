## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | unique: true            |
| encrypted_password | string              | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birthday           | date                | null: false             |


### Association

* has_many :items
* has_many :buys

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| explanation                         | text       | null: false       |
| category_id                         | integer    | null: false       |
| state_id                            | integer    | null: false       |
| shopping_cost_id                    | integer    | null: false       |
| prefecture_id                       | integer    | null: false       |
| shopping_days_id                    | integer    | null: false       |
| price                               | integer    | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys table

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| user              | references | foreign_key: true |
| item              | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address


## addresses table

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| postal_code       | string     | null: false       |
| prefecture_id     | integer    | null: false       |
| city              | string     | null: false       |
| lot_number        | string     | null: false       |
| building_number   | string     |                   |
| phone_number      | string     | null: false       |
| buy               | references | foreign_key: true |

### Association

- belongs_to :buy