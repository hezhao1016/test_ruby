# created by hezhao on 2018-05-17 0:50

# print 与 puts 类似。唯一的不同在于 puts 语句在输出内容后会跳到下一行，而使用 print 语句时，光标定位在同一行。
print "Hello,World!"
print "你好,世界!\n"

# putc 用于依次输出一个字符
str = "Hello！我是张三!"
str.each_char {|e|
  putc e
}

# puts 输出字符串到屏幕上
puts "\n请输入:"

# 输出变量类型、值
p "Hello"

# gets 用于获取来自名为 STDIN 的标准屏幕的用户输入
str = gets
puts "你输入的是:" + str