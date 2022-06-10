class Triangle
  attr_accessor :length, :width, :hypothenuese

  def initialize(length, width, hypothenuese)
    @length = length
    @width = width
    @hypothenuese = hypothenuese
  end

  def kind
    validate_triangle
    if length == width && width == hypothenuese
      :equilateral
    elsif length == width || width == hypothenuese || length == hypothenuese
      :isosceles
    else
      :scalene
    end

  end

  def valid_sides
    [length, width, hypothenuese].all?(&:positive?)
  end

  def valid_triangle_inquality
    length + width > hypothenuese && length + hypothenuese > width && width + hypothenuese > length
  end

  def validate_triangle
    raise TriangleError unless valid_sides && valid_triangle_inquality
  end

  class TriangleError < StandardError
  end

end
