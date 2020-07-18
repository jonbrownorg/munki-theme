# Munki Theme
Themes for Munki's Managed Software Center. Contributions welcome. The theme simply provides the injectable code needed to theme [Munki](https://github.com/munki/munki). The themes here are used by [Munki Theme Maker](https://github.com/jonbrown21/Munki-Theme-Maker) a GUI tool to customize Munki. 

# Munki Theme Structure
A munki theme is a folder that contains the following files. 

### Icons
1. AllItemsTemplate.png
2. MyStuffTemplate.png
3. toolbarCategoriesTemplate.pdf
4. updatesTemplate.png

These represent the top 4 toolbar items. Since these are referenced throughout the source code we are simply replacing these 4 icons with the same name and extension alternative icons for the theme in question. You can add any icons you want as long as you follow the same naming convention and extention as the above as a drop in alternative. 

### Theme Files
1. detail_more_items_template.html
2. mschtml.swift

These 2 files are modified to enhance the overall functionality of the default dark-theme. The detail_more_items_template.html file is modified with additional items and lists for the sidebar of the individual detail view of each app. The mschtml.swift file is modified version by version to allow for the carousel banner on the featured page to be shown on the categories page as well. 

### Custom Files
1. custom.css

This file includes all the CSS overides that make the theme work. Custom colors are searched and replaced via the [Munki Theme Maker](https://github.com/jonbrown21/Munki-Theme-Maker) app. We will dive more into this file in the Wiki. 

### Build Files
1. py3_requirements.txt
2. make_munki_mpkg.sh

These core files are needed to build Munki Tools. While they are already included we added additional items in the py3_requirements (six) and also made changes to the make_munki_mpkg.sh compiler to avoid it from failing its checks and we add a bit to the top to collect in a GUI way the password from the user who is compiling it. 

We will be adding more to this readme, but also buiding out the Wiki a bit more over time to show how to....

1. Create your own custom theme
- [How to create your own custom.css file with script placeholders.](https://github.com/jonbrown21/munki-theme/wiki/Creating-a-custom.css-file) 
- How to create your own custom icons for the top toolbar
- What to do if you do not wish to modify the detail_more_items_template or mschtml.swift files
2. How to submit your theme for review
3. Show off your theme design in the gallery

For now you can get support for Munki Themes in the #munki-theme section of the MacAdmins slack and we will do our best to help you. Pull requests are welcome for new themes and for corrections, bug fixes and suggestions for the core dark-theme. 
