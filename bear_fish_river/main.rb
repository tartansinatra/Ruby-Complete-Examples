class Bear
  def initialize(name, type)
    @name = name
    @type = type
    @food = []
  end

  def show_food
    "Bear #{@name} has food #{@food.inspect}"
  end

  def roar
    if type == "Polar"
      puts "ROOOOAR"
    else
      puts "rrooar"
    end
  end

  def take_fish_from(river)
    @food.push( river.get_fish() )
  end
end

class Fish
  def initialize(name)
    @name = name
  end
end

class River
  def initialize(fishes)
    @fishes = fishes
  end
  def get_fish
    @fishes.pop
  end
  def show_fishes
    "River has fishes #{@fishes.inspect}"
  end
end


yogi = Bear.new('Yogi', 'Grizzly')

nemo = Fish.new('Nemo')
sharky = Fish.new('Sharky')
george = Fish.new('George')

river_1 = River.new( [ nemo, sharky, george ] )

#Showing that the fishes has moved from the river to the bear
puts river_1.show_fishes
puts yogi.show_food
puts "Bear fishing"
yogi.take_fish_from(river_1)
puts river_1.show_fishes
puts yogi.show_food


