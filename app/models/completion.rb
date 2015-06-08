class Completion < ActiveRecord::Base
  belongs_to :mission
  belongs_to :repo
end
