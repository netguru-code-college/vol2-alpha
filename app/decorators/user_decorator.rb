class UserDecorator < Draper::Decorator
  delegate_all

  def rating
    UserServices::AverageRating.new(object).call
  end

  def fullname
    "#{object.first_name} #{object.last_name}"
  end

  def find_author_name(author_id)
    User.find(author_id).decorate
  end

  def self.collection_decorator_class
    PaginatingDecorator
  end
end
