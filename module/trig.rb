# Ruby 模块（Module）
# 模块（Module）是一种把方法、类和常量组合在一起的方式。模块（Module）为您提供了两大好处。
#   模块提供了一个命名空间和避免名字冲突。
#   模块实现了 mixin 装置。
# 模块（Module）定义了一个命名空间，相当于一个沙盒，在里边您的方法和常量不会与其他地方的方法常量冲突。
# 模块类似与类，但有一下不同：
#   模块不能实例化
#   模块没有子类
#   模块只能被另一个模块定义

# created by hezhao on 2018-05-15 18:08

module Trig
  PI = 3.141592654

  def Trig.perimeter(r)
    return 2 * PI * r
  end

  def Trig.area(r)
    return PI * (r ** 2)
  end
end

puts Trig.perimeter 3
puts Trig.area 3
puts Trig::PI
