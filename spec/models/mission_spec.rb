require 'rails_helper'

RSpec.describe Mission, type: :model do
  it { should belong_to(:tool) }
  it { should have_many(:completions) }
end
