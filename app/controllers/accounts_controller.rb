class AccountsController < ApplicationController

  def show
    @user = current_user
    @account = @user.account
  end

end
