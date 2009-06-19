class Evenement < ActiveRecord::Base
  default_scope :order => 'date desc'
  named_scope :of_the_month, :conditions => ['date between ? and ?', Date.today.beginning_of_month, Date.today.end_of_month]
  named_scope :of_the_given_month, lambda { |*args| { :conditions => ['date between ? and ?', args.first, args.first.end_of_month] } }
  named_scope :to_come, :conditions => ['date between ? and ?', Date.today, (Date.today+7)]
  
  has_attached_file :picture, :styles => { :thumb => "100x100>" }
  
  # Tell wether or not there are events on the given day
  def self.has_events_on?(day)
    if find(:all, :conditions => ['date = ?', day]).empty?
      return false
    else
      return true
    end
  end
end

