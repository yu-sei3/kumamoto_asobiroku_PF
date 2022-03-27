class ContactsController < ApplicationController

  # ContactMailer.contact_mail(@contact, current_end_user).deliver
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact, current_end_user).deliver
      redirect_to root_path
      flash[:notice] = "＊お問い合わせありがとうございます！内容を確認次第対応いたします！＊"
    else
      render :new
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :content)
  end

end
