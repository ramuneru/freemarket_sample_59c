# README

[![ER図](https://i.gyazo.com/66d53d685aa12c67e283ce3aac432514.png)](https://gyazo.com/66d53d685aa12c67e283ce3aac432514)

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
<!-- sellerは要検討 -->
- has_one :seller

- has_many :items
- has_many :comments
<!-- buyersは要検討 -->
- has_many :buyers
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
|card_number|string|null:false, unique: true|
|valid_month|integer|null:false|
|valid_year|integer|null:false|
|security_code|integer|null:false|
|user_id|integer|null: false, foreign_key:true|

### Association
- belongs_to :user

<!-- payjp導入時、テーブルの有無を再考 -->

## sns_credentialsテーブル
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
|condition|integer|null:false, enum|
|size_id|references|foreign_key:true|
|region|integer|null:false|
|shipping_fee_burden|integer|null:false|
|shipping_method|integer|null:false|
|shipping_duration|integer|null:false|
|sold_date|string||
|seller_id|references|null:false, foreign_key:true|
|buyer_id|references|foreign_key:true|
|like_id|references|foreign_key: true|
|comment_id|references|foreign_key:true|
|user_id|references|null:false, foreign_key: true|

- belongs_to :user
- belongs_to :category, dependent: :destroy

- has_one :brand, dependent: :destroy
- has_one :seller
- has_one :buyer

- has_many :images, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :trade_messages, dependent: :destroy

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
|path|string|| (gem"ancestry"による自動挿入)
|size_id|references|foreign_key: true|

### Association
- has_many :items
- has_ancestry


## sizes  (gem 'ancestry'を使用)

|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
|path|string|| (ancestryによる自動挿入)

- has_many :categories
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


## seller(残存or削除検討中)

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

- belongs_to :item
- belongs_to :user
- has_many :trade_messages

## buyer(残存or削除検討中)

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|item_id|references|null: false,foreign_key: true|

- belongs_to :item
- belongs_to :user
- has_many :trade_messages


## trade_messages(buyer&sellerテーブル次第で内容変更予定)
|Column|Type|Options|
|------|----|-------|
|message|text||
|item_id|references|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|


### Association
- belongs_to :item
- belongs_to :seller
- belongs_to :buyer


