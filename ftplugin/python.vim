if exists("did_acp_ft_python") | finish | endif
let did_acp_ft_python = 1

call acp#DefineOption('g:acp_behaviorPythonOmniLength', 0)
call extend(g:acp_behavior, acp#python#MakeBehavior(), 'keep')
