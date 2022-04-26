# frozen_string_literal: true

class BulletinPolicy < ApplicationPolicy
  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def moderate?
    record.user == user
  end

  def archive?
    record.user == user
  end
end
