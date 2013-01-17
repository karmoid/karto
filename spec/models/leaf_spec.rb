require 'spec_helper'

describe Leaf do
	before(:each) do
		@leaf = Leaf.new(:name => "leaf1", :hr => "leaf lib1")
	end

	it "is valid with valid attributes" do
		@leaf.should be_valid
	end	

	it "is not valid without a name" do
		@leaf.name = nil
		@leaf.should_not be_valid
	end	

	it "is not valid without a hr" do
		@leaf.hr = nil
		@leaf.should_not be_valid
	end	

end
