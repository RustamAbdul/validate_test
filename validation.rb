module Validation
  def valid?
    validating.empty?
  end

  def validation!
    { base: self, errors: validating }
  end

  private

  def validating
    validation_attributes = self.class.attributes
    messages = []

    validation_attributes.each do |val_attr|
      attr_name = val_attr[:attribute_name]
      type_and_rule = val_attr[:type_and_rule]

      error = case type_and_rule.keys.last
      when :present
        next unless self.send(attr_name).nil? == type_and_rule[:present]
        'must present'
      when :type
        next if self.send(attr_name).class == type_and_rule[:type]
        "must has a type #{type_and_rule[:type]}"
      when :format
        next if type_and_rule[:format].match(self.send(attr_name)).to_s == self.send(attr_name)
        "must has this format #{type_and_rule[:format]}"
      else
        raise "#{type_and_rule.keys.last} not present in validations"
      end

      record = messages.detect { |message| message[:attribute] == attr_name }
      if record
        record[:errors].push(error)
      else
        messages.push({ attribute: attr_name, errors: [error] }) unless error.empty?
      end
    end

    messages
  end
end