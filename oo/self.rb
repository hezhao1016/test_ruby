# created by hezhao on 2018-05-19 0:25

# Ruby的 self 和 Java 的 this 有相似之处，但又大不相同。
# Java的方法都是在实例方法中引用，所以this一般都是指向当前对象的。
# 而Ruby的代码逐行执行，所以在不同的上下文(context)self就有了不同的含义

class Box
  # 输出类信息
  puts "Class of self = #{self.class}"
  puts "Name of self = #{self.name}"
end

# 输出：
# Class of self = Class
# Name of self = Box
#
# 这意味着类定义可通过把该类作为当前对象来执行，同时也意味着元类和父类中的该方法在方法定义执行期间是可用的。