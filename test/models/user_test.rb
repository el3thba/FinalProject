require 'test_helper'

class UserTest < ActiveSupport::TestCase


  setup :initialize_user
    test "should be valid" do 
    assert @user.valid?
  end


  test "email should be present" do 
    @user.email=""
    assert_not @user.valid?
  end
  
  test "email address is not too long" do 
    @user.email= "a"*255+"@cmu.edu"
    assert_not @user.valid?
  end 
  
  test "email validation should accept valid addresses" do
    valid_addresses=%w[user@example.com USER@foo.COM a_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do|valid_address|
      @user.email=valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should not accept invalid addresses" do
    invalid_addresses=%w[user@example,com user_at_foo.COM user.name@example. foo@bar_baz.com ]
    invalid_addresses.each do|invalid_address|
      @user.email=invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be valid"
    end
  end
  
  test "email addresses should be unique and case insensitive" do 
    duplicate_user= User.new(email: @user.email.upcase, password:"uniquepassword", password_confirmation: "uniquepassword")
    assert_not duplicate_user.valid?
  end
  
  test "password should have a minimum length" do 
    @user=User.new 
    @user.email="newemail@cmu.edu"
    @user.password=@user.password_confirmation="a"*5
    assert_not @user.valid?
    
  end
  
  private 
  
  def initialize_user
    @user=users(:one)
    @user.password=@user.password_confirmation="password"
  end
  
end
