# == Schema Information
#
# Table name: speakers
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  language_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_speakers_on_language_id  (language_id)
#  index_speakers_on_user_id      (user_id)
#

class Speaker < ApplicationRecord
  belongs_to :user
  belongs_to :language
end
