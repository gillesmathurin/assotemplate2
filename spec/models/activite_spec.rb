require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Activite do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :description => "value for description",
      :tarif => "value for tarif",
      :public => "value for public",
      :lieu => "value for lieu",
      :horaire => "value for horaire"
    }
  end

  it "should create a new instance given valid attributes" do
    Activite.create!(@valid_attributes)
  end
end
