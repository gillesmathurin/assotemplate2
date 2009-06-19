require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Evenement do
  before(:each) do
    @valid_attributes = {
      :date => Date.today,
      :h_debut => Time.now,
      :h_fin => Time.now,
      :lieu => "value for lieu",
      :description => "value for description",
      :picture_file_name => "value for picture_file_name",
      :picture_content_type => "value for picture_content_type",
      :picture_file_size => 1,
      :picture_updated_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Evenement.create!(@valid_attributes)
  end
end
