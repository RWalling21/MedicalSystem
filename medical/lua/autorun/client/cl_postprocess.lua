local blood = {
	["$pp_colour_addr"] = 0.19,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0,
	["$pp_colour_brightness"] = 0,
	["$pp_colour_contrast"] = 0.95,
	["$pp_colour_colour"] = 0.4,
	["$pp_colour_mulr"] = 0.02,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0
}

function SMFracturePP(enabled)
	hook.Add("RenderScreenspaceEffects", "SMPP", function()
		if enabled == true then
			DrawToyTown(5, ScrH()/ 2)
		else
		end
	end)
end

function SMBleedPP(enabled)
	hook.Add("RenderScreenspaceEffects", "SMPP", function()
		if enabled == true then
			DrawColorModify(blood)
			DrawToyTown(5, ScrH()/ 2)
			DrawBloom(0.75, 1, 4, 4, 4, 2, 1, 1, 1)
		else
		end
	end)
end

function SMBurnPP(enabled)
	hook.Add("RenderScreenspaceEffects", "SMPP", function()
		if enabled == true then
			DrawColorModify(blood)
			DrawToyTown(5, ScrH()/ 2)
			DrawBloom(0.75, 1, 4, 4, 4, 2, 1, 1, 1)
		else
		end
	end)
end

