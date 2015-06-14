class Tool < ActiveRecord::Base
  has_and_belongs_to_many :repos
  has_many :missions

  def users
    User.joins(completions: { mission: :tool }).where('tools.id = ?', id)
  end
end
