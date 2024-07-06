class Admin::TagsController < ApplicationController
  
  def index
    @tag = Tag.new
    @tags = Tag.all
  end
  
  def create
    @tag = Tag.new(tag_params)
    tag_list = params[:tag][:tag_names]
      if @tag.save(tag_list)
        if tag_names.present?
          tags = tag_names.split("\n").map(&:strip).uniq
          create_or_update_post_tags(@tag, tags)
        end  
        redirect_to post_path(@tag), success: 'ポストを作成しました'
      else
        flash.now[:danger] = 'ポストを作成できませんでした'
        render :new
      end
  end
  
  def edit
    @tag = tag.find(params[:id])
  end
  
  def update
    @tag = tag.find(params[:id])
    tag_names = params[:tag][:tag_names]
    if @tag.update(tag_params)
      if tag_names.present?
        tags = params[:tag][:tag_names].split("\n").map(&:strip).uniq
        create_or_update_tags(@tag, tags)
      end
      redirect_to tag_path(@tag), success: 'ポストを更新しました'
    else
      flash.now[:danger] = 'ポストを更新できませんでした'
      render :edit
    end
  end
  
  private
  
  def tags_parmas
    parmas.require(:tag).permit(:name)
  end
  
  
end
