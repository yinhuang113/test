require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign Up') }
    it { should have_selector('title', text: 'Sign Up') }
  end

  describe "login page" do
    before { visit login_path }

    it { should have_selector('h1',    text: 'Log In') }
    it { should have_selector('title', text: 'Log In') }
  end
end
