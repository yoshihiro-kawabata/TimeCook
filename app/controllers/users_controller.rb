class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user,  only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show]

    def new
        @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        log_in(@user)
        redirect_to recipes_path
      else
        render :new
      end
    end
  
    def show
      @user = User.find(params[:id])
      @recipes = Recipe.joins(users: [:recipes_users]).where(recipes_users: { user_id: @user.id }).order("id ASC").distinct.page params[:page]
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to recipes_path
            flash[:notice] = 'アカウントを更新しました'
        else
            render :edit
        end
    end

    def destroy
      RecipesUser.find_by(user_id:params[:user_id],recipe_id:params[:recipe_id]).destroy
      redirect_to user_path(current_user.id)
      flash[:notice] = 'レシピを削除しました'
    end


  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to current_user unless current_user?(@user)
    end
end