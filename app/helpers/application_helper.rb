module ApplicationHelper
  include Pagy::Frontend

  # Returns 'active' if the current path is the active class, otherwise empty
  def active?(test_path)
    return 'active' if current_page? test_path
  end

end
