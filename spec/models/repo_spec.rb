require 'rails_helper'

RSpec.describe Repo, type: :model do
  it { should have_and_belong_to_many(:tools) }
  it { should have_and_belong_to_many(:users) }
  it { should have_many(:completions) }
end
