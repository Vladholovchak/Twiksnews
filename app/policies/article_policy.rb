class ArticlePolicy < ApplicationPolicy

  def index?
   true
  end

  def show?
    true
  end

  def create?
    admin_user?
  end

  def new?
    admin_user?
  end

  def update?
    admin_user? || redactor_user?
  end

  def edit?
    update?
  end

  def destroy?
    admin_user?
  end
end