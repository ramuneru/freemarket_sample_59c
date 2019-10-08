class Api::CategoryController < ApplicationController
  
  def children
    parent = Category.find(params[:parent_id])
    @children = parent.children
  end

  def grandchildren
    children = Category.find(params[:parent_id]).children
    @grandchildren = children.children
  
  end
end
