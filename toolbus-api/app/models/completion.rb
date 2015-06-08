class Completion < ActiveRecord::Base
  belongs_to :achievement
  belongs_to :repo
end
