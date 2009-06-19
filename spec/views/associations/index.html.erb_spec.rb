require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/associations/index.html.erb" do
  include AssociationsHelper
  
  before(:each) do
    assigns[:associations] = [
      stub_model(Association,
        :nom => "value for nom",
        :adresse => "value for adresse",
        :cp => "value for cp",
        :ville => "value for ville",
        :tel => "value for tel",
        :fax => "value for fax",
        :email => "value for email",
        :about_us => "value for about_us",
        :banniere_file_name => "value for banniere_file_name",
        :banniere_file_size => 1,
        :banniere_content_type => "value for banniere_content_type"
      ),
      stub_model(Association,
        :nom => "value for nom",
        :adresse => "value for adresse",
        :cp => "value for cp",
        :ville => "value for ville",
        :tel => "value for tel",
        :fax => "value for fax",
        :email => "value for email",
        :about_us => "value for about_us",
        :banniere_file_name => "value for banniere_file_name",
        :banniere_file_size => 1,
        :banniere_content_type => "value for banniere_content_type"
      )
    ]
  end

  it "renders a list of associations" do
    render
    response.should have_tag("tr>td", "value for nom".to_s, 2)
    response.should have_tag("tr>td", "value for adresse".to_s, 2)
    response.should have_tag("tr>td", "value for cp".to_s, 2)
    response.should have_tag("tr>td", "value for ville".to_s, 2)
    response.should have_tag("tr>td", "value for tel".to_s, 2)
    response.should have_tag("tr>td", "value for fax".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for about_us".to_s, 2)
    response.should have_tag("tr>td", "value for banniere_file_name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for banniere_content_type".to_s, 2)
  end
end

