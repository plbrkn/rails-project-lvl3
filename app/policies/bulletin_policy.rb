# frozen_string_literal: true

class BulletinPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    user
  end

  def create?
    user
  end

  def show?
    true
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def moderate?
    record.user == user && record.draft?
  end

  def archive?
    (record.user == user || user&.admin?) && !record.archived?
  end
end
