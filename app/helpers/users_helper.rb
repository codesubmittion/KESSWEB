module UsersHelper
	def cal_associate_membership
		users=User.where(status: "Associate")
		users.count
	end

	def cal_regular_membership
		users=User.where(status: "Regular")
		users.count
	end

	def cal_quorum
		(cal_regular_membership/3.0).ceil
	end

	def cal_home(home)
		users=User.where(home: home)
		users.count
	end

	def cal_grade(grade)
		users=User.where(home: grade)
		users.count
	end

	def cal_section(section)
		users=User.where(section: section)
		users.count
	end
# 以下でよくね
	def cal_member(status="null",home="null",grade="null",section="null")
		users=User.all
		if status!="null"
			users=users.where(status: status)
		end
		if home!="null"
			users=users.where(home: home)
		end
		if grade!="null"
			users=users.where(grade: grade)
		end
		if section!="null"
			users=users.where(section: section)
		end
		users.count
	end
end
