class Bottles
  def verse number
    if number.zero?
      NO_BOTTLES
    else
      Verse.new(number).show
    end
  end

  def verses max, min
    max.downto(min).map do |num|
      verse num
    end.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  NO_BOTTLES = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
end

class Verse
  def initialize number
    @number = number
  end

  def show
    bottles + " of beer on the wall, " +
    bottles + " of beer.\n" +
    take_one_or_down + " and pass it around, " +
    bottles(@number - 1) + " of beer on the wall.\n"
  end

  def bottles number=@number
    if number == 0
      "no more bottles"
    elsif number == 1
      "#{number} bottle"
    else
      "#{number} bottles"
    end
  end

  def take_one_or_down
    @number == 1 ? "Take it down" : "Take one down"
  end
end
