module ValidationSaver
  @@validation_attributes = []
  def validate(attribute_name, type_and_rule)
    @@validation_attributes.push({ attribute_name: attribute_name, type_and_rule: type_and_rule })
  end

  def attributes
    @@validation_attributes
  end
end