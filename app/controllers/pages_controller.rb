class PagesController < ApplicationController

  def home
  end

  def profile
    @account = current_user.account
  end

end
