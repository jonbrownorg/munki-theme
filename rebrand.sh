#!/bin/bash

appname='The Grove'  #  Name of your App
workingdir='/Users/jon/Desktop/munki-theme' ## Where is the script located
signcert='Developer ID Installer: Jonathan Brown (2D4Z7WQ7RS)' # Name of your Developer Certificate
icon='icon_512x512@2x.png' #name of icon file

## Dont Edit

mid='/munki/code/apps/Managed Software Center/Managed Software Center' 
fullpath='/munki/code/apps/Managed Software Center/Managed Software Center/Resources/WebResources'
templatepath='/munki/code/apps/Managed Software Center/Managed Software Center/Resources/templates'
resources='/munki/code/apps/Managed Software Center/Managed Software Center/Resources/'
controllers='/munki/code/apps/Managed Software Center/Managed Software Center/Controllers'

cd $workingdir

git clone https://github.com/munki/munki

#Unlocking File
sudo chflags -R nouchg "$workingdir$fullpath/base.css"

#Making writeable
sudo chmod 777 "$workingdir$fullpath/base.css"

#Adding Custom CSS
cd  "$workingdir$fullpath"
echo "$(echo "@import 'custom.css';" | cat - base.css)" > base.css

#Copy CSS Files
sudo cp "$workingdir/Dark-Theme/custom.css" "$workingdir$fullpath"
sudo rm "$workingdir$templatepath/detail_more_items_template.html"
sudo cp "$workingdir/Dark-Theme/detail_more_items_template.html" "$workingdir$templatepath"

#Modify PY Script
sudo rm "$workingdir$mid/mschtml.swift"
sudo cp "$workingdir/Dark-Theme/mschtml.swift" "$workingdir$mid/mschtml.swift"
#perl -pi -w -e 's{func buildCategoriesPage}{func buildCategoriesPageOLD}g' "$workingdir$mid/mschtml.swift"
#cat "$workingdir/Dark-Theme/modification.py" >> "$workingdir$mid/mschtml.swift"

#Modify Window Size
perl -pi -w -e 's{<value key="minSize" type="size" width="1000" height="475"/>}{<value key="minSize" type="size" width="1331" height="475"/><value key="maxSize" type="size" width="1331" height="730"/>}g' "$workingdir$mid/Base.lproj/MainMenu.xib"

#Modify icons
perl -pi -w -e 's{updatesTemplate.pdf}{updatesTemplate.png}g' "$workingdir$controllers/MainWindowController.swift"
sudo rm -rf "$workingdir$resources/toolbarCategoriesTemplate.pdf"
sudo rm -rf "$workingdir$resources/updatesTemplate.png"
sudo rm -rf "$workingdir$resources/MyStuffTemplate.png"
sudo rm -rf "$workingdir$resources/AllItemsTemplate.png"
sudo cp "$workingdir/Dark-Theme/toolbarCategoriesTemplate.pdf" "$workingdir$resources"
sudo cp "$workingdir/Dark-Theme/AllItemsTemplate.png" "$workingdir$resources"
sudo cp "$workingdir/Dark-Theme/MyStuffTemplate.png" "$workingdir$resources"
sudo cp "$workingdir/Dark-Theme/updatesTemplate.png" "$workingdir$resources"

cd $workingdir/munki

./code/tools/make_munki_mpkg.sh

cd ..

git clone https://github.com/ox-it/munki-rebrand.git

cd munki-rebrand/

echo -n "What is the pkg name that was just built? "
read result
mid='/munki/'
full_pkg_path="$workingdir$mid$result"

sudo ./munki_rebrand.py --appname "$appname" --pkg "$full_pkg_path" --icon-file "$workingdir/$icon" --sign-package "$signcert"
