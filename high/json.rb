# created by hezhao on 2018-05-20 1:59
require 'rubygems'
require 'json'
require 'pp'

# 字符串转JSON
str = File.read("../files/input.json")
json = JSON.parse(str)
pp json

puts json["CEO"]
puts json["India"][0]

# JSON转字符串
str = JSON.unparse(json)
pp str