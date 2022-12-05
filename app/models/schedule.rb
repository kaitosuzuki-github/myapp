class Schedule < ApplicationRecord
  validates :title, presence: true
  validates :startday, :endday, presence: true
  validate :start_end_check
  validates :allday, inclusion: {in: [true, false]}

  def start_end_check
    if self.startday != nil && self.endday != nil
      if self.startday > self.endday
        errors.add(:endday, "は開始日より前の日付で登録できません")
      end
    end
  end
end
