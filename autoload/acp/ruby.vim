if exists("acp_did_ruby") | finish | endif
let acp_did_ruby = 1

function acp#ruby#MeetsForOmni(context)
	if !has('ruby')
		return 0
	endif
	if g:acp_behaviorRubyOmniMethodLength >= 0 &&
				\ a:context =~ '[^. \t]\(\.\|::\)\k\{' .
				\              g:acp_behaviorRubyOmniMethodLength . ',}$'
		return 1
	endif
	if g:acp_behaviorRubyOmniSymbolLength >= 0 &&
				\ a:context =~ '\(^\|[^:]\):\k\{' .
				\              g:acp_behaviorRubyOmniSymbolLength . ',}$'
		return 1
	endif
	return 0
endfunction

function acp#ruby#MakeBehavior()
	let behavs = acp#GetDefaults('ruby')
	"---------------------------------------------------------------------------
	call add(behavs.ruby, {
				\ 'command' : "\<C-x>\<C-o>",
				\ 'meets'   : 'acp#ruby#MeetsForOmni',
				\ 'repeat'  : 0,
				\ })
	return behavs
endfunction
