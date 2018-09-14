require 'rails_helper'

require 'net/http'
require 'uri'
require 'json'
require 'jwt'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe '#changeAttendStatus' do
    it 'Status of attend is updated.' do
      token = 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjBmNTVkZWZlOWU5YzU2ZmRhZTRkOGY0MDFjZjQ5Njc4YzE2N2MzYWEifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vaW52aXRhdGlvbi1jYTRiMiIsImF1ZCI6Imludml0YXRpb24tY2E0YjIiLCJhdXRoX3RpbWUiOjE1MzY2MDg4OTAsInVzZXJfaWQiOiJCQm8yOU9IOEtXUlQ4dmZPTTBJRVdvTzdVTmMyIiwic3ViIjoiQkJvMjlPSDhLV1JUOHZmT00wSUVXb083VU5jMiIsImlhdCI6MTUzNjgzODI1NSwiZXhwIjoxNTM2ODQxODU1LCJlbWFpbCI6ImJiLndpbi4zQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJiYi53aW4uM0BnbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.GkJiYLNuvSU19OaCQ1ZtaBN9Vd5yrYBkLqH6UHQ1NzAw85wgECqMC0RZePNdb7NMwntHcwEVMhmSwTNmJtjZUXB5KMiVMoxEr97AetZZDJfeFiqepOjyL9qbF22nzrTqHY5DdyLU3kG_h_SWLFkGUzxFEa_rBFs8J80jkN6aywhm2jKf396OEn_pU4bpMrJly8X7BWrEIDxjo9edU0cA5KWbjryXE8IQBiAu8mBGK_ZlAfQLTZMYxLtrEbkOmLxY0q546bVcgef8wyBu-VEJJsze4aNQq1AfIQwe4xGP8ITJQvOnaWD1ndZayiz6iwXfEsmceAqGCeLqqOxQ1qvuXw'
      status = 1
      json_data = {'token': token, 'status': status}
      user = User.new(email: 'bb.win.3@gmail.com')
      user.save!
      user.changeAttendStatus(JSON.generate(json_data))
      expect( User.where(email: 'bb.win.3@gmail.com')[0].attributes['attend_status'] ).to eq 1
    end
  end
end
