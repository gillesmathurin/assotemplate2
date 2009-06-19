require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/evenements/show.html.erb" do
  include EvenementsHelper
  before(:each) do
    assigns[:evenement] = @evenement = stub_model(Evenement,
      :lieu => "value for lieu",
      :description => "value for description",
      :picture_file_name => "value for picture_file_name",
      :picture_content_type => "value for picture_content_type",
      :picture_file_size => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ lieu/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/value\ for\ picture_file_name/)
    response.should have_text(/value\ for\ picture_content_type/)
    response.should have_text(/1/)
  end
end

