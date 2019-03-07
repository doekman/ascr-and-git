//@osa-lang:JavaScript
function rnd(from, until) {
	if (until === undefined) {
		until = from;
		from = 1;
	}
	var range = until - from + 1;
	return Math.floor(Math.random() * range) + from;
}

function add(a, b) {
	var chance = rnd(4);
	if (chance == 1) {
		b+=rnd(4);
	}
	else if (chance == 2) {
		b-=rnd(4);
	}
	return a + b
}

app = Application.currentApplication()
app.includeStandardAdditions = true

do {
	var giveUpAfter=10;
	var sumThis = [rnd(1, 25), rnd(1, 25)];
	var theSum = add.apply(null, sumThis);
	var trueSum = sumThis[0] + sumThis[1];
	var isCorrectReally = trueSum == theSum;

	var msg = "Is the sum "+sumThis.join("+") + "=" + theSum + " correct?\n\n(please answer within "+giveUpAfter+" seconds)";
	var result = app.displayDialog(msg, {
		withTitle: "A little arithmetic",
		withIcon: "note",
		buttons: ["Wrong", "Correct"],
		givingUpAfter: giveUpAfter
	});
	var takenTooLong = result["gaveUp"];
	var isCorrectAnswer = ! takenTooLong  && result.buttonReturned == "Correct";

	var feedbackText = sumThis[0] + " added with " + sumThis[1] + " ";
	if (isCorrectAnswer == isCorrectReally) {
		feedbackText = "You're correct! " + feedbackText + (isCorrectReally ? "is indeed " : "is not " + theSum + ", but ") + trueSum;
	} else {
		feedbackText = (takenTooLong ? "This has taken too long! " : "You're mistaken! ") + feedbackText + (isCorrectReally ? "truely is " : "is not " + theSum + ", but ") + trueSum;
	}
	var answer = app.displayDialog(feedbackText+'\n\nDo you want to play another quiz?', {
		withTitle: "Aritmetic contemplation",
		buttons: ["No thanks, please make it stop", "Jolly heavens, please proceed"],
		defaultButton: 2
	})

} while (answer.buttonReturned.indexOf("proceed")>0)

"Thanks for playing!"
