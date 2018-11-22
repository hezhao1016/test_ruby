# created by hezhao on 2018-05-19 0:25

# 不调用对象构造器 initialize 的情况下创建对象，即，使用 new 方法创建对象，可以调用 allocate 来创建一个未初始化的对象

class Box
  attr_accessor :height, :width

  def initialize(w, h)
    @width = w
    @height = h
  end

  def getArea
    @width * @height
  end
end

b1 = Box.new(10, 20)
puts "Area of the box is : #{b1.getArea}"

b2 = Box.allocate
puts "Area of the box is : #{b2.getArea}" # 报错 undefined method `*' for nil:NilClass (NoMethodError)