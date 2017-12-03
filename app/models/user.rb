class User < ApplicationRecord
  attr_accessor :nickname
  has_many :insurances
  
  enum educational_attachment: {
    "Primary School":         1,
    "Grade School":           2,
    "Junior High School":     3,
    "Senior High School":     4,
    "Vocational Course":      5,
    "Associate's Degree":     6,
    "Bachelor's Degree":      7,
    "Master's Degree":        8,
    "Doctorate":              9,
    "Alternative Learning System":                        10,
    "Online Courses /Massive Open Online Course (MOOCs)": 11
  }

  enum health_condition: {
    "Poor Health Condition": 1,
    "Fair Health Condition": 2,
    "Good Health Condition": 3,
  }

  enum goal: {
    "Long Term":    1,
    "Short Term":   2,
    "Undecided":    3
  }

end
