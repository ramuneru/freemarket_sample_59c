class Api::SizeController < ApplicationController
  
  def index
    category = Category.find(params[:parent_id])
    @children = parent.children

    size_id = category.size_id
    size = Size.find()
    
      @size = size.children

      return @size
  end
end

require "category.rb"