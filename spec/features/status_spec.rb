require 'rails_helper'

describe 'User can CRUD statuses' do
  scenario 'User can create a status' do

    visit '/'

    click_on "Create New Status"

    fill_in 'status_status_message', :with => "Where did my tennis ball go?"
    fill_in 'status_user', :with => "Dog"

    click_on "Create Status"

    expect(page).to have_content("Status was successfully created.")
  end

    scenario 'User can view a show page for a status' do

      @status = Status.create(status_message: "Cowabunga!", user:"Bart Simpson")
          visit "/statuses/#{@status.id}"

      expect(page).to have_content @status.status_message
    end

    scenario 'User can edit a status' do

      @status = Status.create(status_message: "Cowabunga!", user:"Bart Simpson")
          visit "/statuses/#{@status.id}/edit"

          fill_in 'status_user', :with => "TMNT"

          click_on "Update Status"

      expect(page).to have_content ("Status was successfully updated.")
    end

    scenario 'User can delete a status' do

      @status = Status.create(status_message: "Cowabunga!", user:"Bart Simpson")
          visit "/"

          first(:link, 'Delete').click

      expect(page).to have_content ("Status was sucessfully deleted.")
    end

end
