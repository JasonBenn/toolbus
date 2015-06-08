class ReposUsers < ActiveRecord::Base
  belongs_to :repo
  belongs_to :user
end
