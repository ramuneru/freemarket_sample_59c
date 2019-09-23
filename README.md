# README

[![Image from Gyazo](https://i.gyazo.com/48de2bc77080a1d65dd7893710a1627a.png)](https://gyazo.com/48de2bc77080a1d65dd7893710a1627a)

## users

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|phone|string|null: false, unique: true|

### Association
- has_one :user_profile

- has_many :items
- has_many :comments



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
- has_one :credit_card


## addresses

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null:false|
|region_id|references|null:false,foreign_key:true|
|city|string|null:false|
|block_number|string|null:false|
|building|string||
|phone|string||
|user_profile_id|references|null:false,foreign_key: true|

### Association
- belongs_to :user_profile
- belongs_to :region

## region
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :addresses
- belongs_to :item

## likes
|Column|Type|Options|
|------|----|-------|
|likes|integer||
|item_id|references|null:false, foreign_key:true|

### Association
- belongs_to :item


## reviews

|Column|Type|Options|
|------|----|-------|
|high|integer||
|medium|integer||
|low|integer||
|comment|text||
|item_id|references||

### Association
- belongs_to :item


## credit_cards
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key:true|
|card_number|string|null:false|
|valid_month|integer|null:false|
|valid_year|integer|null:false|
|security_code|integer|null:false|

### Association
- belongs_to :user_profile


## items
|Column|Type|Options|
|------|----|-------|
|title|string|null: false, index:true|
|description|text|null:false|
|image_id|references|null: false, foreign_key:true|
|price|integer|null:false|
|category_id|references|null:false, foreign_key:true|
|status|string|null:false|
|size_id|references|foreign_key:true|
|region_id|references|null:false|
|shipping_fee_burden|string|null:false|
|shipping_method|string|null:false|
|shipping_duration|string|null:false|
|sold_date|string||
|seller_id|references|null:false, foreign_key:true|
|buyer_id|references|foreign_key:true|
|brand_id|references|foreign_key:true|
|like_id|references|foreign_key: true|
|comment_id|references|foreign_key:true|
|user_id|references|foreign_key: true|

- belongs_to :user
- belongs_to :category
- belongs_to :size
- belongs_to :region

- has_one :brand
- has_one :seller
- has_one :buyer

- has_many :images
- has_many :likes
- has_many :comments
- has_many :trade_messages


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
|categories_size_id|references||

### Association
- has_many :items, through: categories_size
- has_many :categories_size

## categories_size

|Column|Type|Options|
|------|----|-------|
|category_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|

### Association
- belongs_to :category
- belongs_to :size

## sizes

|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
|categories_size_id|references|null :false|

- has_many :items
- has_many :categories
- has_many :sizes, through: categories_size


## brands
|Column|Type|Options|
|------|----|-------|
|brand|string|null: false|

### Association
- has_many :items

## seller

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|item_id|references|null: false|

- belongs_to :item
- belongs_to :user

## buyer

|Column|Type|Options|
|------|----|-------|
|user_id|references||
|item_id|references|null: false|

- belongs_to :item
- belongs_to :user


## comments
|Column|Type|Options|
|------|----|-------|
|comment|text||
|item_id|references|null: false|
|user_id|references|null: false|

### Association
- has_many :items


## trade_messages
|Column|Type|Options|
|------|----|-------|
|message|text||
|item_id|references|null: false|


### Association
- belongs_to :item

