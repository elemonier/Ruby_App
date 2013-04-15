class User
  include Mongoid::Document

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  
  has_and_belongs_to_many :courses  
  
  #attr_accessible :email
  #validates_uniqueness_of :email
  
end
