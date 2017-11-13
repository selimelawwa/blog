require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

    def setup
      @category = Category.create(name: "books")
      @category2 = Category.create(name: "programming")
    end
    
    test "should show categroy listing" do
        get categories_path
        assert_template 'categroies/index' 
        assert_template layout: "layouts/application"
        assert_template partial: "layouts/_navigation"
        assert_template partial: "layouts/_footer"
        #assert_template layout: "layouts/application", partial: "layouts/_navigation", partial: "layouts/_footer"
        #assert_template layout: "layouts/application", partial: "layouts/_footer"
        
        assert_select "a[href=?]", category_path(@category), text: @category.name
        assert_select "a[href=?]", category_path(@category2), text: @category2.name
    end
end