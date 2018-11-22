# 奇淫巧技
# https://www.zhihu.com/question/38422241?sort=created

# 首字母大写
ary = %w(java python ruby).map &:capitalize
puts "#{ary}"

# 数组转hash
fruit = ["sky", "blue", "mountain", "green"]
ary = Hash[*fruit]
puts "#{ary}"

# 两个数组合并成hash
a = [:x, :y]
b = [12, 34]
ary = Hash[a.zip(b)]
puts "#{ary}"

# 转为2进制
str = 1234567890.to_s(2)
puts str

# 动态生成方法
POSSIBLE_VERBS = ['get', 'put', 'post', 'delete']
POSSIBLE_VERBS.each do |m|
  eval <<-end_eval
    def #{m}(path, *args, &b)
      puts "[#{m.upcase}] 你输入的地址是：\#{path}"
    end
  end_eval
end
get("www.baidu.com")
put("www.sina.com")
post("www.sohu.com")
delete("www.qq.com")

# AI abe with Class String
module StringWithAbe
  refine String do
    def length
      super > 10 ? 'long' : 'short'
    end
  end
end
using StringWithAbe
puts "Short question ABC".length  # => "long"