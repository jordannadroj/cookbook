require_relative "recipe"

require 'open-uri'
require 'nokogiri'
require "pry-byebug"


class ScrapeAllRecipesService
  def initialize(ingredient)
    @ingredient = ingredient
  end

  def call
    # binding.pry
    p url = "https://www.allrecipes.com/search/results/?search=#{@ingredient}"
    # 2 - Open the URL
    html_file = URI.open(url).read
    # 3 - Parsing HTML
    html_doc = Nokogiri::HTML(html_file, nil, "utf-8")
    # 4 - Look for first five results
    imported_recipes = []
    html_doc.search('.card__recipe').first(5).each do |element|
      # 5 - Create a recipe instance out of scraped results
      p name = element.search('.card__title').text.strip
      description = element.search('.card__summary').text.strip
      if element.search('.rating-star')
      rating = element.search('.rating-star').attribute('data-rating').value.to_f.round(2)
      end

      recipe_page = element.search('.card__titleLink').attribute('href').value

      prep_time = scrape_indivdual_page(recipe_page)

      # 6 - Store that in an array
      imported_recipes << Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
    end
    return imported_recipes
  end

  def scrape_indivdual_page(recipe_page)
    html_content = open(recipe_page).read
    # 3. Parse HTML
    doc = Nokogiri::HTML(html_content)

    doc.search('.recipe-meta-item-body').first.text.strip
  end
end

