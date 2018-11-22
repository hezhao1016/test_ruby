# 循环
# created by hezhao on 2018-05-12 19:40

# while 语句
# 语法
# while conditional [do]
#   code
# end
# 当 conditional 为真时，执行 code。
# 语法中 do 可以省略不写。但若要在一行内写出 while 式，则必须以 do 隔开条件式或程式区块

$i = 0
$num = 5

# while $i < $num do
while $i < $num
  puts "循环 i = #$i"
  $i += 1
end

puts "-----------------while 语句-----------------------"
$i = 0
$num = 5
while $i < $num do  puts "循环 i = #{$i+=1}" end


# while 修饰符
# code while condition
# 或者
# begin
#   code
# end while conditional
# 当 conditional 为真时，执行 code。
# 如果 while 修饰符跟在一个没有 rescue 或 ensure 子句的 begin 语句后面，code 会在 conditional 判断之前执行一次。

puts "------------------while 修饰符----------------------"
$i = 0
$num = 5
begin
  puts "在循环语句中 i = #$i"
  $i += 1
end while $i < $num


puts "------------------while 修饰符 2----------------------"
$i = 0
$num = 5
puts "在循环语句中 i = #{$i+=1}" while $i < $num



# until 语句 和 while 相反，条件为false时执行
puts "-----------------until 语句-----------------------"
$i = 0
$num = 5

until $i > $num  do
  puts("在循环语句中 i = #$i" )
  $i +=1;
end


# until 修饰符
puts "-----------------until 修饰符-----------------------"
$i = 0
$num = 5
begin
  puts("在循环语句中 i = #$i" )
  $i +=1;
end until $i > $num



# for
puts "-----------------for-----------------------"
# for i in 0..5 do
for i in 0..5
  puts "for > #{i}"
end

# 等价于

puts "-----------------each do end-----------------------"
(0..5).each do |i|
  puts "each > #{i}"
end

# 等价于

puts "-----------------each 块-----------------------"
(0..5).each { |i| puts "each > #{i}" }



# 语法中 do 可以省略不写。但若要在一行内写出 for 式，则必须以 do 隔开条件式或程式区块
puts "-----------------for_row-----------------------"
for i in 0..5 do puts "for_row > #{i}" end



# break 语句
# 终止最内部的循环。如果在块内调用，则终止相关块的方法（方法返回 nil）
for i in 0..5
  if i > 2
    break
  end
  puts "局部变量的值为 #{i}"
end


# next 语句
# 跳到循环的下一个迭代。如果在块内调用，则终止块的执行（yield 表达式返回 nil）
puts "----------------------------------"
for i in 0..5
  unless i >= 2
    next # 相当于Java 的 continue
  end
  puts "局部变量的值为 #{i}"
end


# redo 语句
# 重新开始最内部循环的该次迭代，不检查循环条件。如果在块内调用，则重新开始 yield 或 call
puts "----------------redo------------------"
for i in 0..5
  if i < 2 then
    puts "局部变量的值为 #{i}"
    # redo # 无限循环
  end
end
