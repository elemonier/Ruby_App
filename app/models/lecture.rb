class Lecture
  include Mongoid::Document

  belongs_to :lecture

  field :title, type: String
  field :date, type: String
end
