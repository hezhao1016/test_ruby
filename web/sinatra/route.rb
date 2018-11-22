# created by hezhao on 2018-05-26 17:39
# 路由

# 在 Sinatra 中，一个路由分为两部分：HTTP 方法和 URL 匹配范式。每个路由都有一个要执行的代码块
# 路由按照它们定义时的顺序进行匹配。第一个与请求匹配的路由会被调用。

require 'sinatra'

get '/' do
  'this is get'
end

post '/' do
  'this is post'
end

put '/' do
  'this is put'
end

delete '/' do
  'this is delete'
end

# 路由范式可以包括具名参数，具名参数可以通过 params hash 访问
get '/hello/:name' do
  "Hello #{params['name']}!"
end

# 也可以通过代码块参数访问具名参数
get '/hello/:name/:id' do |name, id|
  "Hello #{name}! Your Id is #{id}."
end

# 路由范式也可以包含通配符参数， 参数值可以通过 params['splat'] 数组访问
get '/say/*/to/*' do
  # 匹配 "GET /say/hello/to/world"
  params['splat']
end
get '/download/*.*' do
  # 匹配 "GET /download/path/to/file.xml"
  params['splat']
end

# 或者通过代码块参数访问：
get '/download2/*.*' do |path, ext|
  [path, ext]
end

# 通过正则表达式匹配路由
get /\/hello\/([\w]+)/ do
  # 匹配 "GET /meta/hello/world"、"GET /hello/world/1234" 等
  "Hello, #{params['captures'].first}!"
end

# 路由范式可以包含可选参数
get '/posts/:format?' do
  # 匹配 "GET /posts/" 和任意扩展 "GET /posts/json"、"GET /posts/xml" 等
  "Hello, #{params['format']}!"
end

# 使用查询参数
get '/posts' do
  # 匹配 "GET /posts?title=foo&author=bar"
  title = params['title']
  author = params['author']
  # 使用 title 和 author 变量；对于 /posts 路由来说，查询字符串是可选的
  [title, author]
end

# 路由可以包含各种匹配条件，比如 user agent
get '/foo', :agent => /Songbird (\d\.\d)[\d\/]*?/ do
  "你正在使用 Songbird，版本是 #{params['agent'][0]}"
end
get '/foo' do
  "匹配非 Songbird 浏览器"
end

# 其它可以使用的条件有 host_name 和 provides
get '/', :host_name => /^admin\./ do
  "管理员区域，无权进入！"
end
get '/', :provides => 'html' do
  haml :index
end
get '/', :provides => ['rss', 'atom', 'xml'] do
  builder :feed
end

# 也可以轻易地使用自定义条件
set(:probability) { |value| condition { rand <= value } }
get '/win_a_car', :probability => 0.1 do
  "You won!"
end
get '/win_a_car' do
  "Sorry, you lost."
end

# 实现流式传输
class Stream
  def each
    100.times { |i| yield "#{i}\n" }
  end
end
get('/stream') { Stream.new }
