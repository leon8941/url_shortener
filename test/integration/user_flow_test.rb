require "test_helper"

class UserFlowTest < ActionDispatch::IntegrationTest
  test "can see the home page" do
    get "/"
    assert_select "a", "CoinGecko URL Shortener"
  end

  test "can register" do
    get "/registers"
    assert_response :success

    ann = users(:ann)
    post "/registers", params: { 
      user: {
        first_name: "james",
        last_name: "cordan",
        email: "jamescordan@example.com",
        password: "123456"
      }
    }

    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

end
