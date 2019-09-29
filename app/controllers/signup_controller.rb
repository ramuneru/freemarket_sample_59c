class SignupController < ApplicationController
  layout 'application.user', except: [:profile]

  def index
  end

  def profile
    @user = User.new
    render layout: 'application.user'
  end

  def phone
  end

  def phone_authen
  end

  def address
  end

  def credit
  end

  def complete
  end

  private
    def user_params
    end
end
