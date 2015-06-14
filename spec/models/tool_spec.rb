require 'rails_helper'

RSpec.describe Tool, type: :model do
  it { should have_and_belong_to_many(:repos) }
  it { should have_many(:missions) }

  it "should be able to calculate the users that have completed things with that tool" do
    rails = FactoryGirl.create(:tool)
    jbenn = FactoryGirl.create(:user, username: 'jbenn')
    bob = FactoryGirl.create(:user, username: 'bob')
    scopes_mission = FactoryGirl.create(:mission)
    scopes_mission.update(tool_id: rails.id)
    jbenn_did_it = FactoryGirl.create(:completion)
    jbenn_did_it.update(mission_id: scopes_mission.id, user_id: jbenn.id)
    bob_did_it = FactoryGirl.create(:completion)
    bob_did_it.update(mission_id: scopes_mission.id, user_id: bob.id)
    expect(rails.users).to eq([jbenn, bob])
  end
end
