# created by hezhao on 2018-05-16 17:27

# 哈希（Hash）是类似 "key" => "value" 这样的键值对集合（类似于Java Map）。哈希类似于一个哈希，只不过它的索引不局限于使用数字。
# Hash 的索引（或者叫"键"）几乎可以是任何对象。
# Hash 无序


# 通过 new 类方法创建一个空的哈希
h  = Hash.new
puts "#{h}"

# 使用 new 创建带有默认值的哈希
# 当访问带有默认值的哈希中的任意键时，如果键或值不存在，访问哈希将返回默认值
h = Hash.new("Go Fish")
h["a"] = 100
h["b"] = 200
puts h["a"]         #=> 100
puts h["c"]         #=> "Go Fish"
puts "#{h.keys}"    #=> ["a", "b"]


# 每个元素使用块中的计算结果来填充
h = Hash.new { |hash, key| hash[key] = "Go Fish: #{key}" }
puts h["c"]         #=> "Go Fish: c"
puts h["d"]         #=> "Go Fish: d"


# 哈希创建的另一种形式
h = Hash["a" => 100, "b" => 200]
puts "#{h['a']}"

# 使用{}创建
h = {"a" => 100, "b" => 200}
puts "#{h}"

# 另一种写法
h = {:a => 100, :b => 200}
puts "#{h}"

# 再另一种写法， 注意键名后面需要紧连着冒号，不能留空格
h = {a: 100, b: 200}
puts "#{h}"

# 以上三种写法完全等价



# 可以使用任何的 Ruby 对象作为键或值，甚至可以使用数组
h = {
    [1,"jan"] => "January",
    1 => 1.0,
    "name" => "jack",
    2.0 => 2,
    true => "True"
}
puts "#{h}"


# 获取哈希大小
puts h.size
puts h.length



# 哈希操作
puts "-------------------------------------------"
h = {
    "name" => "张三",
    "age" => "28",
    "high" => "175cm",
    "weight" => "70kg",
    "area" => "深圳",
    "job" => "程序员",
}

# 获取某个元素
puts h["name"]

# 给元素赋值
h["phone"] = "小米Note2"
puts "#{h}"

# 返回一个新的哈希，包含 hash 和 other_hash 的内容，重写 hash 中与 other_hash 带有重复键的键值对。
h.merge({ "name" => "bob", "age" => "28", "job" => "程序员"})

# 如果两个哈希包含相同的元素个数，且每个元素与另一个哈希中相对应的元素相等（根据 Object.==），那么这两个哈希相等。
puts h == {"name"=>"bob", "age"=>"28", "high"=>"175cm", "weight"=>"70kg", "area"=>"深圳", "job"=>"程序员", "phone"=>"小米Note2"}


puts "-------------------------------------------"
# 返回 哈希 的副本，移除了所有的 nil 元素
temp = h.compact
puts "#{temp}"

# 从哈希中移除所有的 nil 元素。如果没有变化则返回 nil。
h.compact!
puts "#{h}"

# 是否包含某一元素，包含则返回 true，否则返回 false
puts h.include?("name")


puts "-------------------------------------------"
h.delete("area") # 删除元素
h.delete_if {|key,value| value == "深圳"} # 当 block 为 true 时，删除元素


# for 循环遍历
for key,value in h
  print key , "=>", value,", "
end
print "\n"

# 遍历 元素
h.each do |key,value|
  print key , "=>", value,", "
end
print "\n"

h.each {|key,value| print key , "=>", value,", " }
print "\n"

# 遍历 键
h.each_key {|key| print key, "=>", h[key] , ", " }
print "\n"

# 遍历 值
h.each_value {|value| print value, ", " }
print "\n"

# 倒序遍历元素
h.reverse_each {|key,value| print key , "=>", value,", " }
print "\n"

# 根据指定条件过滤哈希
temp = h.select {|key,value| key>"h"}
puts "#{temp}"

# 把 hash 转换为一个包含键值对数组的二维数组，然后进行排序
arr = h.sort
puts "#{arr}"

# 移除所有元素
h.clear

# 是否为空
puts h.empty?



puts "-------------------------------------------"
h = { "a" => 100, "b" => 200, "c" => 300, "d" => 300 }

# 所有键的集合
puts "#{h.keys}"   #=> ["a", "b", "c", "d"]
# 所有值的集合
puts "#{h.values}"   #=> [100, 200, 300]

# 根据值取出键
puts h.key(200)   #=> "b"
puts h.key(999)   #=> nil

# 是否存在键
puts h.key?("a")   #=> true
puts h.key?("z")   #=> false
puts h.has_key?("a")   #=> true
puts h.has_key?("z")   #=> false

# 是否存在值
puts h.has_value?(100)   #=> true
puts h.has_value?(999)   #=> false
puts h.value?(100)   #=> true
puts h.value?(999)   #=> false

# 根据一组键取出一组值
h = { "cat" => "feline", "dog" => "canine", "cow" => "bovine" }
puts "#{ h.values_at("cow", "cat") }" #=> ["bovine", "feline"]
