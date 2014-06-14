class AdministrationController < ActionController::Base
    before_action :current_user
    before_filter :confirm_logged_in, :only => [:logout]

    def index
    end

    def login
    end

    def checkLogin
        if params[:nickname] == 'admin' && params[:password] == 'admin'
            session[:admin_logged_in] = true
            redirect_to administration_path
        else
            redirect_to administration_login_path, alert: "Password o Nickname errati"
        end
    end

    def logout
        session[:admin_logged_in] = nil
        redirect_to root_url
    end


    private
        def current_user
            @admin = session[:admin_logged_in] ? {
                :name => 'Admin'
            } : nil
        end

        def confirm_logged_in
          unless session[:admin_logged_in]
              redirect_to administration_login_path, :alert => "Please log in"
              return false
          else
              return true
          end
        end
end
