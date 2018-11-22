# rackup工具的缺省配置文件
#
# 我们不需要再编写初始化Rack中间件和启动Rack服务器的代码——rackup工具会为我们完成。
# 一切就绪以后，在命令行执行（要在包含config.ru的目录下）：
# rackup
#
# 服务启动成功！
# rackup默认使用Webrick服务器

require './main'
require './admin'

require './timing'
require './auth'

# 配置路由
map '/' do
  use Timing
  run Main
end

map '/admin' do
  use Auth
  run Admin
end

# 测试：
# http://localhost:9292/
# http://localhost:9292/admin