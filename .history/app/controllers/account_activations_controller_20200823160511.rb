class AccountActivationsController < ApplicationController
  def edit
    user = User.find(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update_attribute(:activated, true)
      user.update_attribute(:activated_at, Time.zone.now)
      log_in user
    else

    end
  end
end
