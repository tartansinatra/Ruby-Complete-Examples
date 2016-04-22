require 'pry-byebug'

require_relative 'mgp'
require_relative 'mgp_fast'
require_relative 'mgp_oo'
require_relative 'mgp_prototypes'

def nick
  for i in 1..105
    if (i%3==0)&&(i%5==0)&&(i%7==0)
      "PlingPlangPlong"
    elsif (i%3==0)&&(i%5==0)
      "PlingPlang, "
    elsif (i%3==0)&&(i%7==0)
      "PlingPlong, "
    elsif (i%5==0)&&(i%7==0)
      "PlangPlong, "
    elsif i%7==0
      "Plong, "
    elsif i%5==0
      "Plang, "
    elsif i%3==0
      "Pling, "
    else
      "#{i}, "
    end
  end
end


def sky
  for n in 1..105
    o = ""
    o += "Pling" if n % 3 == 0
    o += "Plang" if n % 5 == 0
    o += "Plong" if n % 7 == 0
    o = n.to_s if o == ""
     "#{o}, "
  end
end


def callumh
  def convert(i)
    output = ''

    output += 'Pling' if i % 3 == 0
    output += 'Plang' if i % 5 == 0
    output += 'Plong' if i % 7 == 0

    output = i.to_s if output == ''
    output
  end

  for i in 1..104
     "#{convert(i)}, "
  end
   convert(105)
end

def oscar
  def r(n)
    o = []
    o.push('Pling') if n % 3 == 0
    o.push('Plang') if n % 5 == 0
    o.push('Plong') if n % 7 == 0
    o.push(n) if o.empty?
    o.join('')
  end
  na = (1..105).map do |i|
    r(i)
  end
   na.join(', ')
end



def beth
  def rain_checker(numbers)

    numbers.each do |number|
       "Pling" if number % 3 == 0
        "Plang" if number % 5 == 0
       "Plong" if number % 7 == 0
       "#{number}" if number % 3 != 0 && number % 7 != 0 && number % 5 != 0
       ", "
    end
     " "
  end

  rain_checker((1..105).to_a)
end



class Test

  attr_accessor :num

  def initialize(num)
    @num = num.to_i
  end

  def three
    @num % 3 == 0
  end

  def five
    @num % 5 == 0
  end

  def seven
    @num % 7 == 0
  end

  def div_check
    if three
       "Pling"
    end
    if five
       "Plang"
    end
    if seven
       "Plong"
    end
    if !three && !five && !seven
       @num
    end
  end
end

def callumd
  (1..105).each do |num|
    test=Test.new(num)
    test.div_check
  end
end



class Raindrops

  def initialize(num)
    @num = num
    @plings = {
      3 => "Pling",
      5 => "Plang",
      7 => "Plong"
    }
  end

  def pling_plang_plong(number)
    str = divisible_by?(3, number) + divisible_by?(5, number) + divisible_by?(7, number)
    str = number if str == ""
    str
  end

  def run
    (1..@num).map{|i| pling_plang_plong(i)}.join(",")
  end

  def divisible_by?(divisor, number)
     number % divisor == 0 ? @plings[divisor] : ""
  end

end

def keith_and_valerie
  raindrops = Raindrops.new(105)
   raindrops.run
end


@s = ""

def rick

  def test_number?(n)
    n % 3 == 0 || n % 5 == 0 || n % 7 == 0
  end

  def do_the_pling_plang2
    if @s.empty?
      (1..105).each do |n|
        @s += 'Pling' if n % 3 == 0
        @s += 'Plang' if n % 5 == 0
        @s += 'Plong' if n % 7 == 0
        @s += n.to_s unless test_number?(n)
        @s += ', '
      end
    end
    @s.chomp(', ')
  end
  do_the_pling_plang2
end




require 'benchmark'

Benchmark.bmbm do |b|
  b.report("MGP's Code") do
    10000.times do
      do_the_pling_plang.join(", ")
    end
  end

  b.report("Nick's Code") do
    10000.times do
      nick
    end
  end

  b.report("Sky's Code") do
    10000.times do
      sky
    end
  end

  b.report("Callum H's Code") do
    10000.times do
      callumh
    end
  end

  b.report("Oscar's Code") do
    10000.times do
      oscar
    end
  end

  b.report("Beth's Code") do
    10000.times do
      beth
    end
  end

  b.report("Callum D's Code") do
    10000.times do
      callumd
    end
  end


  b.report("Callum H's Code") do
    10000.times do
      callumh
    end
  end

  b.report("Keith and Valerie's Code") do
    10000.times do
      keith_and_valerie
    end
  end

  b.report("Rick's Code") do
    10000.times do
      rick
    end
  end

  b.report("MGP's cacheing") do
    10000.times do
      mgp_super_fast
    end
  end

  b.report("Object Orientation") do
    10000.times do
      mgp_oo
    end
  end

  [1,2,3].each do |v|
    b.report("MGP's prototypes: v#{v}") do
      10000.times do
        (1..105).map { |value| send("ppp_v#{v}",value) }.join(', ')
      end
    end
  end


end











