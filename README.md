# README

# users

|Column|Type|Options|
|------|----|-------|
|email|str|null: false, unique: true|
|password|str|null: false, unique: true|
|phone|integer|null: false, unique: true|

### Association
- belongs_to :user_profile
- has_many :addresses
- has_many :items
- has_many :comments
- has_many :reviews


# user_profiles

|Column|Type|Options|
|------|----|-------|
|Nickname|str|null:false|
|Family_name|str|null:false|
|Last_name|str|null:false|
|family_name_kana|str|null:false|
|last_name_kana|str|null:false|
|birth_year|int|null:false|
|birth_month|int|null:false|
|birth_day|int|null:false|
|icon_image|text|null:true|
|introduction|text|null:true|
|user_id|ref|null: false,foregin_key: true|

### Association
- belongs_to :user


## addresses

|Column|Type|Options|
|------|----|-------|
|postal_code|int|null:false|
|region_id|ref|null:false,foregin_key:true|
|city|str|null:false|
|block_number|str|null:false|
|building|str|null:true|
|phone_for_shipping|str|null:true|
|user_id|ref|null:false,foregin_key: true|

### Association
- belongs_to :user
- belongs_to :region

# region
|Column|Type|Options|
|------|----|-------|
|name|str|null: false, unique: true|

### Association
- has_many :addresses


## reviews

|Column|Type|Options|
|------|----|-------|
|high|int|null: true|
|medium|int|null: true|
|low|int|null: true|
|comment|text|null: true|

### Association
- belongs_to :user

## item_images

|Column|Type|Options|
|------|----|-------|
|image|str|null: false|
|item_id|ref|null: false, foregin_key: true|

### Association
- belongs_to :item

## categories (gem 'ancestory'を使用)

|Column|Type|Options|
|------|----|-------|
|name|str|null: false|
|ancestroy|str||

### Association
- has_many :items

## brands
|Column|Type|Options|
|------|----|-------|
|name|str|null: false|

### Association
- has_many :items


