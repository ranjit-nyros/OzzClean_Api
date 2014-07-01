class Organization < ActiveRecord::Base
  attr_accessible :name
  
  validates_presence_of :name
  
  has_one :personal_link
  has_many :links, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :pay_periods, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :list_cleans, dependent: :destroy
  has_many :folders
  has_many :sales_genie_data, dependent: :destroy
  has_many :test_summaries, dependent: :destroy
  has_many :api_keys ,dependent: :destroy

end
