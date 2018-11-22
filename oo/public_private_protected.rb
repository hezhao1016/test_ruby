# created by hezhao on 2018-05-18 17:37
# 访问控制
# Ruby 提供了三个级别的实例方法保护，分别是 public、private 或 protected。Ruby 不在实例和类变量上应用任何访问控制。
# Public 方法： Public 方法可被任意对象调用。默认情况下，方法都是 public 的，除了 initialize 方法总是 private 的。
# Private 方法： Private 方法不能从类外部访问或查看。只有类方法可以访问私有成员。
# Protected 方法： Protected 方法只能被类及其子类的对象调用。访问也只能在类及其子类内部进行

class Box
  # 构造器方法 private
  def initialize(w,h)
    @width, @height = w, h
  end

  # 实例方法默认是 public 的
  def getArea
    getWidth() * getHeight
  end

  # 定义 private 的访问器方法
  def getWidth
    @width
  end
  def getHeight
    @height
  end

  # 用于输出面积的实例方法
  def printArea
    @area = getWidth() * getHeight
    puts "Big box area is : #@area"
  end

  # 设置 private
  private :getWidth, :getHeight

  # 设置 protected
  protected :printArea

  # 设置 public
  public :getWidth
end

# 创建对象
box = Box.new(10, 20)

# 调用实例方法
a = box.getArea()
puts "Area of the box is : #{a}"

# 尝试调用 protected方法
# puts box.printArea()

# 尝试调用 getWidth方法
puts box.getWidth()