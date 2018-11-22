# created by hezhao on 2018-05-12 13:38

# Ruby 程序中的空白
# 在 Ruby 代码中的空白字符，如空格和制表符一般会被忽略，除非当它们出现在字符串中时才不会被忽略。然而，有时候它们用于解释模棱两可的语句。当启用 -w 选项时，这种解释会产生警告。
# 实例：
# a + b 被解释为 a+b （这是一个局部变量）
# a  +b 被解释为 a(+b) （这是一个方法调用）

# Ruby 程序中的行尾
# Ruby 把分号和换行符解释为语句的结尾。但是，如果 Ruby 在行尾遇到运算符，比如 +、- 或反斜杠，它们表示一个语句的延续。

# Ruby 标识符
# 标识符是变量、常量和方法的名称。Ruby 标识符是大小写敏感的。这意味着 Ram 和 RAM 在 Ruby 中是两个不同的标识符。
# Ruby 标识符的名称可以包含字母、数字和下划线字符（ _ ）。

# Ruby 中的 Here Document
# "Here Document" 是指建立多行字符串。在 << 之后，您可以指定一个字符串或标识符来终止字符串，且当前行之后直到终止符为止的所有行是字符串的值。
# 如果终止符用引号括起，引号的类型决定了面向行的字符串类型。请注意<< 和终止符之间必须没有空格。
# 下面是不同的实例：

print <<EOF
    这是第一种方式创建here document 。
    多行字符串。
EOF

print <<"EOF"                # 与上面相同
    这是第二种方式创建here document 。
    多行字符串。
EOF

print <<`EOC`                 # 执行命令
    echo hi there
EOC

print <<"foo", <<"bar"          # 您可以把它们进行堆叠
    I said foo.
foo
I said bar.
bar


# Ruby BEGIN 语句
BEGIN{
  puts "初始化程序...\n\n"
}

# Ruby END 语句
END{
  puts "\n停止程序..."
}

# 输出语句 不换行
print "Hello", " hello" # 逗号分隔，输出多个参数
print (",你好\n") # 带括号的不可以写多个

# 输出语句 换行
puts 'Hello,Ruby!'
puts "parm1" , 1 # 逗号分隔，输出多个参数,每个参数都会换行
puts("Hello,World!")


# Ruby 单行注释

=begin
嵌入式文档注释
类似Java中的/* */
=end