require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Article do
  before(:each) do
    @valid_attributes = {
      :titre => "value for titre",
      :user_id => 1,
      :body => "value for body",
      :photo_file_name => "value for photo_file_name",
      :photo_file_size => 1,
      :photo_content_type => "value for photo_content_type",
      :photo_updated_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Article.create!(@valid_attributes)
  end
end
