-----------------------------------------------------------------------------
--Conditions

--Fracture
fractureEnabled = true -- Enables / Disables condition
fractureFallSpeed = 660 -- Speed the player must be falling to cause a fracture
fractureWalkSpeed = 75 -- Walkspeed after condition default is 160
fractureRunSpeed = 75 -- Runspeed after condition default is 240

--Bleed
bleedEnabled = true -- Enables / Disables condition
bleedProbability = 8 -- 1/x chance for getting condition (1 is 100% 2 is 50% chance, 4 is 25% chance)
bleedDelay = 5 -- Delay in seconds for condition damage
bleedLoop = 0 -- How many times condition damage loops, 0 is unlimited
bleedDMG = 3 -- How much damage condition applys every loop
bleedWalkSpeed = 160 -- Walkspeed after condition default is 160
bleedRunSpeed = 240 -- Runspeed after condition default is 240

--Burn
burnEnabled = true
burnProbability = 5
burnDelay = 10
burnLoop = 0
burnDMG = 2
burnWalkSpeed = 130
burnRunSpeed = 200

--Disease
diseaseEnabled = true
diseaseProbability = 12
diseaseApply = 300 -- Delay in seconds that diseases are given to players
diseaseDelay = 15
diseaseLoop = 0
diseaseDMG = 10

--Rare Disease
rareDiseaseEnabled = true
rareDiseaseProbability = 96
rareDiseaseApply = 900 -- Delay in seconds that diseases are given to players
rareDiseaseDelay = 25
rareDiseaseLoop = 0
rareDiseaseDMG = 25

-----------------------------------------------------------------------------
--Notifications

--Fracture
fractureNotifText = "You have fractured your leg!" -- Notification text displayed
fractureNotifTime = 4 -- How long the notification will be shown
fractureHealedNotifText = "Your fracture has been healed!"
fractureHealedNotifTime = 4

--Bleed
bleedNotifText = "You are bleeding!" 
bleedNotifTime = 4 
bleedHealedNotifText = "Your bleeding has stopped!"
bleedHealedNotifTime = 4


--Burn
burnNotifText = "You have a nasty burn!" 
burnNotifTime = 4 
burnHealedNotifText = "Your burn has been healed!"
burnHealedNotifTime = 4

--Disease
diseaseNotifText = "You have come down with a disease!" 
diseaseNotifTime = 4
diseaseHealedNotifText = "Your disease has been cured!"
diseaseHealedNotifTime = 4

--Rare Disease
rareDiseaseNotifText = "You have come down with a RARE disease! Get help ASAP!"
rareDiseaseNotifTime = 6 
rareDiseaseHealedNotifText = "Your rare disease has been cured!"
rareDiseaseHealedNotifTime = 4

--Medkit
medkitHealedNotifText = "The medkit has healed you!"
medkitHealedNotifTime = 4

--Can't
cantUseNotifText = "I'm sorry, you cannot use this item"
cantUseNotifTime = 4

-----------------------------------------------------------------------------
--Sounds

fractureNotifSound = "buttons/button10.wav" -- Sound played on fracture, check sounds.txt for info on how to set them
fractureHealedSound = "items/smallmedkit1.wav"

bleedNotifSound = "buttons/button10.wav" -- Sound played on bleed, check sounds.txt for info on how to set them
bleedHealedSound = "items/smallmedkit1.wav"

burnNotifSound = "buttons/button10.wav" -- Sound played on burn, check sounds.txt for info on how to set them
burnHealedSound = "items/smallmedkit1.wav"

diseaseNotifSound = "ambient/alarms/klaxon1.wav" -- Sound played on disease, check sounds.txt for info on how to set them
diseaseHealedSound = "items/smallmedkit1.wav"

rareDiseaseNotifSound = "ambient/alarms/klaxon1.wav" -- Sound played on rare disease, check sounds.txt for info on how to set them
rareDiseaseHealedSound = "items/smallmedkit1.wav"

medkitHealedSound = "items/smallmedkit1.wav" -- Sound played on medkit use, check sounds.txt for info on how to set them

cantSound = "buttons/button18.wav" -- Sound played when you can't use an item, check sounds.txt for info on how to set them

-----------------------------------------------------------------------------
--Medkit

medkitHP = 25 --HP given to player on medkit use
medkitFracture = true -- Enables medkit to heal a fracture
medkitBleed = true -- Enables medkit to heal a fracture
medkitBurn = true -- Enables medkit to heal a fracture
medkitDisease = false -- Enables medkit to heal a fracture
medkitRareDisease = false -- Enables medkit to heal a fracture

adminMedkitHP = 100 --HP given to player on admin medkit use
adminMedkitFracture = true -- Enables medkit to heal a fracture
adminMedkitBleed = true -- Enables medkit to heal a fracture
adminMedkitBurn = true -- Enables medkit to heal a fracture
adminMedkitDisease = true -- Enables medkit to heal a fracture
adminMedkitRareDisease = true -- Enables medkit to heal a fracture

-----------------------------------------------------------------------------
-- Don't Change!!!!!!!!!

--net.Receive("SMCamColor", function()
  --  SMCamColor = net.ReadColor()
    --local SMFile = "SM/SMColor.txt"
    --if (!file.IsDir(SMFile, "DATA") && !file.Exists(SMFile, "DATA")) then     	
      --  print("Wrote File")
    --else
      --  print("Chungua")
    --end
--end)
