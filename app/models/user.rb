class User < ActiveRecord::Base
  authenticates_with_sorcery!
  belongs_to :organization, counter_cache: true
  has_many :list_cleans, dependent: :destroy
  has_many :sales_genie_data, dependent: :destroy
  has_many :test_summaries, dependent: :destroy
  has_one :api_key, dependent: :destroy
  #has_and_belongs_to_many :categories # categories that user have permission
  #has_and_belongs_to_many :folders # folder that user have permission to
#  has_many :links, dependent: :destroy
  attr_accessor :organization_name
  attr_accessible :username, :name, :group, :active, :email, :password, :password_confirmation, :admin, :organization, as: :admin
  attr_accessible :username, :name, :group, :email, :password, :password_confirmation, :organization_name
  

  validate :organization_name_if_no_organization
  validates_presence_of :name
  validates_presence_of :organization
  validates_presence_of :password, :only => [:create, :update]
  validates :password, length: { minimum: 5 }, confirmation: true, unless: "password.blank?"
  validates :username, uniqueness: true, presence: true, format: { with: /^[\w\d]+$/ }, length: { minimum: 5 }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true


#validates_presence_of :question, :message => "Must select security question", :if => :admin?

#validates_presence_of :answer, :message => "Must Give Some Answer to Your Question", :if => :admin?

  def admin?
    self.admin
  end
  
  def organization_name_if_no_organization
    errors.add(:organization_name, "can't be blank") if (organization && organization.name.blank?) && organization_name.blank?
  end
  
  def all_activities
    raise "User does not have organization" unless organization
    	if admin?
		self.organization.activities
	else
		self.activities.where(:priority => 'Yes')
	end
  end
  
  def permitted_activities
    raise "User does not have organization" unless organization
self.activities
    
    #binding.pry
  end
  
  def user_activities
 self.admin? ? all_activities : permitted_activities
	

  end

end
