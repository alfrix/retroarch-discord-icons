# Alfrix 2017
#
# Batch Convert SVG to PNG
param([string]$svg_path, [string]$png_path, [int]$job_total, [int]$this_job)
# Use Inkscape 0.48 (before cairo)
d:
cd "G:\inkscape_048_5"
$svgs = Get-ChildItem $svg_path\* -Include *.svg
for ($i=$this_job; $i -lt $svgs.Count; $i=$i+$job_total) {
	$svg_fullname=$svgs[$i].fullname
	$svg_name=$svgs[$i].basename
	.\inkscape.com -f "$svg_fullname"  -w 1024 -h 1024 -z -e "$png_path\$svg_name.png"
}
