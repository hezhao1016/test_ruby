# created by hezhao on 2018-05-26 16:29

require 'rack'
require '../middleware/timing'

app = proc do |env|
  ['200', {'Content-Type' => 'text/html'}, ['Hello, Rack Middleware!']]
end

Rack::Handler::WEBrick.run(Timing.new(app), :Port => 8090, :Host => '127.0.0.1')

# 测试：
# http://localhost:8090
#
# Rack中间件就是一个类，如上面的Timing，其对象响应一个call方法，这个方法的输入、输出规格与一般Rack应用一样。
# 因此Timing.new(app)可以作为一个Rack应用直接传递给Rack::Handler::WEBrick.run。
# 实际上，中间件可以这样一层套一层地层层嵌套下去，最后仍得出一个可以call的Rack应用。
#
# Rack中间件可以实现非常强大的功能。在上面的例子中，我们的Timing中间件为每一次调用计时，并把结果打印出来。这相当于一个profiler。
# 实际上中间件能做的事情更多：它可以检查内嵌应用程序@app的输入、输出，还可以修改它们。
# 因此它还可以用于鉴权（authentication/authorization）、日志，或者给内嵌应用提供一些额外的功能，如Session等等。