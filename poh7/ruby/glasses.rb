Point = Struct.new("Point", :x, :y)

class Image
  attr_reader :length
  attr_reader :bitmap

  def initialize(length)
    @length = length
    @bitmap = Array.new(length) { Array.new(length, nil) }
    load_bitmap_stdin
  end

  def match_part?(image)
    compare_length = self.length - image.length

    (0..compare_length).each { |x|
      (0..compare_length).each { |y|
        return Point.new(x, y) if match_part_of?(x, y, image)
      }
    }

    nil
  end

  def match_part_of?(start_x, start_y, image)
    array_length = image.length - 1

    (0..array_length).each { |x|
      check_x = x + start_x
      (0..array_length).each { |y|
        check_y = y + start_y

        return false if image.bitmap[x][y] != @bitmap[check_x][check_y]
      }
    }

    true
  end

  private
  def load_bitmap_stdin
    array_length = @length - 1
    (0..array_length).each { |x|
      values = gets.split(' ')

      (0..array_length).each { |y|
        @bitmap[x][y] = values[y]
      }
    }
  end
end

begin
  image= Image.new(gets.to_i)
  compare_image = Image.new(gets.to_i)

  result = image.match_part?(compare_image)

  puts result.x.to_s + ' ' + result.y.to_s
end
