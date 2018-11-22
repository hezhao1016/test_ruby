# created by hezhao on 2018-05-17 23:54

# 异常语法
# begin #开始
#
#  raise.. #抛出异常
#
# rescue [ExceptionType = StandardException] #捕获指定类型的异常 缺省值是StandardException
#  $! #表示异常信息#表示异常信息
#  $@ #表示异常出现的代码位置#表示异常出现的代码位置
# else #其余异常
#  ..
# ensure #不管有没有异常，进入该代码块
#
# end #结束

# 从 begin 到 rescue 中的一切是受保护的。如果代码块执行期间发生了异常，控制会传到 rescue 和 end 之间的块。
# 对于 begin 块中的每个 rescue 子句，Ruby 把抛出的异常与每个参数进行轮流比较。如果 rescue 子句中命名的异常与当前抛出的异常类型相同，或者是该异常的父类，则匹配成功。
# 如果异常不匹配所有指定的错误类型，我们可以在所有的 rescue 子句后使用一个 else 子句。

begin
  file = open("temp")
  if file
    puts "打开文件成功!"
  end
rescue
  file = STDIN
end
print file, "==", STDIN, "\n"


# retry 语句 从开头开始执行 begin 块
# begin
#   do_something   # 抛出的异常
# rescue
#   # 处理错误
#   retry          # 重新从 begin 开始
# end
#
fname = "temp"
begin
  file = open(fname)
  if file
    puts "打开文件成功!"
  end
rescue
  fname = "../files/a.txt" # 注意：如果被重新命名的文件不存在，本实例代码会无限尝试。所以异常处理时，谨慎使用 retry。
  retry
end
print file, "==", STDIN, "\n"


# 使用 raise 语句抛出异常
# 语法:
# raise 重新抛出当前异常（如果没有当前异常则抛出一个 RuntimeError）
# 或
# raise "Error Message" 抛出一个新的 RuntimeError 异常，设置它的消息为给定的字符串。该异常之后抛出到调用堆栈
# 或
# raise ExceptionType, "Error Message" 抛出指定类型异常，然后设置相关的消息为第二个参数。
# 或
# raise ExceptionType, "Error Message" condition 与第三种形式类似，可以添加条件语句（比如 unless）来抛出异常
puts "-------------------------------"
begin
  puts "正常运行代码..."
  raise
  puts "接着运行正常代码..."
rescue
  puts "出现异常..."
end
puts "end 之后的代码..."


puts "-------------------------------"
begin
  puts "正常运行代码..."
  # raise "自定义异常信息"
  raise RuntimeError,"自定义异常信息"
  puts "接着运行正常代码..."
rescue RuntimeError => e # 可写多个rescue
  puts e.message
  puts e.backtrace.inspect
rescue Exception => e # 异常基类
  puts $! # 表示异常信息
  puts $@ # 表示异常出现的代码位置
end
puts "end 之后的代码..."


# ensure 语句

begin
  raise "抛出异常"
rescue Exception => e
  puts $!
  puts $@
ensure
  puts "一定会执行..."
end


puts "-------------------------------"
def test
  i = 0
  begin
    puts "begin..."

    # 故意抛出异常
    # a = 1 / 0

    # begin中的return语句先执行了但并没有立即返回，等到ensure执行结束后再返回
    return i += 1
  rescue
    puts "rescue..."
    return i += 2
  ensure
    puts "ensure..."

    if i > 0
      puts "i > 0 , i is "+ i.to_s
    end

    i += 3
    # ensure 中有return 则返回这个值
    # return i += 3
  end
end
puts "i = " + test.to_s


# 如果提供了 else 子句，它一般是放置在 rescue 子句之后，任意 ensure 之前。
# else 子句的主体只有在代码主体没有抛出异常时执行。
puts "-------------------------------"
begin
  #.. 过程
  puts "I'm not raising exception"
rescue Exception => e
  #.. 处理错误
  puts e.message
  puts e.backtrace.inspect
else
  #.. 如果没有异常则执行
  puts "Congratulations-- no errors!"
ensure
  #.. 这总是会执行
  puts "Ensuring execution"
end


# Catch 和 Throw
# raise 和 rescue 的异常机制能在发生错误时放弃执行，有时候需要在正常处理时跳出一些深层嵌套的结构。此时 catch 和 throw 就派上用场了。
# catch 定义了一个使用给定的名称（可以是 Symbol 或 String）作为标签的块。块会正常执行直到遇到一个 throw
#
# 语法
#
# throw :lablename
# #.. 这不会被执行
# catch :lablename do
# #.. 在遇到一个 throw 后匹配将被执行的 catch
# end
#
# 或
#
# throw :lablename condition
# #.. 这不会被执行
# catch :lablename do
# #.. 在遇到一个 throw 后匹配将被执行的 catch
# end
puts "-------------------------------"

# 例子，如果用户键入 '!' 回应任何提示，使用一个 throw 终止与用户的交互
def promptAndGet(prompt)
  print prompt
  res = readline.chomp
  throw :quitRequested if res == "!"
  return res
end

catch :quitRequested do
  name = promptAndGet("Name: ")
  age = promptAndGet("Age: ")
  sex = promptAndGet("Sex: ")
  # ..
  # 处理信息
end



# Exception 类
# Ruby 的标准类和模块抛出异常。所有的异常类组成一个层次，包括顶部的 Exception 类在内。下一层是七种不同的类型：
#   Interrupt
#   NoMemoryError
#   SignalException
#   ScriptError
#   StandardError
#   SystemExit
# Fatal 是该层中另一种异常，但是 Ruby 解释器只在内部使用它。
# ScriptError 和 StandardError 都有一些子类，但是在这里我们不需要了解这些细节。最重要的事情是创建我们自己的异常类，它们必须是类 Exception 或其子代的子类。
# 让我们看一个实例：
class FileSaveError < StandardError
  attr_reader :reason
  def initialize(reason)
    @reason = reason
  end
end
