class Bottles
  def verse number
    Verse.new(number).show
  end

  def verses max, min
    max.downto(min).map do |num|
      Verse.new(num).show
    end.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

end

class Verse
  def initialize number
    @number = number
  end

  def show
    return NO_CONTAINER if @number.zero?
    container + " of beer on the wall, " +
    container + " of beer.\n" +
    take_one_or_down + " and pass it around, " +
    container(@number - 1) + " of beer on the wall.\n"
  end

  private

  NO_CONTAINER = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"

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
