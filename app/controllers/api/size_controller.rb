class Api::SizeController < ApplicationController
  
  def index
    
    category = Category.find(params[:grandchild_id])
    size = category.size
    # size = category.sizeはアソシエーションによるsizeの親要素(洋服のサイズ)を取得
    # 以下取得経路
    # size_id = category.size_id
    # size = Size.find(size_id)
    @size = size.children

    return @size
  end
end

require "category.rb"