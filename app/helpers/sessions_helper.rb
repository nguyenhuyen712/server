module SessionsHelper
  def log_in admin
    session[:admin_id] = admin.id
  end

  def current_admin
    if admin_id = session[:admin_id]
      @current_user ||= Admin.find_by id: admin_id
    elsif admin_id = cookies.signed[:admin_id]
      admin = Admin.find_by id: admin_id
      if admin && admin.authenticated?(:remember, cookies[:remember_token])
        log_in admin
        @current_admin = admin
      end
    end
  end

  def remember admin
    admin.remember
    cookies.permanent.signed[:admin_id] = admin.id
    cookies.permanent[:remember_token] = admin.remember_token
  end

  def forget admin
    admin.forget
    cookies.delete :admin_id
    cookies.delete :remember_token
  end

  def log_out
    forget current_user
    session.delete :user_id
    @current_user = nil
  end

  def logged_in?
    current_admin.present?
  end
end
