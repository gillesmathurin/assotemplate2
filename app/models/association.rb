class Association < ActiveRecord::Base
  has_many :users
  has_many :faqs
  has_attached_file :banniere, :styles => {:bansize => "300x100>"}
end
