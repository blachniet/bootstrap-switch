rm *.nupkg
if (Test-Path Content -PathType Container) {
	rm Content -Recurse -Force -ErrorAction SilentlyContinue
}

mkdir Content
mkdir Content\Scripts
mkdir Content\Content\bootstrap-switch

cp ..\build\js\* Content\Scripts
cp ..\build\css\bootstrap* Content\Content\bootstrap-switch -Recurse

$exclude = (Get-Item * -Exclude Content,*.nuspec | Select-Object -ExpandProperty Name) -Join ";"
.\NuGet.exe pack -Exclude $exclude
