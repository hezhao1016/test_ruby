# created by hezhao on 2018-05-26 16:27

class Timing
  def initialize(app)
    @app = app
  end

  def call(env)
    ts = Time.now
    status, headers, body = @app.call(env)
    elapsed_time = Time.now - ts
    puts "Timing: #{env['REQUEST_METHOD']} #{env['REQUEST_URI']} #{elapsed_time.round(3)}"
    return status, headers, body
  end
end