class SignupController < ApplicationController
  layout 'application.user', except: [:profile]

  def index
  end

  def profile
    render layout: 'application.user'
    @user = User.new
  end
end
