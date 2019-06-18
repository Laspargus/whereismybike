# frozen_string_literal: true

FactoryBot.define do
  factory :station do
    name { "MyString" }
    uid { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
    ebikes { 1 }
    free_bikes { 1 }
    has_ebikes { false }
    empty_slots { 1 }
  end
end
