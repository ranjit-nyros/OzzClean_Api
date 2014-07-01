class ApiKey < ActiveRecord::Base
   attr_accessible :access_token ,:name ,:email , :company, :user_id ,:organization_id
   validates_presence_of :email ,:name ,:company
   validates_uniqueness_of :email, :message => "is already being used."
    validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/, :message => "is not a valid email address."
    before_create :generate_access_token
  belongs_to :user
  belongs_to :organization


private

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end


end
