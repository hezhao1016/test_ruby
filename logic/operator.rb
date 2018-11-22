# 运算符
# created by hezhao on 2018-05-12 15:56

# Ruby 支持一套丰富的运算符。大多数运算符实际上是方法调用。例如，a + b 被解释为 a.+(b)，其中指向变量 a 的 + 方法被调用，b 作为方法调用的参数。
# 对于每个运算符（+ - * / % ** & | ^ << >> && ||），都有一个相对应的缩写赋值运算符（+= -= 等等）。

# 指数运算，等于x的n次方
puts 2**2

# 联合比较运算符。如果第一个操作数等于第二个操作数则返回 0，如果第一个操作数大于第二个操作数则返回 1，如果第一个操作数小于第二个操作数则返回 -1
puts 1 <=> 2
puts 2 <=> 2
puts 2 <=> 1

# 恒等于（===）：用于测试 case 语句的 when 子句内的相等
age = 5
case
when age<=2
  puts "婴儿"
when (3..6) === age
  puts "孩童"
when (7..12) === age
  puts "少年"
when (3..18) === age
  puts "青少年"
else
  puts "成人"
end

# 或

age = 5
case age
when 0..2
  puts "婴儿"
when 3..6
  puts "孩童"
when 7..12
  puts "少年"
when 13..18
  puts "青少年"
else
  puts "成人"
end


# 如果接收器和参数具有相同的类型和相等的值，则返回 true
puts 1.eql?(1.0)

# 如果接收器和参数具有相同的对象 id，则返回 true
# a.equal?aObj

# 指数且赋值运算符，执行指数计算，并赋值给左操作数
i = 2
puts i**=3

# 并行赋值
a, b, c = 10, 20, 30
print a," ", b," ", c," \n"
# 交换两个变量
a, b = b ,a
print a," ", b," ", c," \n"

# 逻辑运算符
# &&	  逻辑与运算符。如果两个操作数都非零，则条件为真。
# ||	  逻辑或运算符。如果两个操作数中有任意一个非零，则条件为真。
# !	    逻辑非运算符。用来逆转操作数的逻辑状态。如果条件为真则逻辑非运算符将使其为假。
# and	  逻辑与运算符。如果两个操作数都为真，则条件为真。优先级较低
# or	  逻辑或运算符。如果两个操作数中有任意一个非零，则条件为真。优先级较低
# not	  逻辑非运算符。用来逆转操作数的逻辑状态。如果条件为真则逻辑非运算符将使其为假。优先级较低

# 三元运算符
puts 2>1 ? "2大于1" : "2小于1"

# 范围运算符
# ..	创建一个从开始点到结束点的范围（包含结束点）	  1..10 创建从 1 到 10 的范围
# ...	创建一个从开始点到结束点的范围（不包含结束点）	1...10 创建从 1 到 9 的范围


# defined? 运算符
# defined? 是一个特殊的运算符，以方法调用的形式来判断传递的表达式是否已定义。它返回表达式的描述字符串，如果表达式未定义则返回 nil
foo = 42
puts defined? foo    # => "local-variable"
puts defined? $_     # => "global-variable"
puts defined? bar    # => nil（未定义）

puts defined? puts        # => "method"
puts defined? puts(bar)   # => nil（在这里 bar 未定义）

# 如果存在可被 super 用户调用的方法，则为 True
puts defined? super

puts defined? yield    # => "yield"（如果已传递块）


# 常量解析运算符
# 你可以使用类或模块名称和两个冒号 :: 来引用类或模块中的常量。
# :: 是一元运算符，允许在类或模块内定义常量、实例方法和类方法，可以从类或模块外的任何地方进行访问。
# 请记住：在 Ruby 中，类和方法也可以被当作常量。
# 你只需要在表达式的常量名前加上 :: 前缀，即可返回适当的类或模块对象。
# 如果 :: 前的表达式为类或模块名称，则返回该类或模块内对应的常量值；如果 :: 前未没有前缀表达式，则返回主Object类中对应的常量值。

CONST = ' out there'
class Inside_one
  CONST = proc {' in there'}
  def where_is_my_CONST
    ::CONST + ' inside one'
  end
end
class Inside_two
  CONST = ' inside two'
  def where_is_my_CONST
    CONST
  end
end
puts Inside_one.new.where_is_my_CONST
puts Inside_two.new.where_is_my_CONST
puts Object::CONST + Inside_two::CONST
puts Inside_two::CONST + CONST
puts Inside_one::CONST
puts Inside_one::CONST.call + Inside_two::CONST
