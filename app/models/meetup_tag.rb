class MeetupTag < ApplicationRecord
  belongs_to :meetup
  belongs_to :tag
end
