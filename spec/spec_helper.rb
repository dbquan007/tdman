$debug = true
$root = File.expand_path('../../', __FILE__)
puts "root path: "+$root if $debug

require "tdman.rb"


RSpec.configure do |c|
 # c.treat_symbols_as_metadata_keys_with_true_values = true
 # c.filter_run tags
 # c.run_all_when_everything_filtered = true
 c.before(:suite){
    puts "before suite"
}
c.after(:suite){
    puts "after suite"
}
end
