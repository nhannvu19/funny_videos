module ApplicationHelper
  def header
    if user_signed_in?
      render 'layouts/auth_info'
    else
      render 'layouts/auth_form'
    end
  end
end
