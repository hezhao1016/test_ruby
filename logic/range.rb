# 范围(Range)
# created by hezhao on 2018-05-17 0:09

####### 作为序列的范围
puts "#{(1..5)}"        #==> 1, 2, 3, 4, 5

# 序列 1..100 是一个 Range 对象，包含了两个 Fixnum 对象的引用。可以使用 to_a 方法把范围转换为数组
puts "#{(1..5).to_a}"        #==> 1, 2, 3, 4, 5
puts "#{(1...5).to_a}"       #==> 1, 2, 3, 4
puts "#{('a'..'d').to_a}"    #==> 'a', 'b', 'c', 'd'
puts "#{('bar'..'bat').to_a}"    #==> "bar", "bas", "bat"

# 指定范围
digits = 0..9

puts digits.include?(5)
ret = digits.min
puts "最小值为 #{ret}"

ret = digits.max
puts "最大值为 #{ret}"

ret = digits.reject {|i| i < 5 }
puts "不符合条件的有 #{ret}"

digits.each do |digit|
  puts "在循环中 #{digit}"
end


####### 作为条件的范围
puts "----------------------------"

score = 70
result = case score
         when 0..40
           "糟糕的分数"
         when 41..60
           "快要及格"
         when 61..70
           "及格分数"
         when 71..100
           "良好分数"
         else
           "错误的分数"
         end
puts result


####### 作为间隔的范围
puts "----------------------------"

if ((1..10) === 5)
  puts "5 在 (1..10)"
end

if (('a'..'j') === 'c')
  puts "c 在 ('a'..'j')"
end

if (('a'..'j') === 'z')
  puts "z 在 ('a'..'j')"
end