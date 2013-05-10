class User
  include Mongoid::Document

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :role, type: String
  after_initialize :init

  has_and_belongs_to_many :courses 

  def init
  	self.role ||= 'Student'
  end

  
  #attr_accessible :email
  #validates_uniqueness_of :email
  
end
