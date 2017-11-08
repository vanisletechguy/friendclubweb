class PostPolicy < ApplicationPolicy
  cattr_accessor :current_user

  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
  end

  def new_post?
    current_user.present?
  end

  def new?
    current_user.present?
  end

  def create?
      current_user.present?
  end
  def edit?
    record.user_ids.include? user.id
  end

  def destroy?
    user.admin == true || record.user_id == user.id
  end
end