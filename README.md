# Cowsay (In Crystal)

	 ___________ 
	< OMGHI2U!! >
	 ----------- 
	      \   ^__^
	       \  (oo)\_______
	          (__)\       )\/\
	              ||----w |
	              ||     ||

## What is this?

Cowsay on the command line is awesome.  You can pipe stuff to it and it displays your message in a spectacular bovine fashion.  What about when you want to use it in your log file or within a ruby application?  Not so easy.

## Until Now...

Using ruby_cowsay is easy.  Here's some examples:

Simplest:

	puts Cow.new.say('Mooooooooo!!!')
	 _______________ 
	< Mooooooooo!!! >
	 --------------- 
	      \   ^__^
	       \  (oo)\_______
	          (__)\       )\/\
	              ||----w |
	              ||     ||

Default Cow, Special Face

	cow = Cow.new({ :face_type => 'paranoid'})
	puts cow.say("Eveyone is staring at me!!!")
	 _____________________________ 
	< Eveyone is staring at me!!! >
	 ----------------------------- 
	      \   ^__^
	       \  (@@)\_______
	          (__)\       )\/\
	              ||----w |
	              ||     ||

Using a Special Cow and a thinking bubble

	steg = Cow.new({ :cow => 'stegosaurus' })
	puts steg.say("My hat is so rad.", 'think')
	 ___________________ 
	( My hat is so rad. )
	 ------------------- 
	o                             .       .
	 o                           / `.   .' " 
	  o                  .---.  <    > <    >  .---.
	   o                 |    \  \ - ~ ~ - /  /    |
	         _____          ..-~             ~-..-~
	        |     |   \~~~\.'                    `./~~~/
	       ---------   \__/                        \__/
	      .'  O    \     /               /       \  " 
	     (_____,    `._.'               |         }  \/~~~/
	      `----.          /       }     |        /    \__/
	            `-.      |       /      |       /      `. ,~~|
	                ~-.__|      /_ - ~ ^|      /- _      `..-'   
	                     |     /        |     /     ~-.     `-. _  _  _
	                     |_____|        |_____|         ~ - . _ _ _ _ _>
	
## Why Would I Use This?

Use it for whatever you want.  I think it's nice for visually finding stuff you've injected into log files, dumping out console messages to users, or generally having fun.

## Bugs

I'm sure there's bugs.  I had to do things significantly different than the original implementation in order to achieve my goals here.  If there's something you think I did poorly, by all means, fork, fix, and submit a pull request.

## Special Thanks

I'd like to thank Tony Monroe for the original perl CLI implementation.  You can find out more about that here:

	http://www.nog.net/~tony/warez/cowsay.shtml