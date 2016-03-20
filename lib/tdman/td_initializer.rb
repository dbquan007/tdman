#require "./td_config.rb"
#$debug = true

class TdInitializer

    def initialize(root)
        @root ||= root
        generate_pathes
        load_config_and_test_data
        load_app_pages_and_components
        start_browser
    end

    def generate_pathes
        puts "generate path in ENV" if $debug
        $:.unshift(@root)  # tdman_path
        $:.unshift(@root+"/lib") # lib
        @conf_file = File.join(@root, 'config', 'config.yml')
        @app_path = File.join(@root, 'app')
        @pages_path = File.join(@root, 'app', 'pages')
    end
    
    def load_config_and_test_data
        puts @conf_file if $debug
        TdConfig.new(@conf_file)
        puts "config: "+$config.to_s if $debug
        puts $config.proxy['seo'] 
    end

    def load_app_pages_and_components
        puts "load page" if $debug
        TdPage.new(@pages_path)
    end

    def start_browser
        $b = TdNavigator.new.start_browser
        if $debug
            $b.goto "www.baidu.com"
            puts $b.title
            $b.close
        end
    end

end

TdInitializer.new($root)
#p $config.tags