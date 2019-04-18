class UserPolicy < ApplicationPolicy

  def index?
    admin_user?
  end

  def show?
    admin_user?
  end

  def create?
    admin_user?
  end

  def new?
    create?
  end

  def update?
    admin_user?
  end

  def edit?
    update?
  end

  def destroy?
    admin_user?
  end

  def fetch_news?
    true
  end

  def fetch_sources?
    admin_user?
  end

end