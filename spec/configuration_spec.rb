require 'spec_helper'
require 'pathname'

describe Heel::Configuration do
  before do
    @proj_root = Pathname.new( __FILE__ ).parent.parent
  end
  it "finds files relative to root of gem" do
    Heel::Configuration.root_dir.must_equal @proj_root.expand_path.to_s + File::SEPARATOR
  end

  it "finds files in the config dir of the project" do
    Heel::Configuration.config_path('config.rb').must_equal @proj_root.join("config", "config.rb").to_s
  end
  
  it "finds files in the data dir of the project" do
    Heel::Configuration.data_path('famfamfam', 'icons').must_equal @proj_root.join( "data", "famfamfam", "icons" ).to_s
  end
  
  it "finds files in the lib dir of the project" do
    Heel::Configuration.lib_path('heel.rb').must_equal @proj_root.join("lib", "heel.rb").to_s
  end

end
