require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @micropost = microposts(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_differences 'Micropost.count' do
      post microposts_path, params: { micropost: { content: "Lorem ipsum"}}
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not loggend in" do
    assert_no_differences 'Micropst.count' do
      delete micropost_path(@micropost)
    end
    assert_redirected_to login_url
  end
end
