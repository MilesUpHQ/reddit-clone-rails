require 'test_helper'

class CommunitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @community = communities(:one)
  end

  test 'should get index' do
    get communities_url, as: :json
    assert_response :success
  end

  test 'should create community' do
    assert_difference('Community.count') do
      post communities_url,
           params: { community: { account: @community.account, name: @community.name, rules: @community.rules, total_members: @community.total_members, url: @community.url } }, as: :json
    end

    assert_response 201
  end

  test 'should show community' do
    get community_url(@community), as: :json
    assert_response :success
  end

  test 'should update community' do
    patch community_url(@community),
          params: { community: { account: @community.account, name: @community.name, rules: @community.rules, total_members: @community.total_members, url: @community.url } }, as: :json
    assert_response 200
  end

  test 'should destroy community' do
    assert_difference('Community.count', -1) do
      delete community_url(@community), as: :json
    end

    assert_response 204
  end
end
