module ContactRequestsHelper
  def invalid_class?(attribute_name)
    return "is-invalid" if @contact_request&.errors&.messages[attribute_name].present?
  end

  def error_message(attribute_name)
    @contact_request&.errors&.messages[attribute_name].join(", ")
  end
end
