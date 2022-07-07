# MW-TOOLS

This tool has been designed to facilitate maintenance on a computer park.
Source codes are not optimized for public use. It is strongly advised not to use it outside the intended scope. 

## Installation

#### 1 - Install GIT

    sudo apt install git -y

#### 2 - Create the script file 

    nano ~/tools.sh

#### 3 - Copy the following code to the file 

```
#!/bin/bash
rm -rf /tmp/mw_tools && git clone https://github.com/mrwebfr/mw-tools.git /tmp/mw_tools && chmod +x /tmp/mw_tools/script.sh && bash /tmp/mw_tools/script.sh
```
`ctrl + x` to exit then `Y` or `O` to save 

#### 4 - Make the script executable 

    chmod +x ~/tools.sh

#### 5 - Run the script 

    bash ~/tools.sh

## Gnome extensions 
 

Liste : https://github.com/mrwebfr/mw-tools/blob/master/ressources/extensions.md
