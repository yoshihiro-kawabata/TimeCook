class RecipesController < ApplicationController
    before_action :login_required, only: [:edit]
    before_action :correct_user, only: [:edit]

    def index
    end
         
    def create
      redirect_to recipe_path(params[:id])
    end
    
    def show
      @recipes = Recipe.find(params[:id])
      @tasks = Task.where(recipe_id: @recipes.id)
    end
  
    def edit
      userA = User.find(current_user.id)
      recipeA = Recipe.find(params[:recipe_id])
      recipesUser = RecipesUser.find_by(user_id:userA.id,recipe_id:recipeA.id)
      if recipesUser != nil
        redirect_to recipe_path(recipeA.id)
        flash[:notice] = '既に登録されています。マイレシピをご確認下さい。'
      else
        userA.recipes << recipeA
        redirect_to recipe_path(recipeA.id)
        flash[:notice] = 'レシピを登録しました。マイレシピから確認できます。'      
      end
    end
  
    private
  
      def correct_user
        @user = User.find(current_user.id)
        redirect_to current_user unless current_user?(@user)
      end
end