require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However, 
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  
  unless defined? SPREE_ROOT
    ENV["RAILS_ENV"] = "test"
    case
    when ENV["SPREE_ENV_FILE"]
      require ENV["SPREE_ENV_FILE"]
    when File.dirname(__FILE__) =~ %r{vendor/SPREE/vendor/extensions}
      require "#{File.expand_path(File.dirname(__FILE__) + "/../../../../../../")}/config/environment"
    else
      require "#{File.expand_path(File.dirname(__FILE__) + "/../../../../")}/config/environment"
    end
  end
  require "#{SPREE_ROOT}/spec/spec_helper"

  if File.directory?(File.dirname(__FILE__) + "/scenarios")
    Scenario.load_paths.unshift File.dirname(__FILE__) + "/scenarios"
  end
  if File.directory?(File.dirname(__FILE__) + "/matchers")
    Dir[File.dirname(__FILE__) + "/matchers/*.rb"].each {|file| require file }
  end

  Spec::Runner.configure do |config|
    # config.use_transactional_fixtures = true
    # config.use_instantiated_fixtures  = false
    # config.fixture_path = RAILS_ROOT + '/spec/fixtures'

    # You can declare fixtures for each behaviour like this:
    #   describe "...." do
    #     fixtures :table_a, :table_b
    #
    # Alternatively, if you prefer to declare them only once, you can
    # do so here, like so ...
    #
    #   config.global_fixtures = :table_a, :table_b
    #
    # If you declare global fixtures, be aware that they will be declared
    # for all of your examples, even those that don't use them.
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  
end

# --- Instructions ---
# - Sort through your spec_helper file. Place as much environment loading 
#   code that you don't normally modify during development in the 
#   Spork.prefork block.
# - Place the rest under Spork.each_run block
# - Any code that is left outside of the blocks will be ran during preforking
#   and during each_run!
# - These instructions should self-destruct in 10 seconds.  If they don't,
#   feel free to delete them.
#




