module SayingsHelper
  def themes_options
    [
      'light',
      'dark'
    ].map { |e| [e.humanize, e] }
  end

  def fonts_options
    [
      ["Anton", "'Anton', sans-serif"],
      ["Gloria Hallelujah", "'Gloria Hallelujah', cursive"],
      ["Amatic SC", "'Amatic SC', cursive"],
      ["Slabo 27px", "'Slabo 27px', serif"],
      ["Merriweather", "'Merriweather', serif"],
      ["Roboto Slab", "'Roboto Slab', serif"],
      ["Lobster", "'Lobster', cursive"]
    ]
  end
end
