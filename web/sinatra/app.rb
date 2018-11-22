# created by hezhao on 2018-05-26 17:28
# Sinatra 简洁、快速的Ruby Web轻量级框架
# 相关的框架Padrino是一个基于Sinatra之上的轻量级Web框架，在Sinatra基础之上提供了命名路由，模块化项目组织，页面helpers和generators等。
#
# Sinatra 中文文档 - http://sinatrarb.com/intro-zh.html
#
# 安装 gem install sinatra
# 推荐安装 gem install thin , 这样，Sinatra 会优先选择 Thin 作为服务器。

require 'sinatra'

get '/' do
  'Hello, Sinatra!'
end

# 测试：
# http://localhost:4567