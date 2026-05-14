function knvim --wraps='NVIM_APPNAME=kickstart nvim' --wraps='NVIM_APPNAME=kickstart.nvim nvim' --description 'alias knvim=NVIM_APPNAME=kickstart.nvim nvim'
    NVIM_APPNAME=kickstart.nvim nvim $argv
end
