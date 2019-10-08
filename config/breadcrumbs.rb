crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", users_path
end

crumb :product do
  link "出品した商品 - 出品中", product_users_path
  parent :mypage
end

crumb :progress do
  link "出品した商品 - 取引中", progress_users_path
  parent :mypage
end

crumb :completed do
  link "出品した商品 - 売却済み", completed_users_path
  parent :mypage
end

