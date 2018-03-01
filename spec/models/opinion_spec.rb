require "rails_helper"

RSpec.describe Opinion, type: :model do
  it { should belong_to(:user).with_foreign_key("user_id") }
  it { should belong_to(:author).with_foreign_key("author_id") }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:rating) }
  it { should have_db_index(:author_id) }
  it { should have_db_index(:user_id) }
end
