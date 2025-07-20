extends Control

#perfect ffd000
#great e2dd25
#ok 8dbfc7
#miss 5a5758

func SetTextInfo(text: String):
	$ScoreLevelText.text = "[center]" + text
	match text: 
		"PERFECT":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("ffd000"))
			$ScoreLevelText.set("theme_override_colors/font_outline_color", Color("e7a000"))
		"GREAT":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("e2dd25"))
			$ScoreLevelText.set("theme_override_colors/font_outline_color", Color("e7a000"))
		"OK":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("8dbfc7"))
			$ScoreLevelText.set("theme_override_colors/font_outline_color", Color("e7a000"))
		"MISS":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("5a5758"))
			$ScoreLevelText.set("theme_override_colors/font_outline_color", Color("e7a000"))
