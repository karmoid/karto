require 'spec_helper'

describe Directory do
	def get_leaf()
	end

	before(:each) do
		@directory = Directory.new(:name => "dir1", :hr => "dirhr1")
	end

	it "is valid with valid attributes" do
		@directory.should be_valid
	end	

	it "is not valid without a name" do
		@directory.name = nil
		@directory.should_not be_valid
	end	

	it "is not valid without a hr" do
		@directory.hr = nil
		@directory.should_not be_valid
	end	

	describe Directory, "with sub leafs" do
		before(:each) do
			@leaf = stub_model(Leaf,
				:name => "leaf1",
				:hr => "leafhr1"
				)
			@directory.leafs << @leaf
		end
		
		it "must include leaf when leaf added" do
			@directory.leafs.should include(@leaf)
		end	
	end

	describe Directory, "with sub directories" do
		before(:each) do
			@sub_directory = Directory.new(:name => "subdir1", :hr => "subdirhr1")
			@directory.directories << @sub_directory
		end

		it "must include directory when directory added" do
			@directory.directories.should include(@sub_directory)
		end	

		it "must be parent of sub_directory when sub_directory added" do
			@sub_directory.parent.should equal(@directory)
		end	

	end	

end
