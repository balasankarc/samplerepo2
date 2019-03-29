class Lorem
  class << self
    def hello(name)
      puts "Hello, #{name}"
    end
  end
end

Lorem.hello("Balu")
