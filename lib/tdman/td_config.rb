require 'yaml'
require 'ostruct'

class TdConfig
    attr_reader :hash_content, :content

    def initialize file_path
        @f ||= file_path if valid?(file_path)
        File.open(@f) {|handle| @hash_content = YAML.load(handle)}
        @content = OpenStruct.new(@hash_content)
    end
    
    private
    def valid?(file_path)
        raise puts "file path error" unless File.exists?(file_path)
        true
    end
end

# content = TdConfig.new('../../config/config.yml').content
# puts content
