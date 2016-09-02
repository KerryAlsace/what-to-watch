require 'spec_helper'

describe 'User' do
  before do
    @user = User.create(display_name: "Testy McTesterton", username: "testyt 42", password: "test")
  end

  it 'can slug the username' do
    expect(@user.slug).to eq("testyt-42")
  end

  it 'can find a user based on the slug' do
    slug = @user.slug
    expect(User.find_by_slug(slug).username).to eq("testyt 42")
  end

  it 'has a secure password' do
    expect(@user.authenticate("dog")).to eq(false)
    expect(@user.authenticate("test")).to eq(@user)
  end


end
