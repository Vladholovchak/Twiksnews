# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    admin_user? && activated_user?
  end

  def show?
    admin_user? || @user == @current_user
  end

  def create?
    admin_user? && activated_user?
  end

  def new?
    create?
  end

  def update?
    admin_user? && activated_user?
  end

  def edit?
    update?
  end

  def destroy?
    admin_user? && activated_user?
  end

  def fetch_news?
    activated_user?
  end

  def fetch_sources?
    admin_user? && activated_user?
  end
end
