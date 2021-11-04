class Author < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :phone_number, length: { is: 10 }
    validate :proper_name_case
    validate :not_a_hollywood_number

    private

    def proper_name_case
        if self.name != self.name.titleize
            errors.add(:name, "Must be properly name cased")
        end
    end
    
    def not_a_hollywood_number
        string_phone = self.phone_number.to_s
        call_code = string_phone[3..5]

        if string_phone.start_with?("555")
            errors.add(:phone_number, "Must not start with 555")
        elsif call_code == "555"
            errors.add(:phone_number, "Calling code must not be 555")
        end
    end
    
end
