class StaticPagesController < ApplicationController
  def home
    @pending = current_user.friended_users.to_a + current_user.frienders.to_a
    @friends = current_user.friends
  end
end
