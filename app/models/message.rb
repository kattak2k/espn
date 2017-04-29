# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Message < ApplicationRecord
    belongs_to :user
    has_many :comments
end
