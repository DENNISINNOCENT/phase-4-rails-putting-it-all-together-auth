class RecipesController < ApplicationController
 
before_action :authorize

def index
    recipes =Recipe.all 
    render json: recipes ,status: :created
end

def create
    recipe =Recipe.create(recipe_params)
    render json: recipe, include: user, status: :created
end
private
def unprocessable_entity
    
end
def recipe_params
   params.permit(:title,:instructions,:minutes_to_complete) 
end
def authorize
    return render json: {error: "Not authorized"},status: :unauthorized unless session.include? :user_id
end
    
end


end
