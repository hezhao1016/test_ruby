# 正则表达式
# created by hezhao on 2018-05-19 16:15

# 定义
reg = /^\w+$/
reg = /^\w+$/im
reg = %r{^\w+$}
reg = %r{^\w+$}im

# 正则表达式修饰符:
# i	当匹配文本时忽略大小写。
# o	只执行一次 #{} 插值，正则表达式在第一次时就进行判断。
# x	忽略空格，允许在整个表达式中放入空白符和注释。
# m	匹配多行，把换行字符识别为正常字符。
# u,e,s,n	把正则表达式解释为 Unicode（UTF-8）、EUC、SJIS 或 ASCII。如果没有指定修饰符，则认为正则表达式使用的是源编码。

line1 = "Cats are smarter than dogs"

# =~ 根据正则表达式匹配 str。返回匹配开始的位置，否则返回 false
if line1 =~ /Cats(.*)/
  puts "Line1 contains Cats"
end

# 搜索和替换
# sub 和 gsub 及它们的替代变量 sub! 和 gsub! 是使用正则表达式时重要的字符串方法。 这些方法都是使用正则表达式模式执行搜索与替换操作。
# sub 和 sub! 替换模式的第一次出现，gsub 和 gsub! 替换模式的所有出现。
# sub 和 gsub 返回一个新的字符串，保持原始的字符串不被修改，而 sub! 和 gsub! 则会修改它们调用的字符串。
phone = "138-3453-1111 #这是一个电话号码"
# 删除 Ruby 的注释
phone = phone.sub!(/#.*$/, "")
puts "电话号码 : #{phone}"
# 移除数字以外的其他字符
phone = phone.gsub!(/\D/, "")
puts "电话号码 : #{phone}"

text = "rails 是 rails,  Ruby on Rails 非常好的 Ruby 框架"
# 把所有的 "rails" 改为 "Rails"
text.gsub!("rails", "Rails")
# 把所有的单词 "Rails" 都改成首字母大写
text.gsub!(/\brails\b/, "Rails")
puts "#{text}"