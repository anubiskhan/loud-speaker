require 'rails_helper'
require './spec/stubs/omni_auth_stub'

describe 'User' do
  it 'logs in via google auth' do
    stub_omniauth

    visit '/'

    click_on 'Log In'

    expect(page).to have_content('Kelly Schroeder')
    expect(page).to have_link('Log Out')
  end
  it 'logs out' do
    stub_omniauth

    visit '/'

    click_on 'Log In'
    click_on 'Log Out'

    expect(page).to_not have_content('Kelly Schroeder')
  end
end
