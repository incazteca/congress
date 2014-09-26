class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    redirect_to :back, alert: 'Access Denied' unless @user == curent_user

    @bill_tags = Tag.where('user_id = ? AND tag_type_id = ?',
                           @user.id, TagType.find_by(tag_type: 'bill'))

    @legislator_tags = Tag.where('user_id = ? AND tag_type_id = ?',
                                 @user.id, TagType.find_by(tag_type: 'legislator'))
  end
end
