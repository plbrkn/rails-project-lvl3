class AddAdmins < ActiveRecord::Migration[6.1]
  def change
    User.find_by(email: 'pavel.polubarkin@gmail.com').update(admin: true)
  end
end
