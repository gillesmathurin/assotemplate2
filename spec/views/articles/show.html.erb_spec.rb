require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/articles/show.html.erb" do
  include ArticlesHelper
  before(:each) do
    assigns[:article] = @article = stub_model(Article,
      :titre => "value for titre",
      :user_id => 1,
      :body => "value for body",
      :photo_file_name => "value for photo_file_name",
      :photo_file_size => 1,
      :photo_content_type => "value for photo_content_type"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ titre/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ body/)
    response.should have_text(/value\ for\ photo_file_name/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ photo_content_type/)
  end
end

