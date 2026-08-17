// obj_dialogue_manager -> Draw GUI Event

// 1. Draw Main Text Box
draw_sprite_stretched(window, 0, textboxX, textboxY, textboxWidth, textboxHeight);

// 2. Draw Speaker Nameplate
var _speaker = ChatterboxGetContentSpeaker(chatterbox, 0);
if (_speaker != "") {
    var _speakerText = _speaker + ":";
    var _textH = string_height_scribble(_speakerText);
    var _textW = string_width_scribble(_speakerText);
    
    var _nameplateY = textboxY - (_textH + textPaddingVertical + nameplateMarginBottom);
    var _nameplateH = _textH + (textPaddingVertical * 2);
    var _nameplateW = _textW + (textPaddingHorizontal * 2);
    
    draw_sprite_stretched(window, 0, textboxX, _nameplateY, _nameplateW, _nameplateH);
    scribble(_speakerText).draw(textboxX + textPaddingHorizontal, _nameplateY + textPaddingVertical);
}

// 3. Draw Dialogue Body Text
var _text = ChatterboxGetContentSpeech(chatterbox, page);
scribble(_text)
    .fit_to_box(textboxWidth - textPaddingHorizontal, textboxHeight - textPaddingVertical)
    .draw(textboxX + textPaddingHorizontal, textboxY + textPaddingVertical, global.typist);

// 4. Draw Choice Menu
var _optionCount = ChatterboxGetOptionCount(chatterbox);
if (_optionCount > 0 && global.typist.get_state() == 1) {
    
    // Find widest option
    var _maxWidth = 0;
    for (var i = 0; i < _optionCount; i++) {
        _maxWidth = max(_maxWidth, string_width_scribble(ChatterboxGetOption(chatterbox, i)));
    }

    // Box dimensions
    var _boxWidth  = _maxWidth + (choicePaddingX * 2);
    var _boxHeight = (_optionCount * choiceLineHeight) + (choicePaddingY * 2);
    var _boxX      = (textboxX + textboxWidth) - _boxWidth;
    var _boxY      = (textboxY - boxVerticalMargin / 2) - _boxHeight;

    // Background
    draw_sprite_stretched(window, 0, _boxX, _boxY, _boxWidth, _boxHeight);

    // Options & Cursor
    for (var i = 0; i < _optionCount; i++) {
        var _optionY = _boxY + choicePaddingY + (i * choiceLineHeight);
        
        scribble(ChatterboxGetOption(chatterbox, i))
            .align(fa_left, fa_top)
            .draw(_boxX + choicePaddingX, _optionY);
    }
    
    // Pointer
    var _cursorX = _boxX + choicePaddingX - cursorWidth;
    var _cursorY = _boxY + choicePaddingY + (cursor * choiceLineHeight) + cursorYOffset;
    draw_sprite(cursorSprite, 0, _cursorX, _cursorY);
}