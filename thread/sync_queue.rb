# created by hezhao on 2018-05-20 2:32
# Ruby中，提供三种实现同步的方式，分别是：
# 1. 通过Mutex类实现线程同步
# 2. 监管数据交接的Queue类实现线程同步
# 3. 使用ConditionVariable实现同步控制


# 监管数据交接的Queue类实现线程同步
# Queue类就是表示一个支持线程的队列，能够同步对队列末尾进行访问。不同的线程可以使用统一个对类，但是不用担心这个队列中的数据是否能够同步，另外使用SizedQueue类能够限制队列的长度
# SizedQueue类能够非常便捷的帮助我们开发线程同步的应用程序，应为只要加入到这个队列中，就不用关心线程的同步问题。
# 经典的生产者消费者问题：

require "thread"
puts "SizedQuee Test"

queue = Queue.new

producer = Thread.new do
  10.times do |i|
    sleep rand(i) # 让线程睡眠一段时间
    queue << i
    puts "#{i} produced"
  end
end

consumer = Thread.new do
  10.times do |i|
    value = queue.pop
    sleep rand(i/2)
    puts "consumed #{value}"
  end
end

consumer.join