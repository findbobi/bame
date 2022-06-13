ActiveAdmin.register Business do
  permit_params :name, :email, :is_owner, :owner_name, :is_approved, :tag_list, :language_list,
                :location, :telephone, :website, :instagram, :opens_at,
                :closes_at, :business_type_id, :is_online, :is_offline,
                :is_open_on_saturday, :is_open_on_sunday,
                :saturday_opening_time, :saturday_closing_time,
                :sunday_opening_time, :sunday_closing_time

  # Import CSV, solution: https://stackoverflow.com/a/9859037
  action_item :only => :index do
    link_to 'Upload CSV', :action => 'upload_csv'
  end

  collection_action :upload_csv do
    render "admin/csv/upload_csv"
  end

  collection_action :import_csv, :method => :post do
    CsvDb.convert_save("business", params[:dump][:file])
    redirect_to :action => :index, :notice => "CSV imported successfully!"
  end

  form do |f|
    f.inputs "Business info" do
      f.input :business_type
      f.input :name
      f.input :owner_name
      f.input :is_owner
      f.input :email
      f.input :location
      f.input :telephone
      f.input :website
      f.input :instagram
      f.input :opens_at
      f.input :closes_at
      f.input :tag_list
      f.input :language_list
      f.input :is_online
      f.input :is_offline
      f.input :is_open_on_saturday
      f.input :is_open_on_sunday
      f.input :saturday_opening_time
      f.input :saturday_closing_time
      f.input :sunday_opening_time
      f.input :sunday_closing_time
      f.input :is_approved
      # f.input :tags,  # Show all tags AND checked already selected one (by relations through :tags - input must named :tags)
      #   as: :select,
      #   multiple: :true,
      #   collection: ActsAsTaggableOn::Tag.select(:id, :name).all
      # f.input :languages,  # Show all tags AND checked already selected one
      #   as: :select,
      #   multiple: :true,
      #   collection: ActsAsTaggableOn::Tag.select(:id, :name).all
    end
    f.actions
  end
end
