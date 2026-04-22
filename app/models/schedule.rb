class Schedule < ApplicationRecord
    validates :title, presence: true, length: { maximum: 20 }
    validates :note, length: { maximum: 500 }
    validates :start_date, presence: true
    validates :end_date, presence: true
    validate :end_date_after_start_date

    private
    def end_date_after_start_date
        return if start_date.blank? || end_date.blank? # start_dateとend_dateのどちらかが空の場合はバリデーションをスキップ
        
        if end_date < start_date
            errors.add(:end_date, "終了日は開始日以降の日付を選択してください")
        end
    end
end
