class Api::SizeController < ApplicationController
  
  def index
    
    category = Category.find(params[:grandchild_id])
    size = category.size
    # size = category.sizeはアソシエーションによるsizeの親要素(洋服のサイズ)を取得
    # カテゴリーが持つ、size_idを取得
    # size_id = category.size_id
    # そのidでSizeモデルのidに該当する親レコードを取得
    # size = Size.find(size_id)
    # .childrenメソッド(ancestryのヘルパーメソッド)で親idの持つ、子要素を全て取得
    @size = size.children
    return @size
  end
end

require "category.rb"