class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
  
  has_attached_file :photo, :styles => { :thumb => "100x100>", :medium => "300x300>" }
  
  named_scope :of_the_week, :conditions => ['created_at < ?', 7.days]
  
  named_scope :of_the_month, :conditions => ['created_at between ? and ?', Date.today.beginning_of_month, Date.today.end_of_month],
   :order => 'created_at desc'
   
  named_scope :of_the_given_month, lambda { |*args| { :conditions => ['created_at between ? and ?', args.first,
     args.first.end_of_month] } }
  
  named_scope :du_jour, lambda { |day| { :conditions => ['created_at between ? and ?', day.to_time.beginning_of_day, day.to_time.end_of_day] } }
    
  def self.has_events_on?(day)
    if find(:all, :conditions => ['created_at between ? and ?', day.to_time.beginning_of_day, day.to_time.end_of_day]).empty?
      return false
    else
      return true
    end
  end
end
