class Api::CategoryController < ApplicationController
  
  def children
    parent = Category.find(params[:parent_id])
    @children = parent.children
  end
end
