require "test_helper"

class UserTest < ActiveSupport::TestCase

  test 'valid user' do
    user = User.new(email: 'test@example.com', password: 'Password123', password_confirmation: 'Password123')
    assert user.valid?
  end

  test 'invalid password' do
    user = User.new(email: 'test@example.com', password: '123', password_confirmation: '123')
    refute user.valid?
    assert_not_nil user.errors[:password]
  end

  test 'email already taken' do
    user = User.new(email: 'okoczek@gmail.com', password: 'Password123', password_confirmation: 'Password123')
    refute user.valid?
    assert_not_nil user.errors[:email]
  end

  test 'password confirmation does not match password' do
    user = User.new(email: 'test@example.com', password: 'Password123', password_confirmation: 'Different123')
    refute user.valid?
    assert_not_nil user.errors[:password_confirmation], 'Password confirmation does not match password'
  end

end
