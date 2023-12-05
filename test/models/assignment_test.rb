require "test_helper"

class AssignmentTest < ActiveSupport::TestCase
  should belong_to(:users)
  should belong_to(:roles)
end
