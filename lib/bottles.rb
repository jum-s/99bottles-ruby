class Bottles
  def verse number
    Bottle.new(number).show
  end

  def verses max, min
    max.downto(min).map do |num|
      Bottle.new(num).show
    end.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

end

class Bottle
  def initialize number
    @number = number
  end

  def show
    return NO_BOTTLES if @number.zero?
    container + " of beer on the wall, " +
    container + " of beer.\n" +
    take_one_or_down + " and pass it around, " +
    container(@number - 1) + " of beer on the wall.\n"
  end

  private

  NO_BOTTLES = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"

  def container number=@number
    case  number
    when 0
      "no more bottles"
    when 1
      "#{number} bottle"
    when 6
      "1 six-pack"
    else
      "#{number} bottles"
    end
  end

  def take_one_or_down
    @number == 1 ? "Take it down" : "Take one down"
  end
end
