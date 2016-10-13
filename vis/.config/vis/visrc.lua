-- load standard vis module, providing parts of the Lua API
require('vis')

vis.events.win_open = function(win)
	-- enable syntax highlighting for known file types
	vis.filetype_detect(win)

	-- Your local configuration options e.g.
	vis:command('set number')
	vis:command('set relativenumber')
	vis:command('set autoindent')
	vis:command('map! normal ;j <C-w>j')
	vis:command('map! normal ;k <C-w>k')
	vis:command('map! normal ;l <C-w>l')
	vis:command('map! normal ;h <C-w>h')
	vis:command('map! normal ;b "i┌─┐└─┘│"')
	vis:command('map! normal ;n :new<Enter>')
	-- vis:command('map! normal ;x ":!python3 %:p"<Enter>')
end
