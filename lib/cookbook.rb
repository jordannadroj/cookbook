# Repository
require 'csv'
require_relative 'recipe'

class Cookbook
  attr_accessor :recipes

  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    store_csv
  end

  def mark_recipe_as_done(index)
    recipe = @recipes[index]
    recipe.mark_as_done
    store_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    # need to update csv when recipe is deleted
    store_csv
  end

  # def find(index)
  #   @recipes[index]
  # end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:done] = row[:done] == "true"
      @recipes << Recipe.new(row)
    end
  end

  def store_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ["name", "description", "rating", "done"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.done?, recipe.prep_time]
      end
    end
  end
end
