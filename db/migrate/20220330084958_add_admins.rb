class AddAdmins < ActiveRecord::Migration[6.1]
  def change
    User.find_or_create_by(email: 'pavel.polubarkin@gmail.com', name: 'ppa').update(admin: true)
  end
end
