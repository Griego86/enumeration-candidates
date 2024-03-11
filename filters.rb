# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require './candidates'


def find(id)
  @candidates.each{ |candidate| return candidate if candidate[:id] == id }
  nil
end
  

def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end


def qualified_candidates(candidates)
  qualified = candidates.select do |candidate| 
    has_required_experience(candidate) &&
    has_enough_github_points(candidate) &&
    knows_required_languages(candidate) &&
    meets_age_requirement(candidate)
  end
  qualified
end


def has_required_experience(candidate)
  candidate[:years_of_experience] > 0
end

def has_enough_github_points(candidate)
  candidate[:github_points] >= 100
end

def knows_required_languages(candidate)
  candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python")
end

def meets_age_requirement(candidate)
  candidate[:age] > 17 
end

  
  def ordered_by_qualifications(candidates)
    candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
  end