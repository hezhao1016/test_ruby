# created by hezhao on 2018-05-17 0:50


# 取消文件里的注释，读取文件除了注释的内容再把它写入到另一个文件
# DeCommenter.decomment 需要两个开放的文件句柄，一个可以读，一个可以写。正则表达式确定输入的每行是不是注释。不是注释的行会被写入到输出的文件里。
module DeCommenter
  def self.decomment(infile, outfile, comment_re = /\A\s*#/)
    infile.each do |inline|
      outfile.print inline unless inline =~ comment_re
    end
  end
end


# 测试
File.open("file.rb") do |inf|
  File.open("../files/file.rb.out", "w") do |outf|
    DeCommenter.decomment(inf, outf)
  end
end


# StringIO 把字符串当 IO 对象。检索，倒回 ...
require 'stringio'

text = <<EOM
# this is comment.
this is not a comment.
# this is.
 # so is this.
this is also not a comment.
EOM

infile = StringIO.new(text)
outfile = StringIO.new("")
DeCommenter.decomment(infile, outfile)

puts "test succeeded" if outfile.string == <<EOM
this is not a comment.
this is also not a comment.
EOM

