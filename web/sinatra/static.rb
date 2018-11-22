# created by hezhao on 2018-05-26 18:09
# 静态文件

require 'sinatra'

# 静态文件默认从 ./public 目录提供服务。可以通过设置:public_folder 选项设定一个不同的位置：
set :public_folder, File.dirname(__FILE__) + '/../../files'

# 请注意 public 目录名并没有包含在 URL 中。文件 ./public/css/style.css 可以通过 http://example.com/css/style.css 访问。
# 可以使用 :static_cache_control 设置（见下文）添加 Cache-Control 首部信息。

get '/' do
  'Hello'
end

# 测试：
# http://localhost:4567/a.txt