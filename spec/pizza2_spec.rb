require './pizza2'
require 'pry-byebug'

describe Pizza do
  it "exists" do
    expect(Pizza).to be_a(Class)
  end

  describe '.initialize' do
    it 'records all of the toppings' do
      toppings = [
        Topping.new('mushrooms', vegetarian: true),
        Topping.new('pepperoni')
      ]
      pizza = Pizza.new(toppings)

      expect(pizza.toppings).to eq(toppings)
    end

    it 'defaults the toppings to cheese only, if the pizza has no toppings' do
      pizza = Pizza.new

      expect(pizza.toppings.size).to eq(1)
      expect(pizza.toppings.first.name).to eq('cheese')
    end

    it 'all toppings are vegetarian' do
    	toppings = [
        Topping.new('mushrooms', vegetarian: true),
        Topping.new('jalapenos', vegetarian: true)
      ]
      pizza = Pizza.new(toppings)

      expect(pizza.vegetarian?).to be_true
    end
  end
end

describe Topping do
  it "exists" do
    expect(Topping).to be_a(Class)
  end

  describe '.initialize' do
    it "creates a new topping with a name" do
      topping = Topping.new("olives")
      expect(topping.name).to eq('olives')
    end

    it 'sets whether or not the topping is vegetarian' do
      topping = Topping.new('bell peppers', vegetarian: true)
      expect(topping.vegetarian).to eq(true)  
    end 
  end
end