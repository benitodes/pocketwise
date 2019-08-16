class CompletedLevel < ApplicationRecord
  belongs_to :user_course
  belongs_to :level
  after_save :release_money

  def release_money
    user = self.user_course.kid
    @wallet = user.kid_wallet
    @goal = @wallet.goals.first
    if @goal.nil?
      @wallet.payout_amount = @wallet.total_allowance
    else
      @wallet.payout_amount = @wallet.total_allowance - @goal.goal_allowance
      @goal.goal_current_saving += @goal.goal_allowance
      if @goal.goal_current_saving >= @goal.goal_price
        @goal.complete == true
      end
      @goal.save
    end
    @wallet.save
  end
end
