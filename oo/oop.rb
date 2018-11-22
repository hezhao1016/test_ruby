# 面向对象
# created by hezhao on 2018-05-18 18:19
#
# Ruby只支持单继承 ， 但是支持mixin，可以实现类似多继承功能
# Ruby中没有接口、抽象类 功能
# RUby中没有函数重载，只要使用默认参数、可变参数可以实现类似的效果了

# 动物 基类
class Animal
  # 常量可被继承，也可像实例方法一样被重写。
  INFO = "哺乳动物"

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def eat
    puts "动物[#{name}]在吃东西..."
  end
end

# 狗 继承自动物
class Dog < Animal
  attr_accessor :color

  # 重写构造函数
  def initialize(name,color)
    @name = name
    @color = color
  end

  # 重写方法
  def eat
    # super 调用父类中和当前方法名相同的方法
    puts "小狗[#{name}]在吃骨头..."
  end

  def play
    puts "小狗[#{name}]在玩棒球..."
  end
end

# 猫 继承自动物
class Cat < Animal
  # 重写常量
  INFO = "猫科动物"

  def catchMice
    puts "小猫[#{name}]在抓老鼠..."
  end
end

animal = Animal.new("动物")
animal.eat

dog = Dog.new("旺财", "黄色")
dog.eat
dog.play
puts "#{dog.name} is : #{Dog::INFO}"

cat = Cat.new("猫咪")
cat.eat
cat.catchMice
puts "#{cat.name} is : #{Cat::INFO}"


# instance_of? 方法用来判断对象是否是一个类的实例，会忽略继承
puts dog.instance_of? Animal
puts cat.instance_of? Animal
puts animal.instance_of? Dog

# is_a? kind_of? 这两个方法都用来判断对象是否是一个类的实例，包括超类和module
puts dog.is_a? Animal
puts cat.kind_of? Animal
puts animal.is_a? Dog