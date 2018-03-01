require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_many(:levels) }
  it { should have_many(:technologies).through(:levels) }
  it { should have_many(:speakers) }
  it { should have_many(:languages).through(:speakers) }
  it { should have_many(:received_opinions).class_name("Opinion").with_foreign_key("user_id") }
  it { should have_many(:written_opinions).class_name("Opinion").with_foreign_key("author_id") }
  it { should have_many(:hosted_meetups).class_name("Meetup").with_foreign_key("author_id") }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
end
