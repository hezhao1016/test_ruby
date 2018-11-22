# created by hezhao on 2018-05-17 0:50

# 用 Dir 类处理目录

###### 浏览目录
# 改变当前目录
Dir.chdir("../files")

# 查看当前目录
puts Dir.pwd

# 获取目录列表
puts Dir.entries("../files").join(' ')

# 创建目录对象
d = Dir.new("../files")

# 使用实例方法获取目录列表
puts d.entries.join(' ')

# 遍历指定目录内的所有项
Dir.foreach("../files") do |entry|
  print entry , " "
end
print "\n"

# 获取目录列表的一个更简洁的方式
puts Dir["../files/*"]


# 过滤文件
d = Dir.new("../files")
entries = d.entries
# 过滤后缀名为.bak的文件
entries.delete_if {|entry| entry =~ /\.bak$/ }
entries.map! {|entry| File.join(d.path, entry) }
entries.delete_if {|entry| !File.file?(entry) }
print "Total bytes: "
puts entries.inject(0) {|total, entry| total + File.size(entry) }
puts entries.join(" ")
# https://ninghao.net/blog/4097

# 使用 Dir.glob 与 Dir.[ ] 通过指定的通配符模式 过滤匹配的文件名
puts "---------------------------"
puts Dir['../files/*.txt']
# glob 方法可以添加一个或多个标记参数来控制一些行为
puts "---------------------------"
puts Dir.glob("b*")
puts "---------------------------"
puts Dir.glob("B*", File::FNM_CASEFOLD)
puts "---------------------------"
puts Dir.glob("B*", File::FNM_DOTMATCH | File::FNM_CASEFOLD)


###### 创建目录
# Dir.mkdir 可用于创建目录
Dir.mkdir("mynewdir") if !Dir.exists?("mynewdir")

# 可以通过 mkdir 在新目录（不是已存在的目录）上设置权限
# 注意：掩码 755 设置所有者（owner）、所属组（group）、每个人（world [anyone]）的权限为 rwxr-xr-x，其中 r = read 读取，w = write 写入，x = execute 执行。
Dir.mkdir( "mynewdir2", 755 ) if !Dir.exists?("mynewdir2")

# 删除目录
# Dir.delete 可用于删除目录。Dir.unlink 和 Dir.rmdir 执行同样的功能，为我们提供了便利。
Dir.delete("testdir") if Dir.exists?("testdir")



# 创建文件 & 临时目录
# 临时文件是那些在程序执行过程中被简单地创建，但不会永久性存储的信息。
# Dir.tmpdir 提供了当前系统上临时目录的路径，但是该方法默认情况下是不可用的。为了让 Dir.tmpdir 可用，使用必需的 'tmpdir' 是必要的。
# 您可以把 Dir.tmpdir 和 File.join 一起使用，来创建一个独立于平台的临时文件：
require 'tmpdir'
tempfilename = File.join(Dir.tmpdir, "tingtong")
tempfile = File.new(tempfilename, "w")
tempfile.puts "This is a temporary file"
puts tempfile.path
tempfile.close
File.delete(tempfilename)
# 以上这段代码创建了一个临时文件，并向其中写入数据，然后删除文件。


# Ruby 的标准库也包含了一个名为 Tempfile 的库，该库可用于创建临时文件：
require 'tempfile'
f = Tempfile.new('tingtong')
f.puts "Hello"
puts f.path
f.close
