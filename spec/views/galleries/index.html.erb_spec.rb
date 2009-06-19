require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/galleries/index.html.erb" do
  include GalleriesHelper
  
  before(:each) do
    assigns[:galleries] = [
      stub_model(Gallery,
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
        :photo3_file_name => "value for photo3_file_name",
        :photo3_content_type => "value for photo3_content_type",
        :photo3_file_size => 1,
        :photo4_file_name => "value for photo4_file_name",
        :photo4_content_type => "value for photo4_content_type",
        :photo4_file_size => 1,
        :photo5_file_name => "value for photo5_file_name",
        :photo5_content_type => "value for photo5_content_type",
        :photo5_file_size => 1,
        :photo6_file_name => "value for photo6_file_name",
        :photo6_content_type => "value for photo6_content_type",
        :photo6_file_size => 1
      ),
      stub_model(Gallery,
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
        :photo3_file_name => "value for photo3_file_name",
        :photo3_content_type => "value for photo3_content_type",
        :photo3_file_size => 1,
        :photo4_file_name => "value for photo4_file_name",
        :photo4_content_type => "value for photo4_content_type",
        :photo4_file_size => 1,
        :photo5_file_name => "value for photo5_file_name",
        :photo5_content_type => "value for photo5_content_type",
        :photo5_file_size => 1,
        :photo6_file_name => "value for photo6_file_name",
        :photo6_content_type => "value for photo6_content_type",
        :photo6_file_size => 1
      )
    ]
  end

  it "renders a list of galleries" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for titre".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", "value for photo1_file_name".to_s, 2)
    response.should have_tag("tr>td", "value for photo1_file_content_type".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", .to_s, 2)
    response.should have_tag("tr>td", "value for photo2_file_name".to_s, 2)
    response.should have_tag("tr>td", "value for photo2_content_type".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for photo3_file_name".to_s, 2)
    response.should have_tag("tr>td", "value for photo3_content_type".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for photo4_file_name".to_s, 2)
    response.should have_tag("tr>td", "value for photo4_content_type".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for photo5_file_name".to_s, 2)
    response.should have_tag("tr>td", "value for photo5_content_type".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for photo6_file_name".to_s, 2)
    response.should have_tag("tr>td", "value for photo6_content_type".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

