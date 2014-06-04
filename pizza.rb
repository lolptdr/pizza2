class Pizza
  attr_accessor :toppings, :delivery_time

  def initialize(toppings = [Topping.new('cheese')])
  	@toppings = toppings
  end
  def vegetarian?
  	@toppings.all? { |top| top.vegetarian }
  end
  def add_topping(new_topping)
  	@toppings << new_topping
  end
  def deliver!
		@delivery_time = Time.now.to_i + 30*60
  end
  def late?
  	if @delivery_time.to_i > Time.now.to_i
  		return true
  	else
  		return false
  	end
  end
end

class Topping
  attr_accessor :name, :vegetarian
  # Instantiate a new topping.
  #
  # name 	   - String name of the topping
  # vegetarian - Boolean indicating whether or not the topping is
  #              vegetarian
  #
  # Returns a new Topping object.
  def initialize(name='', vegetarian: false)
    @name = name
    @vegetarian = vegetarian
  end
end
