# created by hezhao on 2018-05-15 18:08

# 当一个类可以从多个父类继承类的特性时，该类显示为多重继承。
# Ruby 不直接支持多重继承，但是 Ruby 的模块（Module）有另一个神奇的功能。它几乎消除了多重继承的需要，提供了一种名为 mixin 的装置。
# Ruby 没有真正实现多重继承机制，而是采用成为mixin技术作为替代品。将模块include到类定义中，模块中的方法就mix进了类中。

# 跑的能力
module RunnableMixIn
  def run
      puts 'Running...'
  end
end

#飞的能力
module FlyableMixIn
  def fly
    puts 'Flying...'
  end
end

# 肉食行为
module CarnivorousMixIn
  def eat
      puts '吃肉...'
  end
end

# 植食行为
module HerbivoresMixIn
  def eat
      puts '吃草...'
  end
end

# 动物 基类
class Animal
  def info
    puts "动物..."
  end
end

# 狗
class Dog < Animal
include RunnableMixIn
include CarnivorousMixIn

  def wangwang
    puts "汪汪汪..."
  end
end

#蝙蝠
class Bat < Animal
include FlyableMixIn
include CarnivorousMixIn

  def xixie
    puts "吸血..."
  end
end

#鹦鹉
class Parrot < Animal
include FlyableMixIn
include HerbivoresMixIn

  def xuerenhua
    puts "学人话..."
  end
end

#鸵鸟
class Ostrich < Animal
include RunnableMixIn
include HerbivoresMixIn

  def big
    puts "我是最大的不会飞的鸟类..."
  end
end

puts "- - - - - - - - -"
dog = Dog.new
dog.wangwang
dog.run
dog.eat

puts "- - - - - - - - -"
bat = Bat.new
bat.xixie
bat.fly
bat.eat

puts "- - - - - - - - -"
parrot = Parrot.new
parrot.xuerenhua
parrot.fly
parrot.eat

puts "- - - - - - - - -"
ostrich = Ostrich.new
ostrich.big
ostrich.run
ostrich.eat
ostrich.info

puts "Bat 是否引用了 FlyableMixIn 模块： " + (bat.is_a?FlyableMixIn).to_s