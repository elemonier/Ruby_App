class Upload
  include Mongoid::Document

  belongs_to :course

  field :title, type: String
  field :date_time, type: String
end
