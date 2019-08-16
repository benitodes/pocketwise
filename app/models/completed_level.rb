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
      @goal.goal_current_saving += @goal.goal_allowance
      if @goal.goal_current_saving >= @goal.goal_price
        @goal.complete = true
        @exceeded_amount = @goal.goal_current_saving - @goal.goal_price
        if @next_goal
          @next_goal.goal_current_saving = @exceeded_amount if @exceeded_amount > 0
          @next_goal.save
        else
          @wallet.payout_amount += @exceeded_amount if @exceeded_amount > 0
        end
      end
      @goal.save
    end
    @wallet.save
  end
end
