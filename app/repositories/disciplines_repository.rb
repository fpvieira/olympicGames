class DisciplinesRepository
  
  def list_ordered_by_desc
    Discipline.order('created_at DESC');
  end

  def find_by_slug(params)
    Discipline.find_by!(slug: params)
  end
end
