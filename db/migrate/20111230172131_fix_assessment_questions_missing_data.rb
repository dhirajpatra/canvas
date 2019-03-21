#
# Copyright (C) 2011 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.

class FixAssessmentQuestionsMissingData < ActiveRecord::Migration[4.2]
  tag :postdeploy

  def self.up
    Quizzes::QuizQuestionDataFixer.send_later_if_production_enqueue_args(:fix_quiz_questions_with_bad_data, :priority => Delayed::LOWER_PRIORITY, :max_attempts => 1)
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end

end
