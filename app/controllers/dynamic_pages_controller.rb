class DynamicPagesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, :login, :signup, :signup_rest, :signup_user, :home]

    def profile
        if user_signed_in?
            if current_user.rest 
                if Restaurant.find_by_user_id(current_user.id) != nil
                    render "profile-resto.html.erb"
                else
                    redirect_to restaurant_new_path
                end

            else
                render "profile.html.erb"
            end
        else
            redirect_to index_path
        end 
    end

    def index
    end

    def signup
    end

    def home
        if user_signed_in?
            if current_user.rest && Restaurant.find_by_user_id(current_user.id) == nil
                redirect_to restaurant_new_path
            else
            redirect_to profile_path
            end 
        else
            redirect_to index_path
        end
    end

    def delivery
        if !user_signed_in?
            redirect_to index_path
        elsif current_user.rest && Restaurant.find_by_user_id(current_user.id) == nil
            redirect_to restaurant_new_path
        end

    end

    def favorite
        if !user_signed_in?
            redirect_to index_path
        elsif current_user.rest && Restaurant.find_by_user_id(current_user.id) == nil
            redirect_to restaurant_new_path
        end
    end

    def payment
        if !user_signed_in?
            redirect_to index_path
        elsif current_user.rest && Restaurant.find_by_user_id(current_user.id) == nil
            redirect_to restaurant_new_path
        end
    end
    def settings
        if !user_signed_in? 

            redirect_to index_path
        elsif current_user.rest && Restaurant.find_by_user_id(current_user.id) == nil
            redirect_to restaurant_new_path
        end
    end
    def restaurant
        if user_signed_in?
            render "restaurant.html.erb"
        else
            redirect_to login_path
        end
    end
end
