# README

[![ER図](https://i.gyazo.com/493c7ec90ffa4dd093b3c480d0b6d478.png)](https://gyazo.com/493c7ec90ffa4dd093b3c480d0b6d478)

## users

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|phone|string|null: false, unique: true|

### Association
- has_one :user_profile
- has_one :address
- has_one :credit_card
- has_one :seller

- has_many :items
- has_many :comments
- has_many :buyers
- has_many :likes



## user_profiles

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|nickname|string|null:false|
|family_name|string|null:false|
|last_name|string|null:false|
|family_name_kana|string|null:false|
|last_name_kana|string|null:false|
|introduction|text||
|birth_day|string|null:false|
|icon_image|text||
|total_sales|integer||

### Association
- belongs_to :user


## addresses

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key: true|
|postal_code|string|null:false|
|region|integer|null:false|
|city|string|null:false|
|block|string|null:false|
|building|string||
|phone|string||


### Association
- belongs_to :user


## likes
|Column|Type|Options|
|------|----|-------|
|item_id|references|null:false, foreign_key:true|
|user_id|references|null:false, foreign_key:true|

### Association
- belongs_to :item
- belongs_to :user


## reviews

|Column|Type|Options|
|------|----|-------|
|high|integer||
|medium|integer||
|low|integer||
|comment|text||
|item_id|references|foreign_key: true|

### Association
- belongs_to :item


## credit_cards
|Column|Type|Options|
|------|----|-------|
|card_number|string|null:false|
|valid_month|integer|null:false|
|valid_year|integer|null:false|
|security_code|integer|null:false|
|user_id|integer|null: false, foreign_key:true|

### Association
- belongs_to :user

<!-- payjp導入時、テーブルの有無を再考 -->


## items
|Column|Type|Options|
|------|----|-------|
|title|string|null: false, index:true|
|description|text|null:false|
|price|integer|null:false|
|category_id|references|null:false, foreign_key:true|
|brand_id|references|foreign_key:true|
|status|integer|null:false, enum|
|size_id|references|foreign_key:true|
|region|integer|null:false|
|shipping_fee_burden|string|null:false|
|shipping_method|string|null:false|
|shipping_duration|string|null:false|
|sold_date|string||
|seller_id|references|null:false, foreign_key:true|
|buyer_id|references|foreign_key:true|
|like_id|references|foreign_key: true|
|comment_id|references|foreign_key:true|
|user_id|references|null:false, foreign_key: true|

- belongs_to :user
- belongs_to :category
- belongs_to :size

- has_one :brand
- has_one :seller
- has_one :buyer

- has_many :images
- has_many :likes
- has_many :comments
- has_many :trade_messages

- statusはenumで管理

## images

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item

## categories (gem 'ancestry'を使用)

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
|size_id|references|foreign_key: true|

### Association
- has_many :items
- has_ancestry


## sizes  (gem 'ancestry'を使用)

|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
|ancestry|string||

- has_many :categories
- has_ancestry


## brands
|Column|Type|Options|
|------|----|-------|
|brand|string|null: false|

### Association
- has_many :items


## comments
|Column|Type|Options|
|------|----|-------|
|comment|text||
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


## seller

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

- belongs_to :item
- belongs_to :user
- has_many :trade_messages

## buyer

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|item_id|references|null: false,foreign_key: true|

- belongs_to :item
- belongs_to :user
- has_many :trade_messages


## trade_messages
|Column|Type|Options|
|------|----|-------|
|message|text||
|item_id|references|null: false, foreign_key: true|
|seller_id|references|foreign_key: true|
|buyer_id|references|foreign_key: true|



### Association
- belongs_to :item
- belongs_to :seller
- belongs_to :buyer


