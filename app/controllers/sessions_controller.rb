class SessionsController < ApplicationController
    skip_before_action :login_required, only: [:new, :create]

    def new
    end

    def create
        user = User.find_by(name: params[:session][:name].downcase)
        if user && user.authenticate(params[:session][:password])
          log_in(user)
          redirect_to recipes_path
          flash[:notice] = 'ログインしました'
        else
          flash[:danger] = 'ログインに失敗しました'
          render :new
        end
    end

    def destroy
        session.delete(:user_id)
        flash[:notice] = 'ログアウトしました'
        redirect_to recipes_path
    end
end
