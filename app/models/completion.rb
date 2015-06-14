class Completion < ActiveRecord::Base
  belongs_to :user
  belongs_to :repo
  belongs_to :mission
end
