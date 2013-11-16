#Task
#Please implement your own class 'Factory' which will have the same behavior as 'Struct' class.

require './factory.rb'

MyFactory = Factory.new(:name, :lastname, :age) do
	def hello
		"Hello"
	end
	def my_method(str)
		str
	end
	def to_s
		"Name: #{@name}\nLastname: #{@lastname}\nAge: #{@age}\n"
	end
end

v = MyFactory.new("Vasya", "Pupkin", 25)
puts v.name
puts v["name"]
puts v[:name]
puts v[0]
puts v.hello
puts v.to_s
puts v.my_method("string")
#Errors
#puts v["some string"]
#puts v[:some_symbol]
#puts v[0.9]
