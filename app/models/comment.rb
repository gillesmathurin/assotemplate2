class Comment < ActiveRecord::Base
  belongs_to :article
  
  named_scope :last_five, :order => "created_at desc", :limit => 5
end
