class Factory
  def self.new(*args, &block)
    Class.new do
      args.each{|arg| self.send(:attr_accessor, arg)}

      define_method :initialize do |*attrebutes|
      	raise ArgumentError if attrebutes.length > args.length
      	attrebutes.each_with_index do |attrebute, index|
      		instance_variable_set("@#{args[index]}", attrebute)
      	end
      end

      define_method :[] do |str|
        if str.is_a? Fixnum and str < args.length
          instance_variable_get("@#{args[str]}")
        else
          raise ArgumentError unless str.is_a? Symbol or
           str.is_a? String and args.include? str.to_sym
          instance_variable_get("@#{args[args.index(str.to_sym)]}")
        end
      end

      self.class_eval(&block) if block_given?
    end
  end
end
