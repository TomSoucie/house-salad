require 'rails_helper'
=begin
As a user
When I visit "/"
And I select "Colorado" from the dropdown
And I click on "Locate Members from the House"
Then my path should be "/search" with "state=CO" in the parameters
And I should see a message "7 Results"
And I should see a list of 7 the members of the house for Colorado
And they should be ordered by seniority from most to least
And I should see a name, role, party, and district for each member
=end
describe "API returns members of congress by State" do
  context "when a user searches via the dropdown" do
    it "searches by state" do
      visit "/"
      select "Colorado", from: :state, :match => :first
      click_on "Locate Members of the House"
      expect(current_path).to eq('/search')
      expect(params).to have_content({"state" => "CO"})
      expect(page).to have_content("7 Results")
      expect(page).to have_selector(".member", count: 7)
      #expect 'members' to be listed in order seniority
      expect(page).to have_selector(".member_name")
      expect(page).to have_selector(".member_role")
      expect(page).to have_selector(".member_party")
      expect(page).to have_selector(".member_district")
    end
  end
end
