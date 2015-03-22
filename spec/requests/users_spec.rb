# coding: utf-8
require 'rails_helper'

describe "Users" do

  describe "New user" do
    it "should have content 'Реєстрація'" do
      get new_user_path
      expect(page).to have_content('Реєстрація')
    end
  end

end
