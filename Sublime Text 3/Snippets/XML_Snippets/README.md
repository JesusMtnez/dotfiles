## A collection of DocBook XML snippets for Sublime Text 2. ##

### About Sublime Text 2 ###

Check out [Sublime Text 2](http://www.sublimetext.com/2), the a cross-platform text editor for "code, HTML and prose". It is similar to the popular OS X editor [TextMate](http://macromates.com/).

### About Snippets ###

Snippets are a content insertion feature found in many text editors. A snippet allows you to create libraries and templates of commonly used code or other character-based content to insert into your project with a trigger word or alias. 

The following example shows how simple a snippet is. The 'content' element contains your desired content, and the 'tabTrigger' element contains the text string that will trigger the content replacement. You can use the 'scope' element to limit the snippets to run only on certain file type.


	<snippet>
		<content>
		HelloWorld! I am a snippet!
		</content>
		<tabTrigger>hello</tabTrigger>
		<scope>text.xml</scope>
	</snippet>

With this example snippet installed, you could insert the string 'HelloWorld! I am a snippet' by simply typing 'hello' and hitting the TAB key. Due to the scope element, this will only work on a file saved with an XML file suffix. 


--------------------

### Install Snippets ###

Snippets can be installed by saving the snippet file to the Packages directory in your user Library. The Packages folder contains subdirectories for each programming language. This allows you to create libraries specific to XML, C#, etc. 

For OS X, the folder is located per the following filepath.

1. Locate the Sublime Text folder in your user Library file.

	/Users/[your_username]/Library/Application Support/Sublime Text 2/Packages/XML

2. Save the snippet to the XML folder.
3. That's it!

You can even download all of the snippets from the [zip button on the github repository](https://github.com/ddri/Sublime-Text-DocBook-XML-Snippets/zipball/master). 


--------------------


### Using Snippets ###

Once installed, using snippets is easy. 

1. Save your working file as an XML file type. Only the yourfilename.xml suffix matters. 
2. Type the trigger word specified in the 'tabTrigger' element and hit the TAB key.
3. Spend more time coding better, and less time typing repetitive code elements!


--------------------

### Make Your Own Snippets###

You can create your own snippets by saving a snippet profile file to the respective language folder under the Packages directory. Template DocBook XML snippets have been included in the repository for you to use as a starting point. The format appears as follows.


	<snippet>
		<content>
		your_desired_content
		</content>
		<tabTrigger>text_to_trigger_the_snippet</tabTrigger>
		<scope>text.xml</scope>
	</snippet>

You can use CDATA to protect your elements.

	<snippet>
		<content>
			<![CDATA[
			<your_desired_content>
				<layers_of_content/>
			</your_desired_content>	
			]]>
		</content>
		<tabTrigger>text_to_trigger_the_snippet</tabTrigger>
		<scope>text.xml</scope>
	</snippet>

Save the file with the file suffix of sublime.snippet. For example [yoursnippet].sublime-snippet


--------------------

### Known Issues ###

#### Finding Your User Library ####

OS X hides the User level Library. You can show all hidden files by running the following string in a Terminal session.

1. Launch Terminal.
2. Type in the following command.
		
		defaults write com.apple.Finder AppleShowAllFiles true

3. Relaunch Finder in either the Terminal or via the GUI.

3a. Terminal method - type the following:

		killall Finder

3b. GUI method - Hold down the Control and Option keys and click on the Finder icon in the Dock. Select Relaunch.

To reverse the process, run the 'defaults write' command again, setting the value of the 'AppleShowAllFiles' attribute to 'true'.

		defaults write com.apple.Finder AppleShowAllFiles false

There are other methods to temporarily or persistently display the Library folder. Check your favourite search engine and profit.

--------------------

### Feedback ###

Use them, change them, share them.


--------------------

### Links ###

[Sublime Text 2](Link: http://www.sublimetext.com/2)

[DocBook XML](http://www.docbook.org/tdg/en/html/part2.html) 
