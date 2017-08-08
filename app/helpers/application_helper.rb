module ApplicationHelper
  def login_helper
    unless current_user.is_a?(GuestUser)
      link_to "Logout", destroy_user_session_path, method: :delete
    else
      (link_to "Register", new_user_registration_path) +
      "<br>".html_safe +
      (link_to "Login", new_user_session_path)
    end
  end
  
  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting our website from #{session[:source]}"
      content_tag(:p, greeting, class: "source_greeting")
    end
  end
  
  def currency(amount)
    number_to_currency(amount, unit: "RMB")
  end
end
