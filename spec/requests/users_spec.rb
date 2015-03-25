require "rails_helper"

describe "Users" do

  it "should render views/users/new" do
    get new_user_path
    expect(response).to render_template(:new)
  end

  it "should have content 'Реєстрація'" do
    get new_user_path
    expect(response.body).to include("Реєстрація")
  end

end