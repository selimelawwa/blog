require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
    def setup
        @category = Category.create(name: "sports")
        @user = User.create(username:"sollom",email:"selim123@abc.com",encrypted_password:"12345",admin: true)
    end
    test "should get categories index" do
        get :index
        assert_response :success
    end

    test "should get new" do
        session[:user_id] = @user.id
        get :new
        assert_response :success
    end

    test "should get show" do
        get :show, params: { id: @category.id }
        assert_response :success
    end
    test "should redirect create when admin not logged in" do
        assert_no_difference 'Category.count' do
            post :create, params: { category: {name: @category.name } } 
            
        end 
        assert_redirected_to categories_path

    end 

end