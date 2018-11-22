# 类和对象
# Ruby 是纯面向对象的语言，Ruby 中的一切都是以对象的形式出现。
# Ruby 中的每个值都是一个对象，即使是最原始的东西：字符串、数字，甚至连 true 和 false 都是对象。
# created by hezhao on 2018-05-15 08:40

# 类名必须以大写字母开头，如果包含多个单词，每个单词首字母大写，但此间没有分隔符
class Customer
  # 类变量，相当于Java中的静态变量，必须在使用之前初始化
  @@no_of_customers=0

  # 实例变量
  @msg = ''

  # 常量
  INFO = "我是常量"

  # 构造函数
  # initialize方法是一个特殊的方法，这个方法在构造实例对象时会被自动调用
  def initialize(id, name, addr)
    @cust_id = id
    @cust_name = name
    @cust_addr = addr
  end

  # 实例方法,没有参数可以省略括号
  def display_details
      puts "Customer id #@cust_id"
      puts "Customer name #@cust_name"
      puts "Customer address #@cust_addr"
  end

  # 带参方法
  def hello(msg)
    puts "Hello #{msg}"
  end

  def total_no_of_customers()
    @@no_of_customers += 1
    puts "Total number of customers: #@@no_of_customers"
  end

  # 类方法，类似于Java静态方法，可以使用 类名.方法名 或 self.方法名 定义
  # def Customer.show
  def self.show
    puts "我是类方法! INFO=#{INFO} , no_of_customers is #@@no_of_customers"
  end
end


# 创建对象
# 方法 new 是一种独特的方法，在 Ruby 库中预定义。new 方法属于类方法
# cust1 = Customer.new
cust2 = Customer.new(1,"Tom","Shenzhen")

# 调用方法
# 调用时，没有参数可以省略括号
cust2.display_details

cust2.hello("Horace")
# 调用有参方法，可以不带括号
cust2.hello "Horace2"

cust2.total_no_of_customers

cust3 = Customer.new(2,"Tom2","Shenzhen")
cust3.total_no_of_customers

# 通过类名调用类方法
Customer.show

# 使用::获取常量
puts Customer::INFO



# 一、实例变量
# Ruby规定实例变量是以@开头，后跟一个名字。对实例变量的访问注意
#   a、在类内部可以对其赋值和读取没有限制
#   b、类外不能直接访问对象的实例变量，只能通过方法访问。正如上面所说的属性访问方式一样。
#   c、实例变量在使用前不用必须初始化。
#
# 二、类变量
# Ruby规定类变量是以两个@@开头，后跟一个名字。对于一个给定的类而言，类变量只存在一份拷贝。
# 注意：
#   1、类变量必须在使用之前初始化。
#   2、类变量是私有的。要想能从类外部访问，必须定义方法访问。这个方法是一个实例方法，要么是一个类方法。
#   3、通常类变量属于包含该变量的最内层的类或模块。但是，可以为被定义该变量的类的所有子类所共享
#
# 三、类常量
# Ruby 的常量也是对对象的引用，常量通常在第一次被赋值的时候创建(通常是在类或模块中定义)。和其他语言不一样，
# Ruby允许改变常量的值，因为常量是对对象的引用，通过改变常量的值，可以改变它所引用的对象的内部状态。
#   1、在类或模块中的任何位置都可以直接访问该类或模块中定义的常量。
#   2、在类或模块外，可以通过在域作用符：：前加上一个返回适当类或模块对象的表达式来访问。
#   3、对于不属于任何类或模块的常量，可以直接访问或使用不带前缀的域作用符来访问
#   4、通过在常量名之前使用类或模块名和域作用符，还可以将常量从外面添加到已存在的类或模块中。
# 注意：
#   1、类名本身就是常量。这就意味着可以把类和其他Ruby对象一样对待：可以拷贝它们；将它们作为参数传入方法；或者在表达式中使用它们
#   2、如果一个无名的类赋值给了一个常量。Ruby将常量作为类名。
#
# 四、方法
# 1、实例方法
# 实例方法的定义就是通常的方法定义。其作用域就是每个特定的对象。用于访问该对象的内部状态和行为。
# 实例方法的定义是保存在对象所属类对象的定义中。如果没有，就到类对象的父类对象中查找。依次类推
# 2、类方法
# 在方法名前放置类名或self以及一个点，来定义类方法
# 类方法的定义是保存在类对象的虚拟类中。当调用类方法时，是到虚拟的类中寻找。如果没有，就到虚拟类的父类中查找。依次类推。
# 如果在类方法访问实例变量，将会得到nil