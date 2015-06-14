class Tool < ActiveRecord::Base
  has_and_belongs_to_many :repos
  has_and_belongs_to_many :users
  has_many :missions

  def to_builder
    Jbuilder.new do |tool|
      tool.(self, :id, :name, :primary_color, :secondary_color, :description, :url, :mission_ids)
    end
  end
end
