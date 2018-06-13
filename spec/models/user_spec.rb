require 'rails_helper'

describe User do
  describe 'attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:google_auth_token) }
  end
  describe 'methods' do
    it '#update_or_create' do
      auth = {
        'provider' => 'google_oauth2',
        'uid' => '123123123123',
        'info' =>
            { 'name' => 'Kelly Schroeder',
              'email' => 'kellyrschroeder@gmail.com',
              'first_name' => 'Kelly',
              'last_name' => 'Schroeder',
              'image' => 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg',
              'urls' => { 'Google' => 'https://plus.google.com/103996086299667923542' } },
        'credentials' => { 'token' => 'definitelysomefaketoken', 'expires_at' => 1_527_533_604, 'expires' => true },
        'extra' =>
            { 'id_token' =>
                'definitelyanotherfaketokenidtokenthing',
              'raw_info' =>
                  { 'id' => '123123123123123123123123',
                    'email' => 'kellyrschroeder@gmail.com',
                    'verified_email' => true,
                    'name' => 'Kelly Schroeder',
                    'given_name' => 'Kelly',
                    'family_name' => 'Schroeder',
                    'link' => 'https://plus.google.com/103996086299667923542',
                    'picture' => 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg',
                    'gender' => 'male',
                    'locale' => 'en' } }
      }
      user = User.update_or_create(auth)

      expect(user).to be_instance_of(User)
      expect(user.name).to eq('Kelly Schroeder')
      expect(user.email).to eq('kellyrschroeder@gmail.com')
      expect(user.google_auth_token).to eq('definitelysomefaketoken')
    end
  end
end
