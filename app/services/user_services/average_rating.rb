module UserServices
  class AverageRating
    def initialize(user)
      @user = user
    end

    def call
      avg = 0
      ratings = @user.received_opinions.pluck(:rating)
      avg = ratings.sum / ratings.size.to_f if ratings.size > 0
      avg.round(2)
    end
  end
end
