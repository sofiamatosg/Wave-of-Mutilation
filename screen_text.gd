extends Control

func SetTextInfo(text: String):
	$ScoreLevelText.text = "[center]" + text
	match text:
		"PERFECT":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("ffd000"))
		"GREAT":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("e2dd25"))
		"GOOD":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("c9ddff"))
		"OK":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("8dbfc7"))
		"HOLD OK":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("5ee275"))
		"HOLD MISS", "MISS":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("5a5758"))
