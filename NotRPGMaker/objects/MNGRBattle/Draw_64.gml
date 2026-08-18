// --- 1. DRAW NARRATION BANNER ---
var _textH = string_height_scribble(narrationText);
var _bannerH = _textH + (textPaddingV * 2);

draw_sprite_stretched(battleWindow, 0, 0, 0, global.guiW, _bannerH);
scribble(narrationText)
		.align(fa_center, fa_top)
		.draw(global.guiW / 2, textPaddingV);


// --- 2. DRAW PARTY CARDS ---
var _partyCount = array_length(global.party);

if (_partyCount > 0) {
		// Determine card padding first
		//If party is full, set padding to 0
		var _cardPadding = (_partyCount < 4) ? 8 : 0; 
		
		// Calculate total layout width with correct padding
		var _totalWidth = (_partyCount * heroCardW) + ((_partyCount - 1) * _cardPadding);
		
		// Center the starting X coordinate on the GUI layer
		var _startX = (display_get_gui_width() - _totalWidth) / 2;
		var _drawY = heroCardY - raiseModifier;

		// SINGLE LOOP FOR CARDS
		for (var i = 0; i < _partyCount; i++) {
				var _currentHero = global.party[i];
				
				// Card positioning
				var _cardX = _startX + (i * (heroCardW + _cardPadding));
				var _cardCenter = _cardX + (heroCardW / 2);

				// Draw Card Background Window
				draw_sprite_stretched(battleWindow, 0, _cardX, _drawY, heroCardW, heroCardH);

				// Draw Hero Name
				scribble(_currentHero.heroName)
						.align(fa_center, fa_top)
						.draw(_cardCenter, _drawY + textPaddingV);

				// --- HEALTH BAR ---
				var _healthPCT = (_currentHero.hp / _currentHero.maxHP) * 100;
				var _barX = _cardX + textPaddingH;
				var _barW = heroCardW - (textPaddingH * 2);
				var _barH = 16;
				
				var _healthbarY = _drawY + heroCardInfoMargin + textPaddingV;

				draw_healthbar(
						_barX, _healthbarY, 
						_barX + _barW, _healthbarY + _barH, 
						_healthPCT, c_dkgrey, c_red, c_green, 
						0, true, false
				);

				scribble("HP: " + string(_currentHero.hp) + "/" + string(_currentHero.maxHP))
						.draw(_barX + 2, _healthbarY);

				// --- MANA BAR ---
				var _manaPCT = (_currentHero.mp / _currentHero.maxMP) * 100;
				var _manabarY = _drawY + (heroCardInfoMargin * 2) + textPaddingV;

				draw_healthbar(
						_barX, _manabarY, 
						_barX + _barW, _manabarY + _barH, 
						_manaPCT, c_dkgrey, c_purple, c_navy, 
						0, true, false
				);

				scribble("MP: " + string(_currentHero.mp) + "/" + string(_currentHero.maxMP))
						.draw(_barX + 2, _manabarY);
		}
}