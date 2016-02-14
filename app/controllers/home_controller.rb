#=Home Controller
# This controller contains methods for the main starting index.
class HomeController < ApplicationController
  def index
    @number_of_recipes = Recipe.count
    @latest_recipe = Recipe.last
  end

  def about
  end
  
  def contact
  end
end
