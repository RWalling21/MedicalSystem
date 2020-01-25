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
	hook.Add("RenderScreenspaceEffects", "SMFPP", function()
		if enabled == true then
			DrawToyTown(5, ScrH()/ 2)
		else
		end
	end)
end

function SMBleedPP(enabled)
	hook.Add("RenderScreenspaceEffects", "SMBLPP", function()
		if enabled == true then
			DrawColorModify(blood)
			DrawToyTown(5, ScrH()/ 2)
			DrawBloom(0.75, 1, 4, 4, 4, 2, 1, 1, 1)
		else
		end
	end)
end

function SMBurnPP(enabled)
	hook.Add("RenderScreenspaceEffects", "SMBUPP", function()
		if enabled == true then
			DrawMotionBlur(0.15, 0.3, 0.01)
			DrawToyTown(5, ScrH()/ 2)
		else
		end
	end)
end

function SMDiseasePP(enabled)
	hook.Add("RenderScreenspaceEffects", "SMDPP", function()
		if enabled == true then
			DrawMotionBlur(0.4, 0.8, 0.01)
			DrawSharpen(1.2, 1.2)
			DrawToyTown(5, ScrH()/ 2)
		else
		end
	end)
end

function SMRareDiseasePP(enabled)
	hook.Add("RenderScreenspaceEffects", "SMRDPP", function()
		if enabled == true then
			DrawMotionBlur(0.6, 1, 0.01)
			DrawSharpen(1.4, 1.4)
			DrawToyTown(6, ScrH()/ 2)
			DrawBloom(0.75, 1, 4, 4, 4, 2, 1, 1, 1)
		else
		end
	end)
end
