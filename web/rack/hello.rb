# created by hezhao on 2018-05-26 16:19
# Ruby Rack是一个接口，用于Ruby Web应用与应用服务器之间的交互
# 安装：gem install rack
#
# 这是一个最小的可以工作的Rack应用程序,它揭示了Rack接口：
#
# 1.一个响应call方法的对象（任何类型的对象都可以，上面只是以proc为例）
# 2.接受一个Hash类型的环境变量作为输入参数（它包含了全部的HTTP请求信息）
# 3.返回一个包含三个元素的数组，依次是：
#   a.HTTP应答代码（status code）
#   b.一个Hash类型的对象，包含HTTP应答头部信息（header）
#   c.一个响应each方法的对象，其结果将作为HTTP应答消息的主体（body）
#
# 参考资料：
# Ruby Rack 及其应用 (上) - https://ruby-china.org/topics/31592
# Ruby Rack 及其应用 (下) - https://ruby-china.org/topics/33055
# Ruby进阶之Rack入门      - https://www.jianshu.com/p/e748422e3692
# Ruby进阶之Rack深入      - https://www.jianshu.com/p/d74fa30b849f

require 'rack'

app = proc do |env|
  ['200', {'Content-Type' => 'text/html'}, ['Hello, Rack!']]
end

# 使用WEBrick启动服务器
Rack::Handler::WEBrick.run(app, :Port => 8090, :Host => '0.0.0.0')

# 测试：
# http://localhost:8090