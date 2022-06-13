class BusinessesController < InheritedResources::Base

  def index
    if search_params.present?
      @businesses = Business.list_records(search_params[:what],
                                          search_params[:where],
                                          search_params[:tags],
                                          search_params[:languages])
    else
      @businesses = Business.all
    end
  end

  def home;end

  def accepted;end

  def new
    @business = Business.new
    @business_types = BusinessType.all
  end

  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to accepted_businesses_url, notice: "Business was successfully created." }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def business_params
      params.require(:business).permit(:name, :email, :is_owner, :owner_name, :location, :telephone, :website, :instagram, :opens_at, :closes_at, :business_type_id, :tag_list, :language_list, :avatar)
    end

    def search_params
      params.permit(:what, :where, :tags, :languages)
    end

end
