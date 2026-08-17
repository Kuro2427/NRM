// 1. Draw Main Text Box
draw_sprite_stretched(window, 0, textboxX, textboxY, textboxWidth, textboxHeight);

// 2.Only draw Speaker Nameplate if there is a speaker foe every line
if(array_length(speaker)==array_length(text)){
	var _speaker = speaker[page];
	if (_speaker != "") {
	    var _speakerText = _speaker;
	    var _textH = string_height_scribble(_speakerText);
	    var _textW = string_width_scribble(_speakerText);
    
	    var _nameplateY = textboxY - (_textH + textPaddingVertical + nameplateMarginBottom);
	    var _nameplateH = _textH + (textPaddingVertical * 2);
	    var _nameplateW = _textW + (textPaddingHorizontal * 2);
    
	    draw_sprite_stretched(window, 0, textboxX, _nameplateY, _nameplateW, _nameplateH);
	    scribble(_speakerText).draw(textboxX + textPaddingHorizontal, _nameplateY + textPaddingVertical);
	}
}else if(speaker!=undefined && array_length(speaker)>0){
	//If the speaker is not undefined or the array isn't 1 item long, that was probably unintentional
	print("NRM: MNGRDumbTextbox speaker array is not same length as text array.")
}


// 3. Draw Dialogue Body Text
var _text = text[page];
scribble(_text)
    .fit_to_box(textboxWidth - textPaddingHorizontal, textboxHeight - textPaddingVertical)
    .draw(textboxX + textPaddingHorizontal, textboxY + textPaddingVertical, global.typist);
	
//5 Draw continue prompt
if(global.typist.get_state()==1){
	draw_sprite_ext(cursorSprite,curFrame,(global.guiW/2),global.guiH,1,1,270,c_white,1);
}

//6. Animate cursor
if(curFrame<curFrameCount){
	curFrame+=curSpd/60;
}else{
	curFrame=0
}