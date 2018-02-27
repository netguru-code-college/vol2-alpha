require 'rails_helper'

RSpec.describe Language, type: :model do
  it { should have_many(:speakers) }
  it { should have_many(:users).through(:speakers) }
  it { should validate_presence_of(:name) }
end
