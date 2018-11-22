# 字符串
# created by hezhao on 2018-05-15 19:21

# 字符编码
# Ruby 的默认字符集是 ASCII，字符可用单个字节表示。如果您使用 UTF-8 或其他现代的字符集，字符可能是用一个到四个字节表示。
# 可以在程序开头使用 $KCODE 改变字符集
# a	ASCII （与 none 相同） 默认
# e	EUC
# n	None （与 ASCII 相同）
# u	UTF-8
$KCODE = 'u'


# 字符串分为单引号字符串（'）和双引号字符串（"），区别在于双引号字符串能够支持更多的转义字符。

puts '这是一个 Ruby 程序的字符串'
puts 'Won\'t you read O\'Reilly\'s book?'
puts 'C:\\xxx\\a.txt'


# 字符串中嵌入变量
name1 = "Joe"
name2 = "Mary"
puts "你好 #{name1},  #{name2} 在哪?"


# 字符串中进行数学运算
x, y, z = 12, 36, 72
puts "x 的值为 #{ x }"
puts "x + y 的值为 #{ x + y }"
puts "x + y + z 的平均值为 #{ (x + y + z)/3 }"


# Ruby 中还支持一种采用 %q 和 %Q 来引导的字符串变量，%q 使用的是单引号引用规则，而 %Q 是双引号引用规则，后面再接一个 (! [ { 等等的开始界定符和与 } ] ) 等等的末尾界定符。
# 跟在 q 或 Q 后面的字符是分界符.分界符可以是任意一个非字母数字的单字节字符.如:[,{,(,<,!等,字符串会一直读取到发现相匹配的结束符为止.
puts %Q{1 + 2 的值为 #{ 1 + 2 }}
puts %q[1 + 2 的值为 #{ 1 + 2 }]


# 字符串内建方法
myStr = String.new("THIS IS TEST")
foo = myStr.downcase
puts "#{foo}"


puts '----------------------------'
str = "abc"
puts str * 2 # 重复2次
puts str + " def" # 拼接
puts str << " - " << 90 # 拼接,会改变str的值，如果拼接的是0-255数字会转换成字符

str = "abcDeFgHijKlmN"
puts str <=> "abc" # 比较，返回 -1（小于）、0（等于）或 1（大于）。比较是区分大小写的
puts str == "abc" # 比较
puts str.eql?("abc") # 比较

puts str.casecmp("ABC") # 不区分大小写的字符串比较

# 是否包含子串
puts str.include?("b")

puts str =~ /^\w+$/ # 根据正则表达式匹配 str。返回匹配开始的位置，否则返回 false
puts str =~ %r{^\w+$} # 语法近似于%Q, 用于正则表达式.

puts str.size # 长度
puts str.length # 长度

puts str.empty? # 是否为空

# 使用索引截取子串,注意返回的是ASCII码而不是字符
puts '----------------------------'
puts str[3]
puts str[0, 5]
puts str[2, 5]
puts str[2..5]
puts str[2...5]

puts '-----------------------------'
# 第一次出现该字符的索引
puts str.index("D")
# 最后一次出现该字符的索引
puts str.rindex("D")

puts '----------------------------'
puts str.upcase # 转为大写字母
puts str.upcase! # 转为大写字母,str 会发生变化并返回
puts str.downcase # 转为小写字母
puts str.downcase! # 转为小写字母,str 会发生变化并返回
puts str.capitalize # 把字符串首字母转换为大写字母显示
puts str.capitalize! # 把字符串首字母转换为大写字母显示,str 会发生变化并返回
puts '----------------------------'

puts "  s d  ".strip # 返回移除前后空格的副本
puts "  s d  ".strip! # 移除前后空格
puts "  s d  ".lstrip # 返回移除前空格的副本
puts "  s d  ".lstrip! # 移除前空格
puts "  s d  ".rstrip # 返回移除后空格的副本
puts "  s d  ".rstrip! # 移除后空格
puts str.center(20) # 居中字符串

print "a,b,c,d".split(",")







