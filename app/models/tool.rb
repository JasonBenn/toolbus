class Tool < ActiveRecord::Base
  has_many :repos
  has_many :missions

  def to_builder
    Jbuilder.new do |tool|
      tool.(self, :name, :primary_color, :secondary_color, :description, :url)
    end
  end
end
