# created by hezhao on 2018-05-26 22:50
# Ruby 操作MongoDB
# 安装：gem install mongo

require 'mongo'

# 使用Mongo::Client建立与正在运行的MongoDB实例的连接
# client = Mongo::Client.new(['127.0.0.1:27017'], :database => 'test')

# 使用URI连接字符串
client = Mongo::Client.new('mongodb://127.0.0.1:27017/test')

# 访问指定数据库并显示其集合
db = client.database
puts db.collections
puts db.collection_names

# 访问集合,如果集合不存在，服务器将在第一次放入数据时创建。
collection = client[:people]

# 插入单个文档
# doc = {name: '张三', hobbies: ['看书', '品茶', '音乐']}
# result = collection.insert_one(doc)
# puts result.n # 影响行数

# 插入多个文档
# docs = [{name: '李四', hobbies: ['打球', '电影', '音乐']},
#         {name: '王五', hobbies: ['看书', '爬山', '游泳']}]
# result = collection.insert_many(docs)
# puts result.inserted_count # 影响行数

# 更新单个文档
# result = collection.update_one({'name' => "张三"}, {'$set' => {'phone_number' => "13100000000"}})
# puts result.n

# 更新多个文档
# result = collection.update_many({}, {'$set' => {'phone_number' => "13200000000"}})
# puts result.n

# 删除单个文档
# result = collection.delete_one({'name' => "张三"})
# puts result.deleted_count

# 删除多个文档
# result = collection.delete_many({ name: /$张*/ })
# puts result.deleted_count

# 查询所有
collection.find.each do |document|
  puts document
end

# 根据条件查询
puts collection.find({name: "张三"}).first

# 集合数量
puts "一共 #{collection.count} 条数据"

# 创建单个索引
# collection.indexes.create_one({ name: 1 }, unique: true)

# 创建多个索引
# collection.indexes.create_many([
#                                    { key: { name: 1 } , unique: true },
#                                    { key:  { hobbies: 1 } },
#                                ])