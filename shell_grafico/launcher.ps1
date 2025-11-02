$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $scriptDir

Add-Type -AssemblyName PresentationFramework

[xml]$xaml = @"
    <Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
            Title="Shell Grafico Taller 2" Height="240" Width="420" WindowStartupLocation="CenterScreen" ResizeMode="NoResize">
    <Grid Margin="12">
        <Grid.RowDefinitions>
        <RowDefinition Height="Auto"/>
        <RowDefinition Height="*"/>
        <RowDefinition Height="Auto"/>
        </Grid.RowDefinitions>

        <TextBlock Text="SHELL GRAFICO" FontSize="16" FontWeight="Bold" HorizontalAlignment="Center" Margin="0,0,0,8"/>

        <StackPanel Grid.Row="1" Orientation="Horizontal" HorizontalAlignment="Center" VerticalAlignment="Center" >
        <Button Name="BtnBrowser" Width="110" Height="110" Margin="8" ToolTip="Abrir navegador">
            <StackPanel>
            <Viewbox Height="52" Width="52">
                <Canvas Width="24" Height="24">
                <Ellipse Width="24" Height="24" Fill="#FF4CAF50"/>
                </Canvas>
            </Viewbox>
            <TextBlock Text="Navegador" HorizontalAlignment="Center" Margin="0,6,0,0"/>
            </StackPanel>
        </Button>

        <Button Name="BtnEditor" Width="110" Height="110" Margin="8" ToolTip="Abrir editor de texto">
            <StackPanel>
            <Viewbox Height="52" Width="52">
                <Canvas Width="24" Height="24">
                <Rectangle Width="24" Height="24" Fill="#FFFFC107"/>
                </Canvas>
            </Viewbox>
            <TextBlock Text="Editor" HorizontalAlignment="Center" Margin="0,6,0,0"/>
            </StackPanel>
        </Button>

        <Button Name="BtnTerminal" Width="110" Height="110" Margin="8" ToolTip="Abrir terminal">
            <StackPanel>
            <Viewbox Height="52" Width="52">
                <Canvas Width="24" Height="24">
                <Rectangle Width="24" Height="24" Fill="#FF03A9F4"/>
                </Canvas>
            </Viewbox>
            <TextBlock Text="Terminal" HorizontalAlignment="Center" Margin="0,6,0,0"/>
            </StackPanel>
        </Button>
        </StackPanel>

        <TextBlock Grid.Row="2" Text="Nota: Puedes cambiar el editor por otro ejecutable" FontSize="11" HorizontalAlignment="Center" Margin="0,8,0,0"/>
    </Grid>
    </Window>
"@

# Cargar XAML
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
try {
    $window = [Windows.Markup.XamlReader]::Load($reader)
} catch {
    Write-Error "Error cargando XAML: $_"
    exit 1
}

# Obtener controles
$btnBrowser = $window.FindName("BtnBrowser")
$btnEditor  = $window.FindName("BtnEditor")
$btnTerminal = $window.FindName("BtnTerminal")

# Funciones para abrir aplicaciones
function Open-Browser {
    param($url = "https://www.google.com")
    try {
        Start-Process $url
    } catch {
        [System.Windows.MessageBox]::Show("No se pudo abrir el navegador: $_","Error",[System.Windows.MessageBoxButton]::OK,[System.Windows.MessageBoxImage]::Error)
    }
}

function Open-Editor {
    param($editor = $null, $pathArg = $null)
    try {
        if ($editor) {
            Start-Process -FilePath $editor -ArgumentList $pathArg
        } else {
            # Abrir Notepad++ por defecto
            Start-Process notepad++.exe
        }
    } catch {
        [System.Windows.MessageBox]::Show("No se pudo abrir el editor: $_","Error",[System.Windows.MessageBoxButton]::OK,[System.Windows.MessageBoxImage]::Error)
    }
}

function Open-Terminal {
    param($shell = $null, $args = $null)
    try {
        if ($shell) {
            Start-Process -FilePath $shell -ArgumentList $args
        } else {
            # Abrir nueva ventana de PowerShell
            Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit"
        }
    } catch {
        [System.Windows.MessageBox]::Show("No se pudo abrir la terminal: $_","Error",[System.Windows.MessageBoxButton]::OK,[System.Windows.MessageBoxImage]::Error)
    }
}

# Asignar eventos
$btnBrowser.Add_Click({ Open-Browser })

#Boton Notepad++
$btnEditor.Add_Click({ Open-Editor -editor "notepad++" -pathArg "." })

#Boton Terminal PowerShell
$btnTerminal.Add_Click({ Open-Terminal -shell $null })

# Mostrar ventana (modal)
$window.ShowDialog() | Out-Null
