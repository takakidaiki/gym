class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
      if @tag.save
        redirect_to admin_tags_path, success: 'ポストを作成しました'
      else
        flash.now[:danger] = 'ポストを作成できませんでした'
        render :new
      end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    tag_names = params[:tag][:tag_names]
    if @tag.update(tag_params)
      if tag_names.present?
        tags = params[:tag][:tag_names].split("\n").map(&:strip).uniq
        create_or_update_tags(@tag, tags)
      end
      redirect_to admin_tags_path(@tag), success: 'ポストを更新しました'
    else
      flash.now[:danger] = 'ポストを更新できませんでした'
      render :edit
    end
  end

  def new
    @tag = Tag.new
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to '/admin/tags'
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end


end
