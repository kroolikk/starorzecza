# -*- encoding: utf-8 -*-
class Page < ActiveRecord::Base

  validates :label, :presence => { :message => '^Url musi być podany.' }
  validates :label, :uniqueness => { :message => '^Url musi być unikalny.' }
  validates :title, :presence => { :message => '^Tytuł musi być podany.' }

  extend FriendlyId
  friendly_id :label, use: :slugged

end
