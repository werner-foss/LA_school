module ApplicationHelper
  def login_helper style = ''
    unless current_user.is_a?(GuestUser)
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    else
      (link_to "Register", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)
    end
  end
  
  def mail_viewer style = ''
    if logged_in?(:site_admin)
     link_to "View mails", letter_opener_web_path, class: style
    end
  end
  
  def nav_items
    [
      { url: root_path, title: 'Home', style: 'c1'},
      { url: courses_path, title: 'Courses', style: 'c2'},
      { url: contacts_path, title: 'Contact Us', style: 'c3'},
      { url: about_path, title: 'About', style: 'c4'},
      { url: news_index_path, title: 'News', style: 'c5'},
      { url: questions_path, title: 'FAQ', style: 'c6'}
    ]
  end
  
  def nav_helper style, tag_type
    nav_links=''
    nav_items.each do |item|
      nav_links << "<#{tag_type} class='#{item[:style]}'><a href='#{item[:url]}' class='#{style}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
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
