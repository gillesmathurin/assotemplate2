require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Faq do
  before(:each) do
    @valid_attributes = {
      :question => "value for question",
      :reponse => "value for reponse",
      :association_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Faq.create!(@valid_attributes)
  end
end
