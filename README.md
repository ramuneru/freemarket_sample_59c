# README

[![Image from Gyazo](https://i.gyazo.com/d7711121b3c609fb92b6691308355b30.png)](https://gyazo.com/d7711121b3c609fb92b6691308355b30)

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
- has_many :reviews
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
- has_one :card


## addresses

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null:false|
|region_id|references|null:false,foreign_key:true|
|city|string|null:false|
|block_number|string|null:false|
|building|string||
|phone_for_shipping|string||
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

### Association
- belongs_to :user_profile


## credit_cards
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key:true|
|card_number|string|null:false|
|valid_month|integer|null:false|
|valid_year|integer|null:false|
|security_code|integer|null:false|

### Association
- belongs_to :user


## items
|Column|Type|Options|
|------|----|-------|
|title|string|null: false, index:true|
|description|text|null:false|
|image_id|references|null: false, foreign_key:true|
|price|integer|null:false|
|category_id|references|null:false, foreign_key:true|
|status|string|null:false|
|size_id|references|foreing_key:true|
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

## categories (gem 'ancestory'を使用)

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestory|string||

### Association
- has_many :items, through: category_sizes
- has_many :category_sizes

## category_sizes

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
|category_id|integer||

- has_many :items
- has_many :categories
- has_many :sizes, through: category_sizes


## brands
|Column|Type|Options|
|------|----|-------|
|brand|string|null: false|

### Association
- has_many :items

## seller

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|

- belongs_to :item

## buyer

|Column|Type|Options|
|------|----|-------|
|user_id|integer||

- belongs_to :item


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
|user_id|references|null: false|

### Association
- belongs_to :item_id
- belongs_to :buyer_id
- belongs_to :seller_id
