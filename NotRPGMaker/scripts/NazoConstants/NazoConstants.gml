#region Window and resoulution

//Internal resolution
global.internalW = 360;
global.internalH = 270;
//Set GUI resolution to same as internal
global.guiW=global.internalW;
global.guiH=global.internalH;
//Window Scale
global.windowScale = 2;

#endregion;

#region GUI

//Default UI font; MUST BE IN BRACKETS
global.defaultUIFont = "fnNazoDefault";
//Default dialog font
global.defaultFont = "fnNazoDialogDefault";
//Default window graphic
global.defaultWindow = sNazoDefaultWindow;
//Default cursor graphic
global.defaultCursor = sNazoUIPointer;
//Default text speed
global.defaultTextSpeed = 0.7;

global.windowMarginV = 8;
global.windowMarginH = 4;

global.textPadingH=10;
global.textPaddingV=8;

#endregion

//Map tile size
global.tileSize = 16;

//Cardinal directions
enum DIRECTIONS{
	UP,
	DOWN,
	LEFT,
	RIGHT
}