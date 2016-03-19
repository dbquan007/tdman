require 'yaml'
require 'ostruct'

class TdConfig
    attr_reader :hash_content, :content

    def initialize conf_file
        @conf_file = conf_file
        $config = load_conf_data
        @test_data_file = File.join('.', 'app', 'test_data', "#{@content.test_data}.yml")
        $data = load_test_data
    end
    
    def load_conf_data
        valid?(@conf_file)
        File.open(@conf_file) {|handle| @hash_content = YAML.load(handle)}
        @content = OpenStruct.new(@hash_content)
    end

    def load_test_data
        valid?(@test_data_file)
        #YAML.load(File.open(@test_data_file))
        File.open(@test_data_file){|handle|
            OpenStruct.new(YAML.load(handle))
        }
    end
    
    private
    def valid?(file)
        raise puts "=== file path error: #{file} ===" unless File.exists?(file)
        true
    end
end

# content = TdConfig.new('../../config/config.yml').content
# puts content
