require "watir-webdriver"
class TdNavigator
    def initialize
        @browser         = $config.browser
        @proxy_host      = $config.proxy['proxy_host']
        @no_proxies_on   = $config.proxy['proxy_no_proxies_on']
        @proxy_port      = $config.proxy['proxy_port']
        @proxy_enable    = $config.proxy['proxy_enable']
        @firefox_profile = get_firefox_profile
        @remote_enable   = $config.remote['remote_enable']
        @remote_address  = "http://#{$config.remote['remote_address']}:4444/wd/hub"
    end # initialize

    def create_firefox_profile
        profile = Selenium::WebDriver::Firefox::Profile.new
        profile['network.proxy.ftp']           = @proxy_host
        profile['network.proxy.ftp_port']      = @proxy_port
        profile['network.proxy.http']          = @proxy_host
        profile['network.proxy.http_port']     = @proxy_port
        profile['network.proxy.no_proxies_on'] = @no_proxies_on
        profile['network.proxy.ssl']           = @proxy_host
        profile['network.proxy.ssl_port']      = @proxy_port
        profile['network.proxy.type']          = @proxy_enable  # 是否使用代理
        profile # return profile
    end # create_firefox_profile

    def create_chrome_profile
        switches_arr = []
        switches_arr << "--proxy-server=#{@proxy_host}:#{@proxy_port}"
        switches_arr << "--proxy-bypass-list=#{@no_proxies_on}"
        switches_arr
    end

    def get_firefox_profile
        if $config.profile.nil?
            return create_firefox_profile
        else
            return $config.profile
        end
    end

    def start_browser
        case @browser.downcase
        when 'chrome'
            if @remote_enable == 1
                Watir::Browser.new :remote, :desired_capabilities=>:chrome, :url=>@remote_adbrowseress  #远程启动客户端机器运行测试用例
            else
                Watir::Browser.new :chrome, :switches=>create_chrome_profile
            end
        when 'firefox'
            if @remote_enable == 1
                Watir::Browser.new :remote, :desired_capabilities=>:firefox, :url=>@remote_adbrowseress  #远程启动客户端机器运行测试用例
            else
                Watir::Browser.new :firefox, :profile=>@firefox_profile
            end
        else
            Watir::Browser.new @browser.downcase.to_sym
        end
    end # start_browser

end # TdNavigator