class ContactRequestsController < ApplicationController
  def new
    @contact_request = ContactRequest.new
  end

  def create
    @contact_request = ContactRequest.new(contact_request_params)

    respond_to do |format|
      if @contact_request.save
        format.html { redirect_to accepted_contact_requests_url, notice: "Contact request was successfully created." }
        format.json { render :show, status: :created, location: @contact_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def accepted;end
  def introduction;end

  private
    def set_contact_request
      @contact_request = ContactRequest.find(params[:id])
    end

    def contact_request_params
      params.require(:contact_request).permit(:name, :email, :subject, :message)
    end
end
