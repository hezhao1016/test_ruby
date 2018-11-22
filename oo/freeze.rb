# 冻结对象
# 任何对象都可以通过调用 Object.freeze 进行冻结。冻结对象不能被修改，也就是说，您不能改变它的实例变量。
# created by hezhao on 2018-05-19 0:25

class Box
  attr_accessor :height, :width

  def initialize(w, h)
    @width = w
    @height = h
  end


  def to_s
    "width:#@width, height:#@height"
  end
end

b1 = Box.new(10, 20)
puts b1

# 冻结对象
b1.freeze
# 判断是否是冻结对象
if b1.frozen?
  puts "该对象已经冻结"
else
  puts "没有冻结"
end

# 报错，不能对冻结对象赋值
# b1.width = 20
# b1.height = 40

# 但是，可以重新指向一个新对象
b1 = Box.new(1,1)

puts b1
