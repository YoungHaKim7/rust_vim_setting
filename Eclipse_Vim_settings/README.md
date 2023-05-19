# Eclipse __Vim Plug in (vrapper) 

https://vrapper.sourceforge.net/documentation/?topic=configuration#config

# Configuration File
The options described above only change the behaviour of the editor in which they are set. To change the default configuration, a file is used. When a new editor is opened, the plugin checks for a file called .vrapperrc (or _vrapperrc to make it easier for Windows people). This file is expected to be in the user's HOME directory but may be overridden by setting the system property vrapper.vrapperrc when launching Eclipse (-Dvrapper.vrapperrc=<file>). If this file is found, the commands in the file are executed. You may use any configuration command in this file. As with .vimrc files, the leading : may be omitted in the configuration file.

This is an example of the contents of a configuration file:

    ```
    noremap d h
    noremap h j
    noremap t k
    noremap n l
    noremap e d
    noremap E D
    noremap l n
    noremap L N
    noremap s :
    noremap ` ^
    noremap k e
    noremap K E
    imap jj <esc>
    map L $
    map H ^
    set autoindent
    set ignorecase
    set smartcase
    ```
