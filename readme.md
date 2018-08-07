# megahertz-hannover.org

## Compilieren

Zunächst muss node.js & yarn installiert werden.
Dann werden mit `$ yarn install` die benötigten Softwarelibraries installiert
und zuletzt baut `$ make` die eigentlich website. Die liegt dann in build/.

Normalerweise ist es jedoch nicht notwen

## Editing

Einführung Markdown: http://markdown.de/
Einführung Pug: https://pugjs.org/api/getting-started.html
Einführung SASS: https://sass-lang.com/guide

Die meisten Dateien im site/ Ordner, werden einfach auf die website hochgeladen,
in den Dateinamen sind nur Buchstaben, Zahlen, Punkt, Unterstrich und Minus erlaubt.
Files die mit unterstrich "_" beginnen werden ignoriert, da diese als Templates dienen.

Pug, Markdown and SASS dateien werden jeweils zu HTML beziehungsweise CSS kompiliert;
Markdown files benutzen die _template.pug Vorlage.

Um eine neue Unterseite anzulegen, kann einfach eine neue markdown Datei angelegt werden,
die Unterseite sollte dann meist zusätzlich in _template.pug im Header verlinkt werden.

Komplexere unterseiten können in PUG geschrieben werden, dazu einfach ein pugfile `mein_file.pug`
anlegen. Pugfiles nutzen standardmäßig kein template, aber `extends _template` kann oben
in die Datei geschrieben werden um die Standardvorlage zu benutzen.

## Git

Wir nutzen Git um unsere Website zu verwalten, da es uns erlaubt auch ältere versionen der Dateien vorzuhalten.
Wer keine lokale Git installation benutzen will, kann auch einfach das Github interface benutzen um damit
Dateien anzulegen oder zu editieren, dazu kann der `Create New File` Knopf beziehungsweise der Knopf mit dem Stift Icon verwendet werden.

## Markdown

Wir nutzen Markdown um die Website zu schreiben, da Markdown ein relativ einfaches, von Menschen lesbares format ist.
Markdown ist einfach ganz normaler Text mit sonderzeichen um zum Beispiel Tabellen oder Überschriften anzuzeigen.

````
Dies ist ein ganz normaler text.

Eine Leere Zeile bedeutet neuer Paragraph.
Zwei Leerzeichen am ende einer Zeile, bedeuten  
neue Zeile einfügen.

# Doppelkreuz macht eine Überschrift

Dies ist ein Text mit überschrift.

## Mehrere Doppelkreuze machen kleinere Überschriften.

Dies ist ein Text mit kleinerer überschrift.

Backticks können benutzt werden um `code` inzubetten,
**zwei sterne für fetten text**.

Mehrere Backticks machen einen ganzen code block:

```
Hallo
Welt
Dies
Könnte
Programmiercode Sein.
```

Zuletzt können auch Zitate eingebunden werden indem man die
Zeile mit größer als ">" beginnt.

> Dies ist ein
> Langes Zitet.
> Zum beispiel aus einer Mail!
````
