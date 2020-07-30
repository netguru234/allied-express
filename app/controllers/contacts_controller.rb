class ContactsController < ApplicationController

  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)

  	if @contact.save
  		name = params[:contact][:name]
  		email = params[:contact][:email]
  		body = params[:contact][:comments]

  		ContactMailer.contact_email(name, email, body).deliver

  		flash[:success] = "Message has been sent successfully. We Will get back to you as soon as We can. Thank You"
  		redirect_to new_contact_path
  	else
  		flash[:danger] = "Please check the form fields for error(s)"
  		render 'new'
  	end

  end

  private

  def contact_params
  	params.require(:contact).permit(:name, :email, :comments)
  end
end
