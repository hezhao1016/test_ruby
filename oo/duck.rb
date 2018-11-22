# created by hezhao on 2018-05-19 1:53
# 鸭子类型
# - 对于静态语言（例如Java）来说，如果需要传入Student类型，则传入的对象必须是Student类型或者它的子类，否则，将无法调用run()方法。
# - 对于Ruby这样的动态语言来说，则不一定需要传入Student类型。我们只需要保证传入的对象有一个run()方法就可以了
# - 动态语言的“鸭子类型”，它并不要求严格的继承体系，一个对象只要“看起来像鸭子，走起路来像鸭子”，那它就可以被看做是鸭子。

class Student
  attr_accessor :age, :name

  def initialize(name,age)
    @name = name
    @age = age
  end
end

class Teacher
  attr_accessor :age, :name

  def initialize(name,age)
    @name = name
    @age = age
  end
end

def invoke(stu)
  puts "name:#{stu.name} age:#{stu.age}"
end

invoke Student.new "张三", 22
invoke Teacher.new "李老师", 18