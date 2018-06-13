def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(auth_hash)
end

def auth_hash
{  'provider' => 'google_oauth2',
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
              'locale' => 'en' } }}
end
