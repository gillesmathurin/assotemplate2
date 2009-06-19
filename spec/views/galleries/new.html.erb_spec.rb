require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/galleries/new.html.erb" do
  include GalleriesHelper
  
  before(:each) do
    assigns[:gallery] = stub_model(Gallery,
      :new_record? => true,
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
  end

  it "renders new gallery form" do
    render
    
    response.should have_tag("form[action=?][method=post]", galleries_path) do
      with_tag("input#gallery_user_id[name=?]", "gallery[user_id]")
      with_tag("input#gallery_titre[name=?]", "gallery[titre]")
      with_tag("textarea#gallery_description[name=?]", "gallery[description]")
      with_tag("input#gallery_photo1_file_name[name=?]", "gallery[photo1_file_name]")
      with_tag("input#gallery_photo1_file_content_type[name=?]", "gallery[photo1_file_content_type]")
      with_tag("input#gallery_photo1_file_size[name=?]", "gallery[photo1_file_size]")
      with_tag("input#gallery_photo1_updated_at[name=?]", "gallery[photo1_updated_at]")
      with_tag("input#gallery_photo2_file_name[name=?]", "gallery[photo2_file_name]")
      with_tag("input#gallery_photo2_content_type[name=?]", "gallery[photo2_content_type]")
      with_tag("input#gallery_photo2_file_size[name=?]", "gallery[photo2_file_size]")
      with_tag("input#gallery_photo3_file_name[name=?]", "gallery[photo3_file_name]")
      with_tag("input#gallery_photo3_content_type[name=?]", "gallery[photo3_content_type]")
      with_tag("input#gallery_photo3_file_size[name=?]", "gallery[photo3_file_size]")
      with_tag("input#gallery_photo4_file_name[name=?]", "gallery[photo4_file_name]")
      with_tag("input#gallery_photo4_content_type[name=?]", "gallery[photo4_content_type]")
      with_tag("input#gallery_photo4_file_size[name=?]", "gallery[photo4_file_size]")
      with_tag("input#gallery_photo5_file_name[name=?]", "gallery[photo5_file_name]")
      with_tag("input#gallery_photo5_content_type[name=?]", "gallery[photo5_content_type]")
      with_tag("input#gallery_photo5_file_size[name=?]", "gallery[photo5_file_size]")
      with_tag("input#gallery_photo6_file_name[name=?]", "gallery[photo6_file_name]")
      with_tag("input#gallery_photo6_content_type[name=?]", "gallery[photo6_content_type]")
      with_tag("input#gallery_photo6_file_size[name=?]", "gallery[photo6_file_size]")
    end
  end
end


