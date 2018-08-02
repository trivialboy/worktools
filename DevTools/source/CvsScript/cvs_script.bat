@set CVSROOT=:pserver:huangwentao@10.1.0.131:/home/cvsroot/BOSS1.5
@set PATH=%PATH%;c:\Program Files\WinCvs\
@setlocal EnableDelayedExpansion
@set NewLine=^


cvs.exe history -c -w -l -u huangwentao -D 2016-10-27 -p Develop/SourceCode/BFC
