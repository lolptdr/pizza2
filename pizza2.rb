class Pizza
  attr_reader :toppings

  def initialize(toppings=[Topping.new("cheese")])
    @toppings = toppings
  end

  def vegetarian?
  	@toppings.all? { |x| x.vegetarian }
  end

end

class Topping
  attr_accessor :name, :vegetarian

  def initialize(name, vegetarian: false)
    @name=name
    @vegetarian=vegetarian
  end
end