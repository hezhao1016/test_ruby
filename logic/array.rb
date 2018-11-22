# created by hezhao on 2018-05-16 08:57

# 数组
# 数组字面量通过[]中以逗号分隔定义，且支持range定义。
# （1）数组通过[]索引访问
# （2）通过赋值操作插入、删除、替换元素
# （3）通过+，－号进行合并和删除元素，且集合做为新集合出现
# （4）通过<<号向原数据追加元素
# （5）通过*号重复数组元素
# （6）通过｜和&符号做并集和交集操作（注意顺序）
#
# Ruby 数组不需要指定大小，当向数组添加元素时，Ruby 数组会自动增长。
# 索引 -1 表示数组的最后一个元素


# 通过 new 类方法创建数组
names = Array.new
puts "#{names}"

# 创建数组的同时设置数组的大小
names = Array.new(20)
puts names.size  # 返回 20
puts names.length # 返回 20


names = Array.new(4, "mac") # 填充4个mac
puts "#{names}"


# 每个元素使用块中的计算结果来填充
nums = Array.new(10) {|e| e*=2}
puts "#{nums}"

# 数组还有另一种方法，[]
nums = Array.[](1, 2, 3, 4, 5)
puts "#{nums}"

# 数组创建的另一种形式
nums = Array[1, 2, 3, 4, 5]
puts "#{nums}"

# 使用[]创建
nums = [1, 2, 3, 4, 5]
puts "#{nums}"

# 使用range创建
digits = Array(0..9)
puts "#{digits}"


# 数组操作
puts "-------------------------------------------"
strs = ["tom","jack","bob","frank","jason"]

# 获取某个下标的元素
puts strs[2]
puts strs[-1] # 返回最后一个元素
puts strs.last() # 返回最后一个元素
puts strs.first() # 返回第一个元素
puts strs.at(2)
puts strs.slice(2)

# 返回从 start 开始直至 length 个元素的子数组
puts "#{strs[1,3]}"
puts "#{strs.slice(1,3)}"

# 返回 range 指定的子数组
puts "#{strs[1..3]}"
puts "#{strs.slice(1..3)}"


puts "-------------------------------------------"
# 给元素赋值
strs[-1] = "BenJim"
puts "#{strs}"

# 替换从 start 开始直至 length 个元素的子数组
strs[1,2] = ["apache"]
puts "#{strs}"
strs[1,2] = ["http","struts"]
puts "#{strs}"

# 替换 range 指定的子数组。如果索引大于数组的当前容量，那么数组会自动增长
strs[3..4] = ["java"]
puts "#{strs}"
strs[3..4] = ["python","php"]
puts "#{strs}"


puts "-------------------------------------------"
# 并集 包含两个数组中共同的元素，没有重复。
temp = strs & ["tom","jack","bob"]
puts "#{temp}"

# 交集 通过把 other_array 加入 array 中，移除重复项，返回一个新的数组。
temp = strs | ["tom","张三","李四"]
puts "#{temp}"

# 返回一个新的数组，新数组 * n。带有 String 参数时，相当于 self.join(str)。
temp = strs * 2
puts "#{temp}"
temp = strs * ","
puts "#{temp}"

# 连接两个数组
temp = strs + ["张三","李四"]
puts "#{temp}"

# 从数组中移除了某些元素
temp = strs - ["struts","php"]
puts "#{temp}"

# 把 array 与 other_array 进行比较，返回 -1（小于）、0（等于）或 1（大于）。比较是区分大小写的
puts strs <=> temp

# 如果两个数组包含相同的元素个数，且每个元素与另一个数组中相对应的元素相等（根据 Object.==），那么这两个数组相等。
puts strs == ["tom", "http", "struts", "python", "php"]

puts strs.eql? ["tom", "http", "struts", "python", "php"]

# 把给定的对象附加到数组的末尾。该表达式返回数组本身，所以几个附加可以连在一起。
strs << "李鬼" << "李逵"
puts "#{strs}"

# 追加元素到结尾
strs.push("push")
puts "#{strs}"

# 指定位置插入元素
strs.insert(-1,"last")
puts "#{strs}"



# 函数式编程
puts "-------------------------------------------"
# map或collect将传入的块依次作用到数组的每个元素
nums = Array(1..10)
temp = nums.collect {|e| e*2}
puts "#{temp}"

temp = nums.map {|e| e**2}
puts "#{temp}"

# reduce把一个块作用在一个数组上，这个块必须接收两个参数，reduce把结果继续和数组的下一个元素做累积计算
temp = nums.reduce {|x,y| x+y}
puts "#{temp}"



puts "-------------------------------------------"
strs.append(nil)

# 复制数组
temp = strs.clone
puts "#{temp}"

# 返回 数组 的副本，移除了所有的 nil 元素
temp = strs.compact
puts "#{temp}"

# 从数组中移除所有的 nil 元素。如果没有变化则返回 nil。
strs.compact!
puts "#{strs}"

# 返回 数组 中第一个等于 obj 的 index。如果未找到匹配则返回 nil
puts strs.index("struts")

# 返回 数组 中最后一个等于 obj 的 index。如果未找到匹配则返回 nil
puts strs.rindex("struts")

# 是否包含某一元素，包含则返回 true，否则返回 false
puts strs.include?("struts")

# 用指定分隔符拼接成字符串
puts strs.join(",")


puts "-------------------------------------------"
strs.delete("push") # 删除元素
strs.delete_at(-1) # 根据下标删除元素
strs.delete_if {|item| item == "李鬼"} # 当 block 为 true 时，删除元素
strs.pop # 移除最后一个元素


# for 循环遍历数组
for item in strs
  print item , " "
end
print "\n"

# 遍历 元素
strs.each do |item|
  print item , " "
end
print "\n"

strs.each {|item| print item , " " }
print "\n"

# 遍历 下标
strs.each_index {|i| print i, "-", strs[i] , " " }
print "\n"

# 倒序遍历元素
strs.reverse_each {|item| print item , " " }
print "\n"

# 反转数组
strs.reverse!
puts "#{strs}"

# 排序，不改变原数组
temp = strs.sort
puts "#{temp}"

# 指定排序条件，并且改变原数组
nums = [1,23,4,7,8,5,8]
nums.sort! {|a, b| a <=> b}
puts "#{nums}"

# 根据指定条件过滤数组,返回条件为true的相应元素
temp = nums.select {|e| e.even?}
puts "#{temp}"

# 根据指定条件过滤数组,返回条件为false的相应元素
temp = nums.reject {|e| e.even?}
puts "#{temp}"

# 去除重复元素
nums.uniq!
puts "#{nums}"

# 移除所有元素
strs.clear

# 是否为空
puts strs.empty?



puts "-------------------------------------------"
# %W 语法近似于%Q, 用于表示其中元素被双引号括起的数组
foo = "abc"
a = %W{#{foo} Bar Bar\ with\ space}
puts "#{a}"

# %w 用于表示其中元素被单引号括起的数组. 比较奇怪的是\(斜杠空格)会被转化成(空格), 但是其他的内容不会
a = %w{a b c\ d \#e #{1}f}
puts "#{a}"