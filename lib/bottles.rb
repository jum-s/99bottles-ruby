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
    "#{quantity.capitalize} #{container} of beer on the wall, " +
    "#{quantity} #{container} of beer.\n" +
    "#{action}, " +
    "#{quantity(minus_one)} #{container(minus_one)} of beer on the wall.\n"
  end

  private

  def action number=@number
    case number
    when 0
      "Go to the store and buy some more"
    else
      "Take " + pronoun + " down and pass it around"
    end
  end

  def minus_one
    case @number
    when 0
      99
    else
      @number - 1
    end
  end

  def quantity number=@number
    case number
    when 0
      "no more"
    when 6
      "#{number / 6}"
    else
      "#{number}"
    end
  end

  def container number=@number
    case number
    when 0
      "bottles"
    when 1
      "bottle"
    when 6
      "six-pack"
    else
      "bottles"
    end
  end

  def pronoun
    @number == 1 ? "it" : "one"
  end
end
