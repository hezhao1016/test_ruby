# created by hezhao on 2018-05-17 0:50

# FileTest 提供的查询方法可以让你了解很多关于文件的信息


# 文件是否存在
puts FileTest.exists?("../files/a1.txt")

# 目录？文件？还是快捷方式？
puts FileTest.directory?("../files")
puts FileTest.file?("../files/a.txt")
puts FileTest.symlink?("../files/a.txt")

# 可读？可写？可执行？
puts FileTest.readable?("../files/a.txt")
puts FileTest.writable?("../files/a.txt")
puts FileTest.executable?("../files/a.txt")

# 文件多大？是否为空？
puts FileTest.size("../files/a.txt")
puts FileTest.zero?("../files/a.txt")
puts FileTest.empty?("../files/a.txt")