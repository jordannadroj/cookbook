# Model
class Recipe
  attr_accessor :name, :description, :rating, :done, :prep_time

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @rating = attributes[:rating]
    @done = attributes[:done] || false
    @prep_time = attributes[:prep_time]
  end

  def mark_as_done
    @done = true
  end

  def done?
    @done
  end
end
