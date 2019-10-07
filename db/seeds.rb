#CSVでSeedをつくる
#Sizeもカテゴリー同様にCSV作成
#カテゴリーテーブルにSize_Idという外部キーを紐づけておく
# require 'csv'

# CSV.foreach('db/category.csv',headers: true) do |row|
#   Category.create(name: row['name'],
#                   ancestry: row['ancestry'],
#                   size_id: row['size_id'])
# end

# CSV.foreach('db/size.csv', headers: true) do |row|
#   Size.create(size: row['size'],
#               ancestry: row['ancestry'])
# end

# bundle exec rake db:seed
# rails c SELECT * FROM Category;