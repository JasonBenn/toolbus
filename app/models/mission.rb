class Mission < ActiveRecord::Base
  belongs_to :tool
  has_many :completions
end
