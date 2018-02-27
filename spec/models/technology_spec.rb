require 'rails_helper'

RSpec.describe Technology, type: :model do
  it { should have_many(:levels) }
  it { should have_many(:users).through(:levels) }
  it { should belong_to(:category) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:category) }
  it { should have_db_index(:category_id) }
end
