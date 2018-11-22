# created by hezhao on 2018-05-26 16:27

class Auth
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    puts "Auth: #{env['REQUEST_METHOD']} #{env['REQUEST_URI']} 正在验证管理员身份..."
    return status, headers, body
  end
end