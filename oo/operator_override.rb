# 操作符重载
# created by hezhao on 2018-05-19 0:25

class Box
  attr_accessor :height, :width

  def initialize(w, h)
    @width = w
    @height = h
  end

  # 定义 + 来执行向量加法
  def +(other)
    Box.new(@width + other.width, @height + other.height)
  end

  # 定义一元运算符 - 来对 width 和 height 求反
  def -@
    Box.new(-@width, -@height)
  end

  # 执行标量乘法
  def *(scalar)
    Box.new(@width * scalar, @height * scalar)
  end

  def to_s
    "width:#@width, height:#@height"
  end
end

b1 = Box.new(10, 20)
puts b1
b2 = Box.new(20, 30)
puts b2

b3 = b1 + b2
puts b3

b4 = -b2
puts b4

b5 = b1 * 2
puts b5