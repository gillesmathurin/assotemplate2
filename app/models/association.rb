class Association < ActiveRecord::Base
  has_many :users
  has_many :faqs
  has_attached_file :banniere
end
