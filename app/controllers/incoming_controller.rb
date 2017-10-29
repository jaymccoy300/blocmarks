class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    User.where(email: params[:sender])
    @user_email = params[:sender]
    @topic_title = params[:subject]
    @url = params[:body]

    if User.where(email: @user_email).nil?
      User.create!(username: "Default", email: @user_email, password: "password")
    else
      @user = User.where(email: @user_email)
    end

    if Topic.where(title: @topic_title).nil?
      Topic.create!(title: @topic_title, user: @user)
    else
      @topic = Topic.where(title: @topic_title, user_id: @user.id)
    end

    Bookmark.create!(
      url: @url,
      description: "Default description",
      topic: @topic
    )

    head 200
  end
end
