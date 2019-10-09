#CSVでSeedをつくる
#Sizeもカテゴリー同様にCSV作成
#カテゴリーテーブルにSize_Idという外部キーを紐づけておく
require 'csv'

# category_table
# CSV.foreach('db/category.csv',headers: true) do |row|
#   Category.create(name: row['name'],
#                   ancestry: row['ancestry'],
#                   size_id: row['size_id'])
# end

# size_table
# CSV.foreach('db/size.csv', headers: true) do |row|
#   Size.create(size: row['size'],
#               ancestry: row['ancestry'])
# end

# brand_table ladies
# CSV.foreach('db/ladies_brand.csv', headers: true) do |row|
#   Brand.create(name: row['name'])
# end

# brand_table mens
# CSV.foreach('db/mens_brand.csv', headers: true) do |row|
#   Brand.create(name: row['name'])
# end

# brand_table baby
# CSV.foreach('db/baby_brand.csv', headers: true) do |row|
#   Brand.create(name: row['name'])
# end

# brand_table interior
# CSV.foreach('db/interior_brand.csv', headers: true) do |row|
#   Brand.create(name: row['name'])
# end

# 実行コマンド
# bundle exec rake db:seed