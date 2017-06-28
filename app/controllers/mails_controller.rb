class MailsController < ApplicationController
  require 'gmail'


  def gmails
    begin
      @gmail = Gmail.connect(:xoauth2, current_user.email, current_user.oauth_token)
      if params[:search]
        @mails = @gmail.inbox.emails(gm: params[:search])
      elsif params[:par]
        respond_to do |format|
          format.js
        end
        # redirect_to action: 'body', para: @gmail and return
      else
        @mails = @gmail.mailbox(:all).all
      end
    rescue => e
      e.message
    end
  end


  def login
  end

end
