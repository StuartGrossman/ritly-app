# == Schema Information
#
# Table name: links
#
#  id            :integer          not null, primary key
#  url           :string(255)
#  random_string :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Link < ActiveRecord::Base
end
