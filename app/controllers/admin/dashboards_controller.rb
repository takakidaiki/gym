class Admin::DashboardsController < ApplicationController
  before_action :authenticate_admin!
    def index
        @users = User.all
    end
    
    def withdraw
      @user = User.find(params[:id])
      @user.update(is_deleted: true)
      reset_session
      redirect_to root_path
    end
end
