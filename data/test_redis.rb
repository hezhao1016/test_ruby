# created by hezhao on 2018-05-27 1:24
# Ruby 操作Redis
# 安装：gem install redis

require 'redis'

# 默认连接本机127.0.0.1， 端口6379， 选择第0个数据库
redis = Redis.new

# 指定连接选项
# redis = Redis.new(:host => "127.0.0.1", :port => 6379, :db => 0)

# 存入值
redis.set("myKey", "Hello, Redis On Ruby !")

# 获取值
puts redis.get("myKey")