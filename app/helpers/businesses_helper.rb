module BusinessesHelper
  def business_invalid_class?(attribute_name)
    return "is-invalid" if @business&.errors&.messages[attribute_name].present?
  end

  def business_error_message(attribute_name)
    @business&.errors&.messages[attribute_name].join(", ")
  end
end
