# README

[![ER図](https://i.gyazo.com/98156e48ba6dd19d256c10b995789c44.png)](https://gyazo.com/98156e48ba6dd19d256c10b995789c44)

## users

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|phone|string|null: false, unique: true|

### Association
- has_one :user_profile, dependent: :destroy
- has_one :address, dependent: :destroy
- has_one :credit_card, dependent: :destroy

- has_many :items
- has_many :comments
- has_many :trade_messages
- has_many :trade_conditions

- has_many :likes
- has_many :sns_credentials, dependent: :destroy



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
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|integer|null:false|
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
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item

## credit_cards
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key:true|
|customer_id|string|null:false, unique: true, (payjpのカスタマーID)|
|card_id|string|null:false, unique: true, (payjpのカード番号に紐づくID)|

### Association
- belongs_to :user


## sns_credentials
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|uid|string|null: false, unique: true|
|provider|string|null: false|

### Association
- belongs_to :user, optional: true



## items
|Column|Type|Options|
|------|----|-------|
|title|string|null: false, unique: true, index:true|
|description|text|null:false|
|price|integer|null:false|
|category_id|references|null:false, foreign_key:true|
|brand_id|references|foreign_key:true|
|condition|integer|null:false, active_hashで管理|
|region|integer|null:false|
|shipping_fee_burden|integer|null:false|
|shipping_method|integer|null:false|
|shipping_duration|integer|null:false|
|user_id|references|null:false, foreign_key: true|
|size_id|references|foreign_key: true|


- belongs_to :user
- belongs_to :category
- belongs_to :size

- has_one :brand, dependent: :destroy
- has_one :trade_condition

- has_many :images, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :trade_messages, dependent: :destroy
- has_many :reviews


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
- belongs_to :size
- has_ancestry


## sizes  (gem 'ancestry'を使用)

|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
|ancestry|string||

- has_many :categories
- has_many :items
- has_ancestry


## brands
|Column|Type|Options|
|------|----|-------|
|brand|string||

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



## trade_messages
|Column|Type|Options|
|------|----|-------|
|message|text||
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|(buyerのid)


### Association
- belongs_to :item
- belongs_to :user


