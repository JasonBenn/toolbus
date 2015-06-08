class ReposTools < ActiveRecord::Base
  belongs_to :repo
  belongs_to :tool
end
