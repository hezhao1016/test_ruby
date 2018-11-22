# created by hezhao on 2018-05-26 16:29

class Main
  def self.call(env)
    ['200', {'Content-Type' => 'text/html'}, ['Hello, Rack Main!']]
  end
end