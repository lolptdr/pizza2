require './pizza'
require 'pry-debugger'

describe Pizza do
  it "exists" do
    	expect(Pizza).to be_a(Class)
  end
  describe '.initialize' do
  	it 'defaults the toppings to cheese only, if the pizza has no toppings' do
  		pizza = Pizza.new

			expect(pizza.toppings.size).to eq(1)
  		expect(pizza.toppings.first.name).to eq('cheese')
	  end
  	it 'records all of the toppings' do
  		toppings = [
  			Topping.new('mushrooms', vegetarian: true),
  			Topping.new('pepperoni')
  		]
  		pizza = Pizza.new(toppings)

  		expect(pizza.toppings).to eq(toppings)	
  	end
  end
  describe '.vegetarian?' do
    it 'confirm toppings are vegetarian' do
  	  toppings = [Topping.new('tomato',vegetarian: true)]
  	  pizza = Pizza.new(toppings)
 		  
      expect(pizza.vegetarian?).to eq(true)
 	  end
  end
  describe '.add_topping' do
 	  it 'adds toppings to total array of toppings' do
 		  toppings = [Topping.new('tomato',vegetarian: true)]
 		  pizza = Pizza.new(toppings)
 		  pizza.add_topping(Topping.new('sausage',vegetarian:false))
      expect(pizza.toppings.size).to eq(2)
    end  
  end
  describe '.deliver!' do
    # let(:now) { Time.now }
    # let(:now) { Timecop.freeze(Time.now) }
    it 'schedules a pizza to be delivered 30 minutes in the future' do
      pizza = Pizza.new
      result = pizza.deliver!
      # converted time to integer (seconds precision), may fail when 23:59:59.999999999
      # or however specified latest possible Time
      expect(pizza.delivery_time).to eq(Time.now.to_i + 30*60)
    end
  end
  describe '.late?' do
    it 'confirm if delivery time is late' do
      pizza = Pizza.new
    end
  end

end

describe Topping do
  it "exists" do
    	expect(Topping).to be_a(Class)
  end
  describe '.initialize' do
  	it "sets the name of the topping" do
  		topping = Topping.new('olives')

  		expect(topping.name).to eq('olives')
  	end
  	it 'sets whether or not the topping is vegetarian' do
  		topping = Topping.new 'bell peppers', vegetarian: true

  		expect(topping.vegetarian).to eq(true)
  	end
  end
end





