class ApplicationPolicy
  attr_reader :user, :current_user

  def initialize(user, current_user)
    @user = user
    @current_user = current_user

  end

  def index?
     true
  end

  def show?
    true
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  protected

   def admin_user?
     user.present? && user.admin?
   end

  def redactor_user?
    user.present? && user.redactor?
  end

  def deactivated_user?
    user.present? && user.deactivated?
  end

  def activated_user?
    user.present? && user.activated?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
