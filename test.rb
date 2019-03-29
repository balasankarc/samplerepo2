class Lorem
  class << self
    def hello(name)
      puts "Hello, #{name}"
    end
  end
end

def restricted_output
  puts "section_start:#{Time.now.to_i}:chat_reply\r\033[0K"

  yield
ensure
  puts "section_end:#{Time.now.to_i}:chat_reply\r\033[0K"
end

resitrcted_output { Lorem.hello("Balu") }
