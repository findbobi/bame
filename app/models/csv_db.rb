require 'csv'

class CsvDb
  class << self
    def convert_save(model_name, csv_data)
      csv_file = csv_data.read

      CSV.parse(csv_file, headers: true) do |row|
        target_model = model_name.classify.constantize
        new_object = target_model.create(row.to_h)
      end
    end
  end
end
