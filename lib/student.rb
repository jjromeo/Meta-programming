class Student

	attr_accessor :awards



	def respond_to?(method)
		if method.class == Symbol
			true
		end
	end

	def method_missing(method, *args)
			@awards ||= []
		if method.to_s.end_with?('?')
			self.class.send(:define_method,  method.to_s) {
					@awards.include? "#{method.to_s}"[4..-2]
			}
			self.send(method)
		else
			self.class.send(:define_method, method.to_s){ 
				self.awards << args.join

			}
		end
		# "The method #{method} doesn't exist, stop making them up!"
	end


end
