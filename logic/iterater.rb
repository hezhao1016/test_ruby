# created by hezhao on 2018-05-17 0:24

# 迭代(iterate)指的是重复做相同的事，所以迭代器(iterator)就是用来重复多次相同的事。

# each迭代器 遍历数组
ary = [1, 2, 3, 4, 5]
ary.each { |i|
  print i, ","
}
print "\n"

# each 遍历哈希
sum = 0
cutcome = {"block1" => 1000, "book2" => 1000, "book3" => 4000}
cutcome.each{|k, v| sum += v}
puts "sum = " + sum.to_s # 数字转为字符串


# collect/map迭代器 将传入的块依次作用到数组的每个元素
a = [1,2,3,4,5]
b = Array.new
b = a.collect{ |x| x ** 2}
puts "#{b}"
