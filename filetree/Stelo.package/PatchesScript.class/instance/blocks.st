block specs
blocks
	"Answer a collection of block specifications for the blocks that are common to all objects. Block specificatons (Arrays) are interspersed with category names (Strings). A block specification is an Array of the form: (<block spec string> <block type> <selector> [optional initial argument values]).

	Explanation of flags:
		-	no flags
		b	boolean reporter
		c	c-shaped block containing a sequence of commands (always special form)
		r	reporter
		s	special form command with its own evaluation rule
		t	timed command, like wait or glide
		E	message event hat
		K	key event hat
		M	mouse-click event hat
		S	start event hat
		W	when <condition> hat (obsolete)"

	| blocks |
	blocks := #(
		'sensing'
			('id'									r	getId)
			('x position'						r	getXpos)
			('y position'						r	getYpos)
			('one of %m at %n'				r	turtle:at: '' 'where')
			('distance to %n'				r	distanceTo: 'where')
			('direction to %n'				r	directionTo: 'where')
			-
			('here'								r	here)
			('x %n y %n from here'	r	relativeToX:y:		0 0)
			('r %n theta %n from here'	r	relativeToR:theta:		0 0)
		'control'
			('when setup'						S	-)
		'patch'
			('patch color at %n' 			r 	getPatchColorAt: 'where')
			('set patch color at %n to %c'			- setPatchColorAt:to: 'where' 15)
	).

	^ blocks, self colorBlocks, self variablesBlocks, super blocks, self observerBlocks