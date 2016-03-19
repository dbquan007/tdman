class TdPage
    def initialize(page_path)
        @page_path = page_path
        load_all_pages
        load_all_components
    end
    
    def load_all_pages
        # require all pages
        Dir.glob(File.join(@page_path, '**', '*_page.rb')).each {|page|
            puts page if $debug
            require page
        }
    end

    def load_all_components
        Dir.glob(File.join(@page_path, 'components', '**', '*.rb')).each {|component|
            puts component if $debug
            require component
        } 
end

end

#TdPage.new("E:/workspace/tdman/app/pages")