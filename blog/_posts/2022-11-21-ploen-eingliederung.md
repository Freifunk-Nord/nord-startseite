---
layout: post
title: Freifunk Nord Domains
published: true
---



Moin,

das FreifunkNord Netz ist aktuell in drei Bereiche unterteilt: Plön-Ostholstein (ploh), Kreis Steinburg (iz) und Nord (nord). Für jeden Bereich gibt es jeweils eine Firmware, die unabhängig gewartet und aktualisiert werden muss. Das sorgt leider dafür, dass viel Arbeit doppelt bzw. dreifach gemacht werden muss. Um das zu vereinfachen und den Overhead zu reduzieren, werden die drei Bereiche in eine Firmware zusammengefasst. Die Bereich-spezifischen Einstellungen werden in Form von "Domains" erhalten bleiben.

Eine [Domain](https://gluon.readthedocs.io/en/v2020.2.3/features/multidomain.html) ist dabei nur noch eine voreingestellte Konfiguration des Routers, die bei der Installation ausgewählt, oder bei Bedarf auch geändert werden kann.

**Über die nächsten Wochen wird es mehrere Updates geben, mit denen die Router automatisch auf die neue Firmware migrieren.**

In Zukunft wird es also nur noch eine Freifunknord Firmware mit 3 Domains geben. Damit alle Router automatisch die richtige Domain auswählen, sind mehrere Updates nötig. Technisch werden die Bereiche `ploh` und `iz` in die Firmware für `nord` integriert. Der Aublauf sieht so aus (das `x` steht für  `ploh` und `iz`):

1. Alte Firmware bekommt eine Domain `x`, die als default markiert ist
2. Router updaten und merken sich `x` als ihre Domain
3. FFNord-Firmware bekommt zusätzlich eine Domain `x`
4. Alte Firmware bekommt die neue Nord-Firmware über den Autoupdate
5. Router aus den verschiedenen Bereichen wählen sich beim Update ihre Domain `x`, da sie sich diese bei Schritt 2 gespeichert haben


Falls ihr Fragen habt kommt gerne in unseren Matrix Chat und stellt sie dort oder schreibt uns eine Email.

Viele Grüße und frohes Funken<br>
Euer Freifunknord-Team
