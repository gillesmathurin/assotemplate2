require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  include Authorization::AasmRoles

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message
  validates_presence_of     :usertype, :on => :create, :message => "doit être renseigné."

  CATEGORIES = [ ["Super Administrateur", 0], ["Administrateur", 1], ["Membre", 2] ]  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation, :usertype, :state, :profil, :avatar
  
  has_many :articles
  has_many :galleries
  belongs_to :association
  has_attached_file :avatar, :styles => { :thumb => "100x100>", :medium => "300x300>" }, :default_url => "/images/missing_thumb.gif"
  
  # fetch the member and admin category users
  named_scope :membres, :conditions => ['usertype = ?', 2]
  named_scope :admins, :conditions => ['usertype = ?', 1]
  
  def to_param
    "#{id}-#{login}"
  end
    
  def categorie_to_s
    case usertype
    when "0"
      return "Super Administrateur"
    when "1"
      return "Administrateur"
    when "2"
      return "Membre"
    end
  end

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_in_state :first, :active, :conditions => {:login => login.downcase} # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  protected
    
    def make_activation_code
        self.deleted_at = nil
        self.activation_code = self.class.make_token
    end


end
