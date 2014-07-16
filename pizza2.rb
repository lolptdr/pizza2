class Pizza
  attr_reader :toppings, :delivery_time

  def initialize(toppings=[Topping.new("cheese", vegetarian: true)])
    @toppings = toppings
    # @delivery_time = Time.now + 30*60
  end

  def vegetarian?
  	@toppings.all? { |x| x.vegetarian }
  end

  def add_topping(topping)
  	@toppings << topping
  end

  def deliver!
  	@delivery_time = Time.now.to_i + 30*60
  end

  def late?
  	Time.now.to_i > @delivery_time
  end
end

class Topping
  attr_accessor :name, :vegetarian

  def initialize(name, vegetarian: false)
    @name=name
    @vegetarian=vegetarian
  end
end