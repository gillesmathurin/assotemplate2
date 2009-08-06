class Article < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  
  has_attached_file :photo, :styles => { :thumb => "100x100>", :medium => "300x300>" }
  
  validates_presence_of :titre, :on => :create, :message => "doit avoir un titre"
  
  before_validation_on_create :set_permalink
  
  named_scope :of_the_week, :conditions => ['created_at < ?', Date.today+7]
  
  named_scope :of_the_month, :conditions => ['created_at between ? and ?', Date.today.beginning_of_month, Date.today.end_of_month],
   :order => 'created_at desc'
   
  named_scope :of_the_given_month, lambda { |*args| { :conditions => ['created_at between ? and ?', args.first,
     args.first.end_of_month] } }
  
  named_scope :du_jour, lambda { |day| { :conditions => ['created_at between ? and ?', day.to_time.beginning_of_day, day.to_time.end_of_day] } }
  
  def to_param
    "#{id}-#{permalink}"
  end
    
  def self.has_events_on?(day)
    if find(:all, :conditions => ['created_at between ? and ?', day.to_time.beginning_of_day, day.to_time.end_of_day]).empty?
      return false
    else
      return true
    end
  end
  
  protected
  
  def set_permalink
    self.permalink = self.titre.downcase.gsub(/\s+/, '_').gsub(/[^a-zA-z0-9_]+/, '')
  end
end
