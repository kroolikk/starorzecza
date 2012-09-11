# -*- encoding: utf-8 -*-
class NewsletterUsersController < AdminController

  def index
    @newsletter_users = NewsletterUser.all
  end

  def show
    @newsletter_user = NewsletterUser.find(params[:id])
  end

  def new
    @newsletter_user = NewsletterUser.new
  end

  def edit
    @newsletter_user = NewsletterUser.find(params[:id])
  end

  def create
    @newsletter_user = NewsletterUser.new(params[:newsletter_user])

      if @newsletter_user.save
        redirect_to newsletter_users_url, notice: 'News został dodany'
      else
        render action: "new"
      end
  end

  def update
    @newsletter_user = NewsletterUser.find(params[:id])

      if @newsletter_user.update_attributes(params[:newsletter_user])
        redirect_to newsletter_users_url, notice: "News został wyedytowany"
      else
        render action: "edit"
      end
  end

  def destroy
    @newsletter_user = NewsletterUser.find(params[:id])
    @newsletter_user.destroy

    redirect_to newsletter_users_url
  end
end
