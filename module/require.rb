# created by hezhao on 2018-05-15 18:08

# 指明在当前目录中搜索被引用的文件
$LOAD_PATH << '.'

# 加载Ruby文件,可以省略扩展名.rb
require 'trig'

# 相对路径引用
# require_relative 'trig'


puts Trig.perimeter 4
puts Trig.area 4
puts Trig::PI