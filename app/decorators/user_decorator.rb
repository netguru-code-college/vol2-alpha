class UserDecorator < Draper::Decorator
  delegate_all

  def fullname
    "#{object.first_name} #{object.last_name}"
  end

  def find_author_name(author_id)
    object.find(author_id)
  end
end
