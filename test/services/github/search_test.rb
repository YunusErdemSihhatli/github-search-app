require "test_helper"

class GithubSearhTest < ActiveSupport::TestCase

  test "should get response" do
    res_body = Github::Searh.new(name: 'ruby').call
    assert res_body['total_count'].present?
    assert res_body['items'].present?
  end

end
