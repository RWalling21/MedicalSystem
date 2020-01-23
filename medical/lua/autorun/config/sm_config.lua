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
bleedNotifText = "You are bleeding!" -- Notification text displayed
bleedNotifTime = 4 -- How long the notification will be shown
bleedHealedNotifText = "Your bleeding has stopped!"
bleedHealedNotifTime = 4


--Burn
burnNotifText = "You have a nasty burn!" -- Notification text displayed
burnNotifTime = 4 -- How long the notification will be shown
burnHealedNotifText = "Your burn has been healed!"
burnHealedNotifTime = 4

--Disease
diseaseNotifText = "You have come down with a disease!" -- Notification text displayed
diseaseNotifTime = 4 -- How long the notification will be shown
diseaseHealedNotifText = "Your disease has been cured!"
diseaseHealedNotifTime = 4

--Rare Disease
rareDiseaseNotifText = "You have come down with a RARE disease! Get help ASAP!" -- Notification text displayed
rareDiseaseNotifTime = 6 -- How long the notification will be shown
rareDiseaseHealedNotifText = "Your rare disease has been cured!"
rareDiseaseHealedNotifTime = 4

medkitHealedNotifText = "The medkit cured your ailments!"
medkitHealedNotifTime = 4

cantUseNotifText = "I'm sorry, you cannot use this item"
cantUseNotifTime = 4

-----------------------------------------------------------------------------
--Entities
medkitHP = 25 --HP given to player on medkit use
admnMedkitHP = 100 --HP given to player on admin medkit use

-----------------------------------------------------------------------------
--Support
--DO NOT edit these values if you do not have an error

startDiseaseDelay = 5