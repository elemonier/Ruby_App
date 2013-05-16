class Course
  include Mongoid::Document

  has_and_belongs_to_many :users
  has_many :uploads
  has_many :lectures

  field :CallNumber, type: Integer
  field :CourseTitle, type: String
  field :StartTime, type: String
  field :EndTime, type: String
  field :MeetsOn, type: String
  field :Building, type: String
  field :Room, type: String
  field :Instructor, type: String
  field :Description, type: String

  validates :CallNumber, :presence => true, :uniqueness => true
end
