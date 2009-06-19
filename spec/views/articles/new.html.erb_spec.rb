require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/articles/new.html.erb" do
  include ArticlesHelper
  
  before(:each) do
    assigns[:article] = stub_model(Article,
      :new_record? => true,
      :titre => "value for titre",
      :user_id => 1,
      :body => "value for body",
      :photo_file_name => "value for photo_file_name",
      :photo_file_size => 1,
      :photo_content_type => "value for photo_content_type"
    )
  end

  it "renders new article form" do
    render
    
    response.should have_tag("form[action=?][method=post]", articles_path) do
      with_tag("input#article_titre[name=?]", "article[titre]")
      with_tag("input#article_user_id[name=?]", "article[user_id]")
      with_tag("textarea#article_body[name=?]", "article[body]")
      with_tag("input#article_photo_file_name[name=?]", "article[photo_file_name]")
      with_tag("input#article_photo_file_size[name=?]", "article[photo_file_size]")
      with_tag("input#article_photo_content_type[name=?]", "article[photo_content_type]")
    end
  end
end


