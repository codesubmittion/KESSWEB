module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
# ６段階の権限わけ
  def judge(user)
  	if user.admin==true
  		return 5
  	elsif user.authority=="Central Committee"
  		return 4
  	elsif user.authority=="Hiyoshi Committee" || user.authority=="Mita Committee"
  		return 3
  	elsif user.authority=="Ordinary"
  		if user.status=="Regular"
  			return 2
  		else
  			return 1
  		end
  	else
  		return 0
  	end
  end

# アプリケの対象者ならばtrueが返る
  def aimed?(post_application,user)
    #退会者、卒業者、除名者にアプリケは送らない
      unless user.status=="Regular" || user.status=="Associate"
        return false
      end
      unless post_application.target_grade=="All" || post_application.target_grade==user.grade
        return false
      end
      unless post_application.target_section=="All" || post_application.target_section==user.section
        return false
      end
      unless post_application.target_home=="All" || post_application.target_home==user.home
        return false
      end
    return true
  end
  # def image_posted?
  #   PostImage.nil?
  # end
# top pageの写真が一個でも存在するか
  def image_posted?
    if PostImage.last!=nil
      return true
    else
      return false
    end
  end

  def image_last_id
    PostImage.last.id
  end
end

