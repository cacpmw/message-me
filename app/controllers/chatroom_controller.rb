# frozen_string_literal: true

class ChatroomController < ApplicationController
  before_action :require_user
  def index
    @message = Message.new
    @messages = Message.last(10)
  end
end
