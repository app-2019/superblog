require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:good_post)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "header h2", text: "Latest Posts"
  end

  test "creating a Post" do
    visit posts_url
    click_on "New Post"

    fill_in "Content", with: @post.content
    fill_in "Slug", with: @post.slug
    fill_in "Title", with: @post.title
    click_on "Save"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "updating a Post" do
    visit posts_url
    click_on "Edit", match: :first

    fill_in "Content", with: @post.content
    fill_in "Slug", with: @post.slug
    fill_in "Title", with: @post.title
    click_on "Save"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "destroying a Post" do
    visit posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post was successfully destroyed"
  end
end
