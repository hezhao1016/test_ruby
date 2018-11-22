# created by hezhao on 2018-05-19 0:25

# 打开类
# Ruby令我印象最深刻的特性就是打开类，这也可能是最容易运用的元编程特性。
# 在Ruby中，class关键字并不像大多数语言那样表示定义一个类，而表示打开一个类。
# 类就像一个盒子，class关键字就像是打开盒子的钥匙，你可以随时随地用"class <class_name> ... end"来打开这个盒子，在盒子的内部运行代码、定义函数等。
# 所谓在“盒子的内部”，严格地讲就是当前对象(self)就是打开的这个类，当前类也就是打开的这个类。
#
# 当然，在第一次提及class A时，还没有一个名为A的类存在，这时Ruby首先会帮我们定义好这个类A，之后就只需要打开它了。
# 所以，Ruby中不会出现“重复定义一个类”的错误。那么，打开类有什么作用呢？你可以重新打开已经存在的类对其进行动态修改，
# 更为神奇的是，你不仅可以打开自己定义的类，还可以打开别人定义的类，甚至Ruby自己定义的类。所有盒子对你来说都是公开的，
#
# 你可以非常方便地扩充String的功能：
class String
  def hello
    "Hello, " + self
  end
end
# 上述代码为String类添加了一个hello方法，从此任何字符串都可以调用这个hello方法。例如，运行代码：
puts "World".hello


# 内核方法(Kernel Method)
# Object类是Ruby中绝大部分类的基类（除了一些类继承自BasicObject），所以，在Object类中添加的方法能够在任何对象上调用。
# 不过，当我们想定义一些任何对象都能调用的通用方法时，通常不直接直接在Object类中添加代码，而是在Kernel模块中修改。
# 由于Object类包含了Kernel模块，因此Kernel就进入了每个对象的祖先链，任何对象都可以调用Kernel模块的方法，这些方法称为内核方法(Kernel Method)。
# 例如，我可以打开Kernel模块，来添加一个内核方法:
module Kernel
  def fuck(someone)
    puts "Fuck you, #{someone}"
  end
end
# fuck方法用来输出一段常用语，帮助你发泄情绪。比如，当你写代码时使用到Ruby的某个非常好用的语法或技巧时，十分想嘲讽别的语言，就可以调用fuck方法：
x ||=1  # Ruby的空指针保护语法
fuck 'python'
# fuck就像是一个关键字，就像puts一样可以在任何地方调用。实际上puts方法也是在Kernel模块中定义的内核方法。
