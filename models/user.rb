class User < ActiveRecord::Base
  has_many :articles

  validates :username, presence: {message: '用户名不能为空！'}

  def register(username, name, password, email, gender)
    User.create!(username: username, name: name, encrypted_password: password, email: email, gender: gender)
  end

  def login(username, password)
    User.find_by(username: username, encrypted_password: password)
  end

  def update_user(username, old_password, name, new_password, email, gender)
    flag = User.find_by(encrypted_password: old_password)
    flag.update_attributes(username: username, name: name, encrypted_password: new_password, email: email, gender: gender)
  end
end