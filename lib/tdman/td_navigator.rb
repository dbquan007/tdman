class TdNavigator
	def initialize(args)
		start_borwser(args)
	end
	
	def start_borwser(browser)
		puts "start #{browser}" if $debug
	end
	
end

#TdNavigator.new("chrome")