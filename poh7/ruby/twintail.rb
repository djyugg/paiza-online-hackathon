Drink = Struct.new("Drink", :caffein, :price) do
  include(Comparable)

  def calc_cospa
    caffein.quo(price)
  end

  def <=> (other)
    self.calc_cospa <=> other.calc_cospa
  end

end

def get_drink
  values = gets.split(" ")
  Drink.new(values[0].to_f, values[1].to_i)
end

begin
  drink1 = get_drink
  drink2 = get_drink

  if drink1 > drink2
    puts 1
  else
    puts 2
  end

end
