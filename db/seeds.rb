Admin.destroy_all
User.destroy_all

names = %w(Joshua Jeremy Chris Misty Ryan)

names.each do |name|
  Admin.create(name: name, is_admin: 1)
  User.create(name: name, email: "#{name.downcase}@kalkomey.com", ssn: "9999999999")
end