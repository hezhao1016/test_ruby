# created by hezhao on 2018-05-20 2:31
# 线程和异常
# 当某线程发生异常，且没有被rescue捕捉到时，该线程通常会被无警告地终止。
# 但是，若有其它线程因为Thread#join的关系一直等待该线程的话，则等待的线程同样会被引发相同的异常。

begin
  t = Thread.new do
    Thread.pass    # 主线程确实在等join
    raise "unhandled exception"
  end
  t.join
rescue
  p $!  # => "unhandled exception"
end