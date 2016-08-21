class Bottles
  def verse number
    number == 0 ? NO_BOTTLES : find_verse(number)
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

  def find_verse number
    bottles(number) + " of beer on the wall, " +
    bottles(number) + " of beer.\n" +
    take_one_or_down(number) + " and pass it around, " +
    bottles(number - 1) + " of beer on the wall.\n"
  end

  def bottles number
    if number == 0
      "no more bottles"
    elsif number == 1
      "#{number} bottle"
    else
      "#{number} bottles"
    end
  end

  def take_one_or_down number
    number == 1 ? "Take it down" : "Take one down"
  end
end
