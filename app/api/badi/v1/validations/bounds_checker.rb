class BoundsChecker < Grape::Validations::Base
  def validate_param!(attr_name, params)
    coordinates = params[attr_name].split(',')
    unless coordinates[0].to_f.between?(-180.0, 180.0) && coordinates[1].to_f.between?(-90.0, 90.0) && coordinates[2].to_f.between?(-180.0, 180.0) && coordinates[3].to_f.between?(-90.0, 90)
      raise Grape::Exceptions::ValidationErrors
    end
  end
end
