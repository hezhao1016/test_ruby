# 方法
# created by hezhao on 2018-05-15 18:08

# 方法名应以小写字母开头，方法应在调用之前定义，否则 Ruby 会产生未定义的方法调用异常
# 语法：
# def method_name [( [arg [= default]]...[, * arg [, &expr ]])]
#   expr..
# end

#####################方法定义
# 无参方法
def simple
  puts "无参方法"
end

# 带参方法
def sayHello(name,age)
  puts "我是#{name},我今年#{age}岁"
end

# 参数默认值
def defaultArgs(name="张三",age=18)
  puts "我是#{name},我今年#{age}岁"
end

def argsNotSure (*args)
  puts "参数个数为 #{args.length}"
  for i in 0...args.length
    puts "  >参数值为 #{args[i]}"
  end
end


# 调用无参方法无需括号
simple

sayHello("李四","22")
# 调用有参方法，可以不带括号
sayHello"李四","23"

defaultArgs

argsNotSure "Zara", "6", "F"
argsNotSure "Mac", "36", "M", "MCA"



##################### 方法的返回值
puts "+++++++++++++++++++++++++++++"
# Ruby 中的每个方法默认都会返回一个值。这个返回的值是最后一个语句的值
def test
  i = 100
  j = 10
  k = 1
end

puts test # 输出1


# return 语句用于从方法中返回一个或多个值
# 如果给出大于等于两个的表达式，将返回数组。如果未给出表达式，nil 将是返回值
def test1
  i, j, k = 100, 10, 1
  return
end
def test2
  i, j, k = 100, 10, 1
  return i
end
def test3
  i, j, k = 100, 10, 1
  return i, j, k
end

puts test1 # 输出空
puts test2 # 输出100
print test3 # 输出数组



##################### 类方法
# 当方法定义在类的外部，方法默认标记为 private。另一方面，如果方法定义在类中的，则默认标记为 public。
# 方法默认的可见性和 private 标记可通过模块（Module）的 public 或 private 改变。
# 当你想要访问类的方法时，您首先需要实例化类。然后，使用对象，您可以访问类的任何成员。
# Ruby 提供了一种不用实例化即可访问方法的方式。让我们看看如何声明并访问类方法
puts "\n+++++++++++++++++++++++++++++"
class Class1
  # 类方法，类似于Java静态方法
  def Class1.show
    puts "我是类方法!"
  end
end

Class1.show



##################### alias 语句
# 这个语句用于为方法或全局变量起别名。别名不能在方法主体内定义。即使方法被重写，方法的别名也保持方法的当前定义。
# 为编号的全局变量（$1, $2,...）起别名是被禁止的。重写内置的全局变量可能会导致严重的问题。
puts "+++++++++++++++++++++++++++++"

$mname = "Hz"
def me_thod
  puts "me_thod"
end

alias mt me_thod
alias $mn $mname

mt
puts $mn



# undef 语句
# 这个语句用于取消方法定义。undef 不能出现在方法主体内。
# 通过使用 undef 和 alias，类的接口可以从父类独立修改，但请注意，在自身内部方法调用时，它可能会破坏程序。
puts "+++++++++++++++++++++++++++++"

undef me_thod
