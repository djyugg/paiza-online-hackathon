CutPoint = Struct.new('CutPoint', :pattern, :point)

class RectangularDivider
  def initialize()
    input = gets.split(' ')

    x_length = input[0].to_i
    y_length = input[1].to_i
    z_length = input[2].to_i

    cut_points = input_cut_points(input[3].to_i)
    @divided_rectangular_volumes = calc_divided_rectangular_volumes(x_length, y_length, z_length, cut_points)
    @divided_rectangular_volumes.sort!
  end

  def get_min_volume
    puts @divided_rectangular_volumes.first
  end

  private
  DIVIDE_PATTERN_X = '0'

  def calc_divided_rectangular_volumes(x_length, y_length, z_length, cut_points)
    x_cut_point, y_cut_point = cut_points.partition { |cut_point|
      cut_point.pattern == DIVIDE_PATTERN_X
    }

    divide_x_length_array = calc_divide_length(x_length, x_cut_point)
    divide_y_length_array = calc_divide_length(y_length, y_cut_point)

    rectangular_volumes = []
    divide_x_length_array.each { |divide_x_length|
      divide_y_length_array.each { |divide_y_length|
        rectangular_volumes.push(divide_x_length * divide_y_length * z_length)
      }
    }

    rectangular_volumes
  end

  def calc_divide_length(length, cut_points)
    cut_point_values = cut_points.collect { |cut_point| cut_point.point }
    cut_point_values.sort!

    tmp = 0
    length_array = []
    cut_point_values.each { |point|
      length_array.push(point - tmp)
      tmp = point
    }

    length_array.push(length - tmp)
  end

  def input_cut_points(point_count)
    cut_points = []

    point_count.times {
      input = gets.split(' ')
      cut_points.push(CutPoint.new(input[0], input[1].to_i))
    }

    cut_points
  end
end

begin
  rectangular_divider = RectangularDivider.new
  puts rectangular_divider.get_min_volume
end
