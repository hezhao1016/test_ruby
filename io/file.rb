# created by hezhao on 2018-05-17 0:50

# 文件操作


# 在打开文件前检查文件是否已存在
File.open("file.rb") if File::exists?("file.rb")

# 是否是文件,返回 true 或false
puts File.file?( "../files/text.txt" )

# 是否是目录,返回 true 或false
puts File.directory?( "../files" )

# 可读？可写？可执行？
puts File.readable?("../files/a.txt")
puts File.writable?("../files/a.txt")
puts File.executable?("../files/a.txt")

# 文件多大？是否为空？
puts File.size("../files/a.txt")
puts File.zero?("../files/a.txt")
puts File.empty?("../files/a.txt")

# 文件类型
# 类型：file、 directory、 characterSpecial、 blockSpecial、 fifo、 link、 socket 或 unknown。
puts File.ftype("../files/a.txt")
puts File.ftype("../")

# 检查文件被创建、修改或最后访问的时间
puts File::ctime( "../files/a.txt" )
puts File::mtime( "../files/a.txt" )
puts File::atime( "../files/a.txt" )


# 重命名文件
if File.exists?("../files/b.txt")
  File.rename("../files/b.txt","../files/c.txt")
end

# 删除文件
if File.exists?("../files/b1.txt")
  File.delete("../files/b1.txt")
end


###### FileUtils 模块
require 'fileutils'
# 复制文件
FileUtils.cp("../files/b3.txt", "../files/b3.txt.bak") if File.exists?("../files/b3.txt")
# 创建目录
FileUtils.mkdir("../files/backup") if !File.exists?("../files/backup")
# 移动文件
puts FileUtils.cp(["../files/b3.txt.bak"], "../files/backup") if File.exists?("../files/backup")
# 展示目录文件
puts Dir["../files/backup/*"]


###### Pathname 类,处理文件路径
puts "--------------------------"
require 'pathname'
path = Pathname.new("D:\\Program Files\\JetBrains\\RubyMine 2017.3.3\\bin\\rubymine64.exe")
puts path
puts path.basename # 文件名
puts path.dirname # 目录部分
puts path.extname # 后缀名
puts "--------------------------"
# 从内到外，遍历
path.ascend do |dir|
  puts "next level up:#{dir}"
end


###### File 处理文件路径
puts "--------------------------"
path = "D:\\Program Files\\JetBrains\\RubyMine 2017.3.3\\bin\\rubymine64.exe"
puts File.basename(path) # 文件名
puts File.dirname(path) # 目录部分
puts File.extname(path) # 后缀名

# 获取绝对路径
puts File.absolute_path("../files/")

# 拼接路径
puts File.join("D:/","Program Files","a.exe")