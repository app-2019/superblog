require 'test_helper'

class GenericControllerTest < ActionDispatch::IntegrationTest
  test "root URL should route to posts index" do
    assert_recognizes({controller: 'posts', action: 'index'}, {path: '/', method: :get})
  end
end
