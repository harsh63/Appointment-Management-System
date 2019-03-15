# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    redirect
  end

  def redirect
    if current_user.has_role? :admin
      redirect_to dashboard_path
    elsif current_user.has_role? :doctor
      redirect_to dashboard_path
    else
      redirect_to services_path
    end
  end
end
