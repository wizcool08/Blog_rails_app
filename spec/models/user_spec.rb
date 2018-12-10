require 'rails_helper'

describe User do
  it 'username length less than 3 characters is invalid' do
    user = User.new(username: 'do', email: 'bugs@gmail.com', password: 'password')
    result = user.save
    expect(result).to be(false)
  end

  it 'username length must be at-least 3 characters' do
    user = User.new(username: 'kimyong', email: 'bugs@gmail.com', password: 'password')
    result = user.save
    expect(result).to be(true)
  end

  it 'username must be unique' do
    user = User.new(username: 'kimyong', email: 'bugs@gmail.com', password: 'password')
    user.save

    u = User.new(username: 'kimyong', email: 'bugs2@gmail.com', password: 'password')
    u.save

    expect(u.errors.full_messages).to eq(['Username has already been taken'])
  end

  it 'email must be unique' do
    user = User.new(username: 'kimyong', email: 'bugs@gmail.com', password: 'password')
    user.save

    u = User.new(username: 'kimyong2', email: 'bugs@gmail.com', password: 'password')
    u.save

    expect(u.errors.full_messages).to eq(['Email has already been taken'])
  end

  it 'email with invalid format is invalid' do
    user = User.new(username: 'kimyong', email: 'bugs', password: 'password')
    user.save

    expect(user.errors.full_messages).to eq(['Email is invalid'])
  end

  it 'password length less than 5 characters is invalid' do
    user = User.new(username: 'kimyong', email: 'bugs@gmail.com', password: '123')
    result = user.save
    expect(result).to be(false)
  end

  it 'has no errors for valid email format' do
    user = User.new(username: 'kimyong', email: 'kimyong@gmail.com', password: 'password')
    user.save
    expect(user.errors.full_messages).to match_array([])
  end
end