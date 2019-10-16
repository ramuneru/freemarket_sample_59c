class CategoryController < ApplicationController
  def index
    @categories = Category.where(ancestry: nil)
    # 未実装
    @parents = Category.all.order("id ASC").limit(13)
  end

  def show
    @category = Category.find(params[:id])
    @children = @category.children
  end
end