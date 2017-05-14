module Enrollment
  module ApplicationHelper

    def current_user
      # todo : current_user 가 왜 있어야 하지?
      # @current_user ||= session[:user_id]
    end

    def can_enroll?

    end

    def is_lecture_limited?

    end

    def does_lecture_time_limit_end?(lecture_id)
      begin
        lecture = Lecture.where(id: lecture_id).first
        return Time.current > lecture.time_limit_end
      rescue ActiveRecord::RecordNotFound
        return nil
      end
    end


    def does_lecture_full?(lecture_id)
      begin
        lecture = Lecture.where(id: lecture_id).first
        return lecture.enrollment_enrolls.count >= @lecture.personnel_limit
      rescue ActiveRecord::RecordNotFound
        return nil
      end
    end

    def is_lecture_admin?(lecture_id, user_id)
      LectureAdmin.where(lecture_id: lecture_id, user_id: user_id).any?
    end

    # 루비가 오버로딩을 지원하지 않는데...
    # 동적 데이터 타입을 갖는 언어라서 그렇대
    def is_admin

    end


  end
end
