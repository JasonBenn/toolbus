class Tool < ActiveRecord::Base
  has_many :repos
  has_many :achievements
end
