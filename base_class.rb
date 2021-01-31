require './validation'
require './validation_saver'
class BaseClass
  extend ValidationSaver
  include Validation
end
