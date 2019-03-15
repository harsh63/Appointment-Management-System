# frozen_string_literal: true

class User < ApplicationRecord
  after_create :assign_default_role
  rolify

  def assign_default_role
    add_role(:patient)
  end

  def redirect
    case current_user.roles
    when :admin
      redirect_to dashboard_path
    when :doctotor
      redirect_to dashboard_path
    else
      redirect_to services_path

    end
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
