# created by hezhao on 2018-05-18 15:42
# 对象属性的定义
# Ruby中的封装是强制性的，实例变量无法直接为对象外使用，只能通过对象定义的操作方法访问。同理，实例变量也不能变成public变量，同样是通过方法访问。
# Ruby通过定义方法来访问属性。有两种方式:

# 1.访问器(getter) & 设置器(setter)
class Person

  def initialize(name,age)
    @name = name
    @age = age
  end

  # getter
  def name
    @name
  end
  #setter
  def name=(name)
    @name = name
  end

  def age
    @age
  end
  def age=(age)
    @age = age
  end

end

p = Person.new("张三",28)
puts p.name
puts p.age

p.name = "李四"
p.age = 22
puts p.name
puts p.age



# 2.通过Module的方法定义
# 该声明不是Ruby语法的一部分，而是Module模块的方法，该方法会自动创建访问类属性的方法
# 注意：变量名前一定要带 :
# 定义：
# class name
#   attr: attribute[,writable]
#   attr_reader :attribute[,attribute,......]
#   attr_wirter :attribute[,attribute,......]
#   attr_accessor :attribute[,attribute,......]
# end

class Car
  # attr ：直接定义属性，默认只读，如果后面跟true，表示属性可写，false为只读
  attr :brand
  attr :carNo, true

  # attr_reader: 只读属性,该方法会自动创建一个访问器方法
  attr_reader :carType

  # attr_writer: 表示属性只写。它只创建修改属性的方法。不能从外部访问该属性
  attr_writer :driverName, :price # 一行可写多个

  # attr_accessor: 表示属性既可以读，也可以写
  attr_accessor :onTime

  def initialize(brand,carNo,carType,driverName,price,onTime)
    @brand = brand
    @carNo = carNo
    @carType = carType
    @driverName = driverName
    @price = price
    @onTime = onTime
  end

  # 重写to_s方法，类似于Java toString，返回对象的字符串格式
  def to_s
    <<EOF
{
  brand:#{@brand}
  carNo:#{@carNo},
  carType:#{@carType},
  driverName:#{@driverName},
  price:#{@price},
  onTime:#{@onTime.strftime("%Y-%m-%d %H:%M:%S")},
}
EOF
  end
end

puts "-------------------------"
require 'date'
c = Car.new("宝马","粤B-88888","SUV","张三","55万",Time.now)
puts c.brand
puts c.carNo
puts c.carType
puts c.onTime.strftime("%Y-%m-%d %H:%M:%S")

c.driverName = "李四"
c.onTime = DateTime.parse("2012-05-05 12:12:12")
puts c