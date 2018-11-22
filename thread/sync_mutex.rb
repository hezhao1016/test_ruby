# created by hezhao on 2018-05-20 2:32
# Ruby中，提供三种实现同步的方式，分别是：
# 1. 通过Mutex类实现线程同步
# 2. 监管数据交接的Queue类实现线程同步
# 3. 使用ConditionVariable实现同步控制


# 通过Mutex类实现线程同步控制，如果在多个线程钟同时需要一个程序变量，可以将这个变量部分使用lock锁定。 代码如下：

require "thread"
puts "Synchronize Thread"

@num=200
@mutex=Mutex.new

def buyTicket(num)
  @mutex.lock
  if @num>=num
    @num=@num-num
    puts "you have successfully bought #{num} tickets"
  else
    puts "sorry,no enough tickets"
  end
  @mutex.unlock
end

ticket1=Thread.new 10 do
  10.times do |value|
    ticketNum=15
    buyTicket(ticketNum)
    sleep 0.01
  end
end

ticket2=Thread.new 10 do
  10.times do |value|
    ticketNum=20
    buyTicket(ticketNum)
    sleep 0.01
  end
end

sleep 1
ticket1.join
ticket2.join