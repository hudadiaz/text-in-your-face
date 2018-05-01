module SayingsHelper
  def theme_options
    [
      'light',
      'dark'
    ].map { |e| [e.humanize, e] }
  end

  def font_options
    [
      "Anton",
      "Gloria Hallelujah",
      "Amatic SC",
      "Slabo 27px",
      "Merriweather",
      "Roboto Slab",
      "Lobster"
    ]
  end
end
