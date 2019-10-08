class Api::SizeController < ApplicationController
  
  def index
    category = Category.find(params[:grandchild_id])
    size_id = category.size_id
    size = Size.find(size_id)
    @size = size.children

    return @size
  end
end

require "category.rb"