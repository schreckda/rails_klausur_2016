Vorbereitung
============

* Mache die folgenden Abschnitte von http://guides.rubyonrails.org/index.html offline verfügbar:
    * Models
    * Views
    * Controllers
    * Digg Deeper
        * Active Support Core Extensions
        * Rails Internationalization API
        * Active Job Basics
        * Securing Rails Applications
        * Debugging Rails Applications
        * Configuring Rails Applications
        * Rails Command Line Tools and Rake Tasks
        * Asset Pipeline
        * Working with JavaScript in Rails
        
* Diese Website gibt es auch in einer Offline-Version (incl. Suche) http://devdocs.io
* Setze dein System auf und stelle sicher, dass der Test läuft und grün ist. (`rake test`)
* Diese Themen werden behandelt:
    * CSS-Selektoren
    * Scaffolding
    * Verwendung regulärer Ausdrücke in Ruby (gsub, =~, matches)
    
Anfangs Zustand
===============

* 0 von 49 Tests

Aufgabe
=======

Erstelle ein Programm zur Verwaltung mehrerer Konten. Dazu sind folgende Modelle notwendig (Beim Generator die Option -s nicht vergessen!):

* User
    * email:string
    * name:string
    * password_digest:string
    * Hat mehrere Accounts
* Account
    * balance:integer
    * Gehört zu genau einem User
    * Hat viele BookEntries
* Category
    * name:string
    * description:text
    * expression:string
    * Hat viele BookEntries
* BookEntry
    * Gehört zu einem Account
    * Hat viele Categories
    * description:text
    * amount:integer

Weiteres Vorgehen
-----------------

* Erzeuge die notwendigen Modelle, Tabellen und Join-Tabellen
* Der `root_path` soll auf `'categories#index'` zeigen.
* Zu einigen Tests finden sich in den jeweiligen Kommentaren zu dem Test weitere Hinweise zur Implementierung. 

Abgabe
======

Kopiere diesen ganzen Ordner auf den USB-Stick. Benenne den Ordner in deine Matrikelnummer um!