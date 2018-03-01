require "rails_helper"

RSpec.describe Speaker, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:language) }
  it { should have_db_index(:language_id) }
  it { should have_db_index(:user_id) }
end
