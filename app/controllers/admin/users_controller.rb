class Admin::UsersController < ApplicationController
  def index
    if params[:role]
      @users = User.select_users.get_by_role(params[:role])
    else
      @users = User.select_users
    end
    @users = @users.order(created_at: :desc).page(params[:page]).per Settings.pages.per_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".add_success" + " " + @user.name
      redirect_to admin_users_path(@user)
    else
      flash[:danger] = t ".add_failed"
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]

    return if @user
    flash[:danger] = t ".not_found"
    redirect_to admin_root_path
  end

  def update
    if current_user.admin?
      @user = User.find_by id: params[:id]
      if @user.update_attributes role: params[:role]
        respond_to do |format|
          format.html do
            flash[:success] = "Assigned new permission!"
            redirect_to @user
          end
          format.js
        end
      end
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :phone, :password, :password_confirmation
  end
end
