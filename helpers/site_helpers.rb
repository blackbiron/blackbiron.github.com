module SiteHelpers

  def page_title
    title = "Arman Adhitama"
    if data.page.title
      title << " | " + data.page.title
    end
    title
  end

  def page_description
    if data.page.description
      data.page.description
    else
      "Arman Adhitama, professional web designer."
    end
  end

  def nav(curr)
    if data.page.module
      "active"
    else
      ""
    end
  end

end