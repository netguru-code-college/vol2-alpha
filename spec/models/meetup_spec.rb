require "rails_helper"

RSpec.describe Meetup, type: :model do
  it { should belong_to(:technology) }
  it { should belong_to(:language) }
  it { should belong_to(:author).with_foreign_key("author_id") }
end
