class Admin::TagsController < ApplicationController
  
  def index
    @tag = Tag.new
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  private
  
  def tags_parmas
    parmas.require(:tag).permit()
  end
  
  
end
