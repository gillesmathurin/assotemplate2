require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Association do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :adresse => "value for adresse",
      :cp => "value for cp",
      :ville => "value for ville",
      :tel => "value for tel",
      :fax => "value for fax",
      :email => "value for email",
      :about_us => "value for about_us",
      :date_creation => Date.today,
      :banniere_file_name => "value for banniere_file_name",
      :banniere_file_size => 1,
      :banniere_content_type => "value for banniere_content_type",
      :banniere_updated_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Association.create!(@valid_attributes)
  end
end
