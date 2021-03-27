# view
class View
  def ask_user
    puts "Hello, what would you like to do today?"
    print "> "
    gets.chomp
  end

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      done = recipe.done? ? "[x]" : "[ ]"
      puts "#{index + 1}. #{done} #{recipe.name} Rating: (#{recipe.rating.to_f.round(2)}/5) Prep Time: #{recipe.prep_time}"
    end
  end

  def ask_user_for_index
    puts "Input number of recipe done"
    gets.chomp.to_i - 1
  end

  def display_imported_recipes(imported_recipes)
    imported_recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe[0]}"
    end
  end

  def select_import
    puts "Which recipe would you like to import?"
    print "> "
    gets.chomp.to_i - 1
  end

  def importing_message(recipe)
    puts "Importing #{recipe}..."
    puts " "
  end


  def ask_for_recipe
    puts "What recipe would you like to add?"
    print "> "
    gets.chomp
  end

  def ask_for_description
    puts "What is the description?"
    print "> "
    gets.chomp
  end

  def ask_for_rating
    puts "What is the rating?"
    print "> "
    gets.chomp
  end

  def ask_for_prep_time
    puts "What is the prep time?"
    print "> "
    gets.chomp
  end

  def ask_for_ingredient
    puts "What ingredient would you like a recipe for?"
    print "> "
    gets.chomp
    # puts " "
    # puts "Looking for #{ingredient} recipes on the Internet..."
  end

  def searching_for_ingredient(ingredient)
    puts "Looking for #{ingredient} recipes on the Internet..."
  end

  def delete_recipe
    puts "Which recipe number would you like to delete?"
    print "> "
    gets.chomp.to_i - 1
  end
end
