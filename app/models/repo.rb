class Repo < ActiveRecord::Base
  has_many :users
  has_many :tools
  has_many :completions
end
