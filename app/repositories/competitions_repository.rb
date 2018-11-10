class CompetitionsRepository

  def initialize(discipline_slug)
    discipline_repository = DisciplineRepository.new
    @discipline = discipline_repository.find_by_slug(discipline_slug)
  end 

  def get_by_id(id)
    Competition.find_by!(id: id)
  end

  def list_ordered_by_desc
    Competition.order('created_at DESC');
  end
  
  def finish(id)
    Competition.update(id, :opened => false)
  end

  def create(params)
    competition = Competition.new
    competition.name = params["name"]
    competition.discipline = @discipline
    competition.save!
    competition
  end

end