#require "./td_config.rb"
$debug = true

class TdInitializer

	def initialize(root)
		@root = root
		generate_pathes
		load_config
		load_app_page
		load_all_components
		load_all_test_data
	end

	def generate_pathes
		puts "generate path in ENV"
	end
	
	def load_config
		@file_path = "#{@root}config/config.yml"
		puts @file_path if $debug
		$config = TdConfig.new(@file_path).content
		puts "config: "+$config.to_s if $debug
	end

	def load_app_page
		puts "load page"
	end

	def load_all_components
		puts "load components"
	end



	def load_all_test_data
		puts "load all test data"
	end

end

TdInitializer.new("E:/workspace/tdman/")
#p $config.tags