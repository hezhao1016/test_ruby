# 读写文件
# created by hezhao on 2018-05-17 0:50


# Ruby 提供了一整套 I/O 相关的方法，在内核（Kernel）模块中实现。所有的 I/O 方法派生自 IO 类。
# 类 IO 提供了所有基础的方法，比如 read、 write、 gets、 puts、 readline、 getc 和 printf。


# File.new 方法创建一个 File 对象
f = File.new("../files/a.txt","r")
# 处理文件...
f.close

# File.open 方法打开文件,可与块关联，不必显式关闭文件
File.open("../files/a.txt","r") do |f|
  # 处理文件...
end

# open方法打开文件
f = open("../files/a.txt","r")
# 处理文件...
f.close


# 模式
# r	  只读模式。文件指针被放置在文件的开头。这是默认模式。
# r+	读写模式。文件指针被放置在文件的开头。
# w	  只写模式。如果文件存在，则重写文件。如果文件不存在，则创建一个新文件用于写入。
# w+	读写模式。如果文件存在，则重写已存在的文件。如果文件不存在，则创建一个新文件用于读写。
# a	  只写模式。如果文件存在，则文件指针被放置在文件的末尾。也就是说，文件是追加模式。如果文件不存在，则创建一个新文件用于写入。
# a+	读写模式。如果文件存在，则文件指针被放置在文件的末尾。也就是说，文件是追加模式。如果文件不存在，则创建一个新文件用于读写。


puts "----------------读取指定字节数内容------------------"
f = File.new("../files/a.txt","r")
if f
  temp = f.sysread(1024)
  puts temp
else
  puts "打开文件失败!"
end
f.close

puts "----------------读取所有内容------------------"
File.open("../files/a.txt","r") do |f|
  puts f.read
end

puts "----------------读取整个文件的所有的行，把它们放到一个 array 里------------------"
File.open("../files/a.txt","r") do |f|
  contents = f.readlines
  puts "#{contents}"
end

puts "-----------------读取一行-----------------"
File.open("../files/a.txt","r") do |f|
  puts f.readline
  puts f.readline
  puts f.gets
end

puts "---------------遍历文件内容-------------------"
File.open("../files/a.txt","r") do |f|
  f.each { |i| puts i }
end

puts "---------------IO 类 读取所有内容-------------------"
puts IO.read("../files/a.txt")

puts "----------------IO 类 读取整个文件的所有的行------------------"
contents = IO.readlines("../files/a.txt")
contents.each { |line| puts line}

puts "-----------------IO 类 foreach遍历-----------------"
IO.foreach("../files/a.txt") { |i| puts i }



########## 写文件
File.open("../files/b.txt","w") do |f|
  f.write("Hello！我是张三")
  f.write("Hello！我是张三")
end

# 写文件
File.open("../files/b1.txt","w") do |f|
  f.syswrite("Hello！我是张三")
  f.syswrite("Hello！我是张三")
end

# 写文件,会换行
File.open("../files/b2.txt","w") do |f|
  f.puts "Hello！我是张三"
  f.puts "Hello！我是张三"
end

# 写文件
File.open("../files/b3.txt","w") do |f|
  f.print "Hello！我是张三"
  f.print "Hello！我是张三"
end

# 写文件，每次写入一个字符
File.open("../files/b4.txt","w") do |f|
  str = "Hello！我是张三"
  str.each_char {|e|
    f.putc e
  }
end

# 通过IO.write()写入文件
IO.write("../files/b5.txt","通过IO.write()写入文件")