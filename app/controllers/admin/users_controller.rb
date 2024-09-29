class Admin::UsersController < ApplicationController
   before_action :authenticate_admin!
    def index
        @users = User.all
    end
    
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
    end
    
    def withdraw
      @user = User.find(params[:id])
      @user.update(is_deleted: true)
      redirect_to admin_users_path
    end
end
