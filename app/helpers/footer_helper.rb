module FooterHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to author, repo
  end
end
