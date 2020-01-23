class Length < Grape::Validations::Base
  def validate_param!(attr_name, params)
    if params[attr_name].length < @option
      fail Grape::Exceptions::Validation, params: [@scope.full_name(attr_name)], message: "[]"
    end
  end
end
