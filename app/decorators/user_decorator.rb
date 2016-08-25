class UserDecorator < Draper::Decorator
  delegate_all

  def user_course_last_actived
    courses.last
  end

  def allow_access_admin
    roles.each do |role|
      return true if role.allow_access_admin
    end
    false  
  end
end
