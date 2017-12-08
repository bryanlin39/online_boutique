class PagesController < ApplicationController

  def home
  end

  def profile
    @user = current_user
    @account = current_user.account
  end

end
