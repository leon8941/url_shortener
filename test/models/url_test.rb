require "test_helper"

class UrlTest < ActiveSupport::TestCase
  test "valid url" do
    assert_not_nil @user.id
    
    @user.urls.each do |url|
      assert_not_nil url.id
    end
  end

  test "invalid short url more than 15 characters" do
    @user.urls.each do |url|
      url.short_url = "5qap5ao4i9a6db598y4zi9aaobt"

      assert_not url.save
    end
  end

  def setup
    @user = users(:john)
  end
end
