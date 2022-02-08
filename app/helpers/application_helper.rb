module ApplicationHelper
  def login_helper
    if current_user.blank?
      (link_to "Log in", new_user_session_path) +
      " or ".html_safe +
      (link_to "Sign up", new_user_registration_path)
    else
      "Welcome back ".html_safe +
      (link_to current_user.name, current_user) +
      " | ".html_safe +
      (link_to "Log out", destroy_user_session_path, method: :delete)
    end
  end
end
