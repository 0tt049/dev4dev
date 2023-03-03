
class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    slots = Slot.where(["user_id =?", record.user_id])
    date_ranges = slots.map { |b| b.start_date..b.end_date }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "not available")
      end
    end
  end
end
