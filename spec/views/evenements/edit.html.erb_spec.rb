require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/evenements/edit.html.erb" do
  include EvenementsHelper
  
  before(:each) do
    assigns[:evenement] = @evenement = stub_model(Evenement,
      :new_record? => false,
      :lieu => "value for lieu",
      :description => "value for description",
      :picture_file_name => "value for picture_file_name",
      :picture_content_type => "value for picture_content_type",
      :picture_file_size => 1
    )
  end

  it "renders the edit evenement form" do
    render
    
    response.should have_tag("form[action=#{evenement_path(@evenement)}][method=post]") do
      with_tag('input#evenement_lieu[name=?]', "evenement[lieu]")
      with_tag('textarea#evenement_description[name=?]', "evenement[description]")
      with_tag('input#evenement_picture_file_name[name=?]', "evenement[picture_file_name]")
      with_tag('input#evenement_picture_content_type[name=?]', "evenement[picture_content_type]")
      with_tag('input#evenement_picture_file_size[name=?]', "evenement[picture_file_size]")
    end
  end
end


