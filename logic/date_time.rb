# created by hezhao on 2018-05-16 19:13
# Ruby 日期 & 时间（Date & Time）
# Time 类在 Ruby 中用于表示日期和时间。它是基于操作系统提供的系统日期和时间之上。该类可能无法表示 1970 年之前或者 2038 年之后的日期。

# 创建当前的日期和时间
time1 = Time.new
puts "当前时间 : " + time1.inspect

time2 = Time.new(2018)
time3 = Time.new(2018, 05, 01)
time4 = Time.new(2018, 05, 01, 12, 23, 55)
time5 = Time.new(2018, 05, 01, 12, 23, 55, "+02:00")
puts "指定时间 : " + time2.inspect
puts "指定时间 : " + time3.inspect
puts "指定时间 : " + time4.inspect
puts "指定时间 : " + time5.inspect

# Time.now 获取当前时间
time2 = Time.now
puts "当前时间 : " + time2.inspect

puts time2.year    # => 日期的年份
puts time2.month   # => 日期的月份（1 到 12）
puts time2.day     # => 一个月中的第几天（1 到 31）
puts time2.wday    # => 一周中的星期几（0 是星期日）
puts time2.yday    # => 365：一年中的第几天
puts time2.hour    # => 23：24 小时制
puts time2.min     # => 59:分
puts time2.sec     # => 59:秒
puts time2.usec    # => 999999：微秒


# 格式化标准格式的日期
# July 8, 2008
Time.local(2008, 7, 8)
# July 8, 2008, 09:10am，本地时间
Time.local(2008, 7, 8, 9, 10)
# July 8, 2008, 09:10 UTC
Time.utc(2008, 7, 8, 9, 10)
# July 8, 2008, 09:10:11 GMT （与 UTC 相同）
Time.gm(2008, 7, 8, 9, 10, 11)

values = time2.to_a
puts "time2.to_a = #{values}"

puts Time.utc(*values)
puts Time.local(*values)



# 返回从纪元以来的秒数
time = Time.now.to_i

# 把秒数转换为 Time 对象
Time.at(time)

# 返回从纪元以来的秒数，包含微妙
time = Time.now.to_f


# 时区和夏令时
puts '-------------------------------'
puts time2.zone       # => "UTC"：返回时区
puts time2.utc_offset # => 0：UTC 是相对于 UTC 的 0 秒偏移
puts time2.isdst      # => false：如果 UTC 没有 DST（夏令时）
puts time2.utc?       # => true：如果在 UTC 时区
puts time2.localtime  # 转换为本地时区
puts time2.gmtime     # 转换回 UTC
puts time2.getlocal   # 返回本地区中的一个新的 Time 对象
puts time2.getutc     # 返回 UTC 中的一个新的 Time 对象


# 格式化时间和日期
puts '-------------------------------'
puts time2.to_s
puts time2.ctime
puts time2.localtime
puts time2.strftime("%Y-%m-%d %H:%M:%S")


# 时间算法
puts '-------------------------------'
now = Time.now           # 当前时间
puts now

past = now - 10          # 10 秒之前。Time - number => Time
puts past

future = now + 10        # 从现在开始 10 秒之后。Time + number => Time
puts future

diff = future - now      # => 10  Time - Time => 秒数
puts diff




###### Time,Date,DateTime的区别:
# Time:只能使用1970年以后的日期，包括时分秒
# Date：可以使用更以前的日期，但不包括时分秒，需要require "date"
# DateTime:综合了Time和Date，需要require "date"
require "date"
puts "-----------------------|-----------------------"

p Date.new(2001,2,-1)
p DateTime.new(2013,2,2,12,11,11)
p Time.new(2013,2,2,12,11,11)

# 相互转换
time = Time.now
date = time.to_date
datetime = date.to_datetime
time = datetime.to_time
p time

# 格式化
puts "-----------------------------------"
puts Date.new(2018,5,5).strftime("%Y-%m-%d %H:%M:%S")
puts DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
puts Time.now.strftime("%Y-%m-%d %H:%M:%S")

# format参数：
# %a - The abbreviated weekday name (``Sun'')-星期的缩写(``Sun'')
# %A - The full weekday name (``Sunday'')-星期 (``Sunday'')
# %b - The abbreviated month name (``Jan'')-月份的缩写 (``Jan'')
# %B - The full month name (``January'')-月份(``January'')
# %c - The preferred local date and time representation-本地时间的显示格式
# %d - Day of the month (01..31)-月份中的几号(01..31)
# %H - Hour of the day, 24-hour clock (00..23)-24小时制中的小时(00..23)
# %I - Hour of the day, 12-hour clock (01..12)-12小时制中的小时(01..12)
# %j - Day of the year (001..366)-一年中的第几天 (001..366)
# %m - Month of the year (01..12)-一年中的第几个月(01..12)
# %M - Minute of the hour (00..59)-分钟 (00..59)
# %p - Meridian indicator (``AM'' or ``PM'')-上午还是下午(``AM'' or ``PM'')
# %S - Second of the minute (00..60)-秒(00..60)
# %U - Week number of the current year, starting with the first Sunday as the first day of the first week (00..53)一年中的第几个星期，从第一个星期天开始算。
# %W - Week number of the current year, starting with the first Monday as the first day of the first week (00..53)一年中的第几个星期，从第一个星期一开始算。
# %w - Day of the week (Sunday is 0, 0..6)一个星期中的第几天(Sunday is 0, 0..6)
# %x - Preferred representation for the date alone, no time只显示日期，没有具体时间
# %X - Preferred representation for the time alone, no date只显示时间，没有日期
# %y - Year without a century (00..99)不显示年份中的前两位(00..99)
# %Y - Year with century当前年份
# %Z - Time zone name时间域
# %% - Literal ``%'' character


# 字符串转日期
puts "-----------------------------------"
p Date.parse("2012/12/12 21:21:21")
p Date.parse("1234-4-3")
p DateTime.parse("2011-05-05 12:12:23")


# 日期加减
puts "-----------------------------------"
p Time.new(2011,1,1)+ 1 #相当于加1秒时间
p Date.new(2011,1,1)+ 1 #相当于加1天时间
p DateTime.new(2011,1,1)+ 1 #相当于加1天时间