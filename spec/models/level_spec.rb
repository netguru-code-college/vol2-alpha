require 'rails_helper'

RSpec.describe Level, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:technology) }
  it { should validate_presence_of(:level) }
  it { should have_db_index(:technology_id) }
  it { should have_db_index(:user_id) }
end
