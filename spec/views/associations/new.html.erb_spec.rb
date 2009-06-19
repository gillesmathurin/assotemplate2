require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/associations/new.html.erb" do
  include AssociationsHelper
  
  before(:each) do
    assigns[:association] = stub_model(Association,
      :new_record? => true,
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

  it "renders new association form" do
    render
    
    response.should have_tag("form[action=?][method=post]", associations_path) do
      with_tag("input#association_nom[name=?]", "association[nom]")
      with_tag("input#association_adresse[name=?]", "association[adresse]")
      with_tag("input#association_cp[name=?]", "association[cp]")
      with_tag("input#association_ville[name=?]", "association[ville]")
      with_tag("input#association_tel[name=?]", "association[tel]")
      with_tag("input#association_fax[name=?]", "association[fax]")
      with_tag("input#association_email[name=?]", "association[email]")
      with_tag("textarea#association_about_us[name=?]", "association[about_us]")
      with_tag("input#association_banniere_file_name[name=?]", "association[banniere_file_name]")
      with_tag("input#association_banniere_file_size[name=?]", "association[banniere_file_size]")
      with_tag("input#association_banniere_content_type[name=?]", "association[banniere_content_type]")
    end
  end
end


