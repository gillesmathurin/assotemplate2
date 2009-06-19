require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Gallery do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :titre => "value for titre",
      :description => "value for description",
      :photo1_file_name => "value for photo1_file_name",
      :photo1_file_content_type => "value for photo1_file_content_type",
      :photo1_file_size => 1,
      :photo1_updated_at => ,
      :photo2_file_name => "value for photo2_file_name",
      :photo2_content_type => "value for photo2_content_type",
      :photo2_file_size => 1,
      :photo2_updated_at => Time.now,
      :photo3_file_name => "value for photo3_file_name",
      :photo3_content_type => "value for photo3_content_type",
      :photo3_file_size => 1,
      :photo3_updated_at => Time.now,
      :photo4_file_name => "value for photo4_file_name",
      :photo4_content_type => "value for photo4_content_type",
      :photo4_file_size => 1,
      :photo4_updated_at => Time.now,
      :photo5_file_name => "value for photo5_file_name",
      :photo5_content_type => "value for photo5_content_type",
      :photo5_file_size => 1,
      :photo5_updated_at => Time.now,
      :photo6_file_name => "value for photo6_file_name",
      :photo6_content_type => "value for photo6_content_type",
      :photo6_file_size => 1,
      :photo6_updated_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Gallery.create!(@valid_attributes)
  end
end
