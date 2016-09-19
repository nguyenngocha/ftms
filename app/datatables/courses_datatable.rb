class CoursesDatatable
  include AjaxDatatablesRails::Extensions::Kaminari

  delegate :params, :link_to, to: :@view

  def initialize view, namespace
    @view = view
    @namespace = namespace
  end

  def as_json options = {}
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: courses.total_count,
      iTotalDisplayRecords: courses.total_count,
      aaData: data
    }
  end

  private
  def data
    courses.map.each do |course|
      [
        course.id,
        link_to(course.name, eval("@view.#{@namespace}_course_path(course)")),
        course.load_trainers.map do |trainer|
          link_to(@view.avatar_user_tag(trainer, "profile-user",
          Settings.image_size_20), eval("@view.#{@namespace}_user_path(trainer)"),
          title: trainer.name)
        end,
        course.decorate.set_status
      ]
    end
  end

  def courses
    @courses ||= fetch_courses
  end

  def fetch_courses
    current_user = @view.current_user
    @courses = @namespace == Settings.namespace_roles.admin ? Course.all : current_user.courses
    courses = @courses.order("#{sort_column} #{sort_direction}")
      .where("courses.name like :search", search: "%#{params[:sSearch]}%")
      .per_page_kaminari(page).per per_page

    if params[:sSearch_3].present?
      courses = courses.where "status = :search", search: "#{params[:sSearch_3]}"
    elsif params[:sSearch_2].present?
      courses = courses.joins(:user_courses, users: :roles)
        .where "users.id = :search AND role_type = 1", search: "#{params[:sSearch_2]}"
    end
    courses.distinct
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : @courses.size
  end

  def sort_column
    columns = %w[id name]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
