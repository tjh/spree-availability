require File.dirname(__FILE__) + '/../spec_helper'

describe Availability do
  before(:each) do
    @availability = Availability.new
  end

  it "should be valid" do
    @availability.should be_valid
  end
end
