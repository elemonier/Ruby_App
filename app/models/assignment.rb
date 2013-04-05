class Assignment
  include Mongoid::Document

  belongs_to :lecture

  field :title, type: String
  field :date_time, type: String
end
