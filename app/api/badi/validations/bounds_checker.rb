class BoundsChecker < Grape::Validations::Base
  def validate_param!(attr_name, params)
    coordinates = params[attr_name].split(',')
    unless (coordinates[0].to_f.between?(-180.0, 180.0) && coordinates[1].to_f.between?(-90.0, 90.0) && coordinates[2].to_f.between?(-180.0, 180.0) && coordinates[3].to_f.between?(-90.0, 90))
      fail Grape::Exceptions::Validation, params: [@scope.full_name(attr_name)], message: 'x coordinates must be between (-180.0, 180.0) and y coordinates between (-90.0, 90.0)'
    end
  end
end