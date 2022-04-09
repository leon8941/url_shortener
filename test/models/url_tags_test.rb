require "test_helper"

class UrlTagsTest < ActiveSupport::TestCase
  test "valid url tags" do
    assert_not_nil @user.id

    @user.urls.each do |url|
      assert_not_nil url.id

      url.url_tags.each do |tag|
        assert_not_nil tag.id
        assert_not_nil tag.title
      end
    end
  end

  test "test save when title duplicate under same url" do
    url = @user.urls.joins(:url_tags).where(url_tags: { title: "bestadvice" }).first
    url_tags = url.url_tags
    
    assert_not url_tags.create(title: "bestadvice").id
    assert url_tags.create(title: "techstuffs").id
  end

  def setup
    @user = users(:john)
  end
end
