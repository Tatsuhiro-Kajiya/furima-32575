## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | unique: true            |
| encrypted_password | string              | null: false             |
| last-name          | string              | null: false             |
| first-name         | string              | null: false             |
| last-name-kana     | string              | null: false             |
| first-name-kana    | string              | null: false             |
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
| shopping-cost_id                    | integer    | null: false       |
| prefecture_id                       | integer    | null: false       |
| shopping-days_id                    | integer    | null: false       |
| price                               | string     | null: false       |
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
| postal-code       | string     | null: false       |
| prefecture_id     | integer    | null: false       |
| city              | string     | null: false       |
| lot-number        | string     | null: false       |
| building-number   | string     |                   |
| phone-number      | string     | null: false       |

### Association

- belongs_to :addresses