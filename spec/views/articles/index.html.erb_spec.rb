require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/articles/index.html.erb" do
  include ArticlesHelper
  
  before(:each) do
    assigns[:articles] = [
      stub_model(Article,
        :titre => "value for titre",
        :user_id => 1,
        :body => "value for body",
        :photo_file_name => "value for photo_file_name",
        :photo_file_size => 1,
        :photo_content_type => "value for photo_content_type"
      ),
      stub_model(Article,
        :titre => "value for titre",
        :user_id => 1,
        :body => "value for body",
        :photo_file_name => "value for photo_file_name",
        :photo_file_size => 1,
        :photo_content_type => "value for photo_content_type"
      )
    ]
  end

  it "renders a list of articles" do
    render
    response.should have_tag("tr>td", "value for titre".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
    response.should have_tag("tr>td", "value for photo_file_name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for photo_content_type".to_s, 2)
  end
end

