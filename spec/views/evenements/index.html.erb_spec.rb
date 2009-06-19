require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/evenements/index.html.erb" do
  include EvenementsHelper
  
  before(:each) do
    assigns[:evenements] = [
      stub_model(Evenement,
        :lieu => "value for lieu",
        :description => "value for description",
        :picture_file_name => "value for picture_file_name",
        :picture_content_type => "value for picture_content_type",
        :picture_file_size => 1
      ),
      stub_model(Evenement,
        :lieu => "value for lieu",
        :description => "value for description",
        :picture_file_name => "value for picture_file_name",
        :picture_content_type => "value for picture_content_type",
        :picture_file_size => 1
      )
    ]
  end

  it "renders a list of evenements" do
    render
    response.should have_tag("tr>td", "value for lieu".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", "value for picture_file_name".to_s, 2)
    response.should have_tag("tr>td", "value for picture_content_type".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

