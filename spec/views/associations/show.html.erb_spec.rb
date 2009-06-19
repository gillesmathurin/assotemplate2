require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/associations/show.html.erb" do
  include AssociationsHelper
  before(:each) do
    assigns[:association] = @association = stub_model(Association,
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
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ nom/)
    response.should have_text(/value\ for\ adresse/)
    response.should have_text(/value\ for\ cp/)
    response.should have_text(/value\ for\ ville/)
    response.should have_text(/value\ for\ tel/)
    response.should have_text(/value\ for\ fax/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ about_us/)
    response.should have_text(/value\ for\ banniere_file_name/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ banniere_content_type/)
  end
end

