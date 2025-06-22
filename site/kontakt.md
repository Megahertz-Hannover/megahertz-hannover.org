# Kontakt

Wir treffen uns im
[CCC Hannover]( https://www.openstreetmap.org/search?query=B%C3%BCrgerschule%20Nordstadt%20Hannover#map=19/52.38811/9.71793 ).
!!!include(_meeting.md)!!!

Du erreichst uns per E-Mail an kontakt@megahertz-hannover.org oder
im Fedi unter chaos.social/@megaHertz.

## Chat

Wir haben einen (mittelmäßig aktiven) Raum im Matrixchat. Sprich uns an, wenn du Interesse hast, dort eingeladen zu werden.

## Mailing Liste

<form class="box" id="subscribe" action="http://kundenserver.de/cgi-bin/mailinglist.cgi" method="POST" target="_blank">
  <input checked name="subscribe_r" type="radio" value="subscribe">
  Ja, ich möchte mich auf die Mailingliste intern@megahertz-hannover.org.
  <br/>
  <input name="subscribe_r" type="radio" value="unsubscribe"/>
  Bitte streicht mich wieder von der Mailingliste intern@megahertz-hannover.org.
  <br/>
  <br/>
  Deine E-Mail-Adresse:
  <br/>
  <input maxlength="51" name="mailaccount_r" type="text">
  <br/>
  Bitte wiederholen die eingegebene E-Mail-Adresse:
  <br/>
  <input maxlength="51" name="mailaccount2_r" type="text">
  <br/>
  In welcher Stadt trifft sich Megahertz?
  <br/>
  <input maxlength="100" id="reply" name="reply" type="text">
  <br/>

  <br/>
  <input id="submitButton" type="SUBMIT" value="Absenden">

  <input name="FBMLNAME" type="hidden" value="intern@megahertz-hannover.org">
  <input name="FBLANG" type="hidden" value="de">
  <input name="FBURLERROR_L" type="hidden" value="http://kundenserver.de/mailinglist/error.de.html">
  <input name="FBURLSUBSCRIBE_L" type="hidden" value="http://kundenserver.de/mailinglist/subscribe.de.html">
  <input name="FBURLUNSUBSCRIBE_L" type="hidden" value="http://kundenserver.de/mailinglist/unsubscribe.de.html">
  <input name="FBURLINVALID_L" type="hidden" value="http://kundenserver.de/mailinglist/invalid.de.html">
</form>

<script>
	let mailForm = document.getElementById('subscribe');	
	mailForm.addEventListener("submit", (event) => { 
		event.preventDefault();
		let test = document.getElementById('reply');
		if(test.value.toLowerCase() === 'hannover') {
			mailForm.submit();
		}
	})
</script>
