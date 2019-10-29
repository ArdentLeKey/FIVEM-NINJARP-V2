function drawHelpTxt(x,y ,width,height,scale, text, r,g,b,a,font)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end


function DrawTimerBar()
	maxvalue = 0.001
	width = 0.2
	height = 0.025
	xvalue = 0.38
	yvalue = 0.05
	outlinecolour = {0, 0, 0, 150}
	barcolour = {0, 0, 0}
	DrawRect(xvalue + (width/2), yvalue, width + 0.004, height + 0.006705, outlinecolour[1], outlinecolour[2], outlinecolour[3], outlinecolour[4]) -- Box that creates outline
	drawHelpTxt(xvalue + (((maxvalue/2)/((maxvalue/2)/width))/2), yvalue + 0.0275, 0.07, 0.1, 0.5, "Vous êtes ko !", 255, 255, 255, 255, 6) -- Text display of timer
	DrawRect(xvalue + (width/2), yvalue, width, height, barcolour[1], barcolour[2], barcolour[3], 255) --  Static full bar
	DrawRect(xvalue + ((maxvalue/width)/2), yvalue, (maxvalue/width), height, barcolour[1], barcolour[2], barcolour[3], 255)
end