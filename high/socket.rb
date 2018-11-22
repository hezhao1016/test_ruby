# created by hezhao on 2018-05-20 2:10
# Socket 编程

require 'socket'                    # Sockets 是标准库

host = 'www.baidu.com'              # web服务器
port = 80                           # 默认 HTTP 端口
path = "/index.htm"                 # 想要获取的文件地址

# 这是个 HTTP 请求
request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host,port)  # 连接服务器
socket.print(request)               # 发送请求
response = socket.read              # 读取完整的响应
# Split response at first blank line into headers and body
headers,body = response.split("\r\n\r\n", 2)
print headers                       # 输出结果
print body                          # 输出结果