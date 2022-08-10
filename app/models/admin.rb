class Admin < User
  validates :last_name, presence: true

  def admin?
    is_a?(Admin)
  end

end
