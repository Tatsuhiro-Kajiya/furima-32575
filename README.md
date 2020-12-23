## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| last-name          | string              | null: false             |
| first-name         | string              | null: false             |
| last-name-kana     | string              | null: false             |
| first-name-kana    | string              | null: false             |
| birthday           | string              | null: false             |


### Association

* has_many :items
* has_many :buys

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| product-name                        | string     | null: false       |
| explanation                         | text       | null: false       |
| category                            | string     | null: false       |
| state                               | string     | null: false       |
| shopping-cost                       | string     | null: false       |
| area                                | string     | null: false       |
| shopping-days                       | string     | null: false       |
| price                               | string     | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys table

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| card              | string     | null: false       |
| expiration-date   | string     | null: false       |
| security-code     | string     | null: false       |
| postal-code       | string     | null: false       |
| prefecture        | string     | null: false       |
| city              | string     | null: false       |
| lot-number        | string     | null: false       |
| building-number   | string     | null: false       |
| phone-number      | string     | null: false       |
| item              | references | foreign_key: true |
| user              | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user