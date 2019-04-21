class ArticlePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    index?
  end

  def create?
    admin_user? && activated_user?
  end

  def new?
    create?
  end

  def update?
    admin_user? && activated_user? || redactor_user? && activated_user?
  end

  def edit?
    update?
  end

  def destroy?
    admin_user? && activated_user?
  end
end