# controller
# require the model
require_relative 'recipe'
# require the view
require_relative 'view'
require_relative 'parsing'
require 'nokogiri'
require 'open-uri'
require "pry-byebug"


class Controller
  attr_accessor :cookbook

  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def create
    name = @view.ask_for_recipe
    description = @view.ask_for_description
    rating = @view.ask_for_rating
    prep_time = @view.ask_for_prep_time
    new_recipe = Recipe.new(name: name, rating: rating, description: description, prep_time: prep_time)

    @cookbook.add_recipe(new_recipe)
    return list
  end

  def user_search
    # puts "What ingredient would you like a recipe for?"
    # ingredient = gets.chomp
    ingredient = @view.ask_for_ingredient
    @view.searching_for_ingredient(ingredient)
    # make an HTTP request with ingredient
    imported_recipes = ScrapeAllRecipesService.new(ingredient).call

    # display the recipes in an indexed list
    @view.display(imported_recipes)
    # ask the user which recipe they want to import
    selected_index = @view.select_import
    # add to the cookbook
    recipe = imported_recipes[selected_index]
    @view.importing_message(recipe)
    @cookbook.add_recipe(recipe)
    return list
  end

  def scrape_url(recipe_url)
    url = recipe_url
    html_content = open(url).read
    doc = Nokogiri::HTML(html_content)
    doc.search('.recipe-meta-item-body').first.text.strip
  end

  def mark_as_done
    display_recipes
    index = @view.ask_user_for_index
    recipe = @cookbook.mark_recipe_as_done(index)
    return list
  end

  def destroy
    display_recipes
    recipe_index = @view.delete_recipe
    @cookbook.remove_recipe(recipe_index)
    display_recipes
  end

  def display_recipes
    recipes = @cookbook.all
    @view.display(recipes)
  end
end
