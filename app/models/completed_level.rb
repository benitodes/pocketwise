class CompletedLevel < ApplicationRecord
  belongs_to :user_course
  belongs_to :level
  after_save :release_money

  def release_money
    user = self.user_course.kid
    @wallet = user.kid_wallet
    @goal = @wallet.goals.where(complete: false).first
    @next_goal = @wallet.goals.where(complete: false)[1]
    if @goal.nil?
      @wallet.payout_amount = @wallet.total_allowance
    else
      @wallet.payout_amount = @wallet.total_allowance - @goal.goal_allowance
      remaining_for_goal = @goal.goal_price - @goal.goal_current_saving
      if remaining_for_goal >= @goal.goal_allowance
        @goal.goal_current_saving += @goal.goal_allowance
      else
        @goal.goal_current_saving += remaining_for_goal
        @goal.complete = true
        @exceeded_amount = @goal.goal_allowance - remaining_for_goal
        if @next_goal
          @next_goal.goal_current_saving = @exceeded_amount if @exceeded_amount.positive?
          @next_goal.save
        else
          @wallet.payout_amount += @exceeded_amount if @exceeded_amount.positive?
        end
      end
      @goal.save
      @wallet.save
    end
  end
end
