Set fso = CreateObject("Scripting.FileSystemObject")
scriptPath = WScript.ScriptFullName
scriptFolder = fso.GetParentFolderName(scriptPath)
cmd = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File """ & scriptFolder & "\launcher.ps1"""
CreateObject("WScript.Shell").Run cmd, 0, false