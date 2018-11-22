# created by hezhao on 2018-05-20 2:23
# XML解析

###### DOM 解析器
puts "---------------------------------DOM-----------------------------------"
require 'rexml/document'
include REXML

xmlfile = File.new("../files/movies.xml")
xmldoc = Document.new(xmlfile)

# 获取 root 元素
root = xmldoc.root
puts "Root element : " + root.attributes["shelf"]

# 以下将输出电影标题
xmldoc.elements.each("collection/movie"){
    |e| puts "Movie Title : " + e.attributes["title"]
}

# 以下将输出所有电影类型
xmldoc.elements.each("collection/movie/type") {
    |e| puts "Movie Type : " + e.text
}

# 以下将输出所有电影描述
xmldoc.elements.each("collection/movie/description") {
    |e| puts "Movie Description : " + e.text
}


####### SAX 解析器
puts "---------------------------------SAX-----------------------------------"
require 'rexml/document'
require 'rexml/streamlistener'
include REXML

class MyListener
  include REXML::StreamListener
  def tag_start(*args)
    puts "tag_start: #{args.map {|x| x.inspect}.join(', ')}"
  end

  def text(data)
    return if data =~ /^\w*$/     # whitespace only
    abbrev = data[0..40] + (data.length > 40 ? "..." : "")
    puts "  text   :   #{abbrev.inspect}"
  end
end

list = MyListener.new
xmlfile = File.new("../files/movies.xml")
Document.parse_stream(xmlfile, list)


####### XPath
puts "---------------------------------Xpath-----------------------------------"
require 'rexml/document'
include REXML

xmlfile = File.new("../files/movies.xml")
xmldoc = Document.new(xmlfile)

# 第一个电影的信息
movie = XPath.first(xmldoc, "//movie")
p movie

# 打印所有电影类型
XPath.each(xmldoc, "//type") { |e| puts e.text }

# 获取所有电影格式的类型，返回数组
names = XPath.match(xmldoc, "//format").map {|x| x.text }
p names
