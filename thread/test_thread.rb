# created by hezhao on 2018-05-20 2:29
# 多线程

# 要启动一个新的线程，只需要调用 Thread.new 即可:
# # 线程 #1 代码部分...
# Thread.new {
#  # 线程 #2 执行代码...
# }
# # 线程 #1 执行代码...

def func1
  i=0
  while i<=2
    puts "func1 at: #{Time.now}"
    sleep(2)
    i=i+1
  end
end

def func2
  j=0
  while j<=2
    puts "func2 at: #{Time.now}"
    sleep(1)
    j=j+1
  end
end

puts "Started At #{Time.now}"
t1=Thread.new{func1()}
t2=Thread.new{func2()}
t1.join
t2.join
puts "End at #{Time.now}"
