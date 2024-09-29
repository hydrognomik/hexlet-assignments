require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  self.use_transactional_tests = true

  test 'opens all bulletins page' do
    get bulletins_path
    assert_response :success
    assert_select 'h1', 'All Bulletins'
  end

  test 'opens one bulletin page' do
    get bulletin_path(bulletins(:bulletin1))
    assert_response :success
    assert_select 'h1', 'First Bulletin'
    assert_select 'p', 'This is the first bulletin'
  end
end