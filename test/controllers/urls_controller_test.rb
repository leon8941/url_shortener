require "test_helper"

class UrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url = urls(:ann_url_1)
  end
  
  test "should get new" do
    get new_url_url
    assert_equal "new", @controller.action_name
    assert_match "Url", @response.body
  end

  test "should create url" do
    sign_in_as(users(:ann), '123456')

    assert_difference("Url.count") do
      post urls_url, params: { 
        url: { 
          target_url: 'https://www.youtube.com/watch?v=NUYvbT6vTPs'
        }
      }
    end

    assert_not Url.first.nil?
    
    assert_redirected_to root_url
  end

  test "should show url" do
    get url_url(@url)
    assert_response :success
  end

  test "should get edit" do
    get edit_url_url(@url)
    assert_response :success
  end

  test "should update url" do
    patch url_url(@url), params: {
      url: {
        target_url: 'https://guides.rubyonrails.org/testing.html'
      }
    }
    assert_redirected_to root_url
  end

  test "should destroy url" do
    assert_difference("Url.count", -1) do
      delete url_url(@url)
    end

    assert_response :success
  end
end
