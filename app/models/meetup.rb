# == Schema Information
#
# Table name: meetups
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  location      :string
#  date          :datetime
#  technology_id :integer
#  language_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  author_id     :integer
#  lat           :string
#  lng           :string
#
# Indexes
#
#  index_meetups_on_author_id      (author_id)
#  index_meetups_on_language_id    (language_id)
#  index_meetups_on_technology_id  (technology_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (language_id => languages.id)
#  fk_rails_...  (technology_id => technologies.id)
#

class Meetup < ApplicationRecord
  belongs_to :technology
  belongs_to :language
  belongs_to :author, foreign_key: "author_id", class_name: "User"

  scope :queried, -> (query) { includes(:technology).where(technologies: { name: query } ) }

  def info_html_text
    "<b><a href='/'>#{title}</a></b><br>#{description}<br><b>Event date:</b> #{date.strftime("%Y-%m-%d at %H:%M")}<br>We will teach you <b>#{technology.name}</b> in <b>#{language.name}</b>"
  end
end
