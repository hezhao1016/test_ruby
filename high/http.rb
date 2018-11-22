# created by hezhao on 2018-05-27 1:42
# Ruby Http 请求

# 日志模块
require 'logger'
$logger = Logger.new("../files/http.log", level: :debug, datetime_format: '%Y-%m-%d %H:%M:%S')

# 1. 建立HTTP连接(通过GET方式发送请求参数)
puts '------------------------------1. 建立HTTP连接(通过GET方式发送请求参数)------------------------------'
require 'open-uri'
uri = 'http://www.jianshu.com'
html_response = nil
open(uri) do |http|
  html_response = http.read
end
puts html_response


# 2. 通过POST发送请求参数
puts '------------------------------2. 通过POST发送请求参数------------------------------'
params = {}
params["key"] = '人生别留遗憾'
params["act"] = 'input'
uri = URI.parse("http://search.dangdang.com/")
res = Net::HTTP.post_form(uri, params)
#返回的cookie
puts res.header['set-cookie']
#返回的html body
puts res.body


# 3.HTTPS请求
puts '------------------------------3.HTTPS请求------------------------------'
def self.sendDataSsl(url, data)
  url = url + data
  $logger.info(url)
  begin
    uri = URI.parse(URI.escape(url))
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    if ($logger != nil)
      $logger.info("链接地址参数:#{URI.escape(url)},文件名：#{__FILE__},第 #{__LINE__} 行")
      $logger.info("传入data参数:#{data.to_json},文件名：#{__FILE__},第 #{__LINE__} 行")
    end
    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
  rescue =>exception
    $logger.error("传递url地址为#{url}，错误!#{exception.to_s},文件名：#{__FILE__},第 #{__LINE__} 行")
    return nil
  end
  return response.body
end
result = sendDataSsl('https://www.baidu.com', '')
puts result
