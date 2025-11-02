Add-Type -AssemblyName PresentationFramework

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="Shell Grafico Taller 2"
        Height="260" Width="460"
        WindowStartupLocation="CenterScreen"
        Background="#F7F9FC"
        FontFamily="Segoe UI"
        ResizeMode="NoResize">

    <Grid Margin="12">
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="Auto"/>
        </Grid.RowDefinitions>

        <!-- Título -->
        <TextBlock Text="SHELL GRAFICO PERSONALIZADO"
                    FontSize="18"
                    FontWeight="Bold"
                    Foreground="#2D2D2D"
                    HorizontalAlignment="Center"
                    Margin="0,0,0,12"/>

        <!-- Botones principales -->
        <StackPanel Grid.Row="1"
                    Orientation="Horizontal"
                    HorizontalAlignment="Center"
                    VerticalAlignment="Center">

            <!-- Navegador -->
            <Button Name="BtnBrowser"
                    Width="110"
                    Height="110"
                    Margin="8"
                    Background="#D1E8FF"
                    BorderThickness="0"
                    Cursor="Hand"
                    ToolTip="Abrir navegador"
                    FontWeight="SemiBold">
                <StackPanel>
                    <Image Source="https://cdn-icons-png.flaticon.com/128/6125/6125000.png"
                            Width="52" Height="52" Margin="0,4"/>
                        <TextBlock Text="Navegador"
                                HorizontalAlignment="Center"
                                Foreground="#2D2D2D"
                                Margin="0,6,0,0"/>
                </StackPanel>
            </Button>

            <!-- Editor -->
            <Button Name="BtnEditor"
                    Width="110"
                    Height="110"
                    Margin="8"
                    Background="#FFEED0"
                    BorderThickness="0"
                    Cursor="Hand"
                    ToolTip="Abrir editor de texto"
                    FontWeight="SemiBold">
                <StackPanel>
                    <Image Source="https://cdn-icons-png.flaticon.com/128/1686/1686886.png"
                            Width="52" Height="52" Margin="0,4"/>
                        <TextBlock Text="Editor"
                                HorizontalAlignment="Center"
                                Foreground="#2D2D2D"
                                Margin="0,6,0,0"/>
                </StackPanel>
            </Button>

            <!-- Terminal -->
            <Button Name="BtnTerminal"
                    Width="110"
                    Height="110"
                    Margin="8"
                    Background="#DFF6E6"
                    BorderThickness="0"
                    Cursor="Hand"
                    ToolTip="Abrir terminal"
                    FontWeight="SemiBold">
                <StackPanel>
                    <Image Source="https://cdn-icons-png.flaticon.com/128/11892/11892583.png"
                            Width="52" Height="52" Margin="0,4"/>
                        <TextBlock Text="Terminal"
                                HorizontalAlignment="Center"
                                Foreground="#2D2D2D"
                                Margin="0,6,0,0"/>
                </StackPanel>
            </Button>
        </StackPanel>

        <!-- Nota -->
        <TextBlock Grid.Row="2"
                    Text="Nota: Puedes cambiar el editor por otro ejecutable"
                    FontSize="11"
                    Foreground="#6B7280"
                    HorizontalAlignment="Center"
                    Margin="0,12,0,0"/>
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
