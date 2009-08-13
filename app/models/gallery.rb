class Gallery < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :photo1, :styles => { :thumb => "100x100>", :medium => "300x300>" }, :default_url => ""
  has_attached_file :photo2, :styles => { :thumb => "100x100>", :medium => "300x300>" }, :default_url => ""
  has_attached_file :photo3, :styles => { :thumb => "100x100>", :medium => "300x300>" }, :default_url => ""
  has_attached_file :photo4, :styles => { :thumb => "100x100>", :medium => "300x300>" }, :default_url => ""
  has_attached_file :photo5, :styles => { :thumb => "100x100>", :medium => "300x300>" }, :default_url => ""
  
  # fetch the last four 4 galleries
  named_scope :last_four, :order => "created_at desc", :limit => 4
end
