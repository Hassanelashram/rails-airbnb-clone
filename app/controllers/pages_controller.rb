class PagesController < ApplicationController
  def home
    @cars = Car.all.limit(6)
  end

  def feed
    @followings = Relationship.where(follower_id: current_user.id)
    @ids = find_all_users_followed(@followings)
    @users = User.find(@ids)
  end

  def profile
    @user = User.find(params[:id])
    @followers = Relationship.where(followed_id: @user.id)
    @rel = @followers.find_by(follower_id: current_user.id)
  end

  def dashboard
    @bookings = current_user.bookings
    @cars = current_user.cars
    @total_spent = total_spent_counter
    @total_earned = total_earnings_counter
    @followers = Relationship.where(followed_id: current_user.id)
  end

  def favorites
  end

  def follow
    other_user = User.find(params[:id])
    @rel = Relationship.new(follower_id: current_user.id, followed_id: other_user.id)
    @rel.save
    redirect_to profile_path(other_user)
    flash[:success] = "You followed #{other_user.name}"
  end

  def cars
  end
private

  def find_all_users_followed(record)
    ids = []
    record.each do |instance|
      ids << instance.followed_id
    end
    return ids
  end

  def total_spent_counter
    total = []
    current_user.bookings.each do |booking|
      end_date = booking.end_date.day
      start_date = booking.start_date.day
      total << booking.car.price * (end_date - start_date)
    end
    return total.sum
  end

  def total_earnings_counter
    total = []
    current_user.cars.each do |car|
      car.bookings.each do |booking|
        end_date = booking.end_date.day
        start_date = booking.start_date.day
        total << booking.car.price * (end_date - start_date)
      end
    end
    return total.sum
  end
end
