---
layout: post
title: Freifunk Nord Domains
published: false
---

<div style="line-height: 20px;white-space: pre-wrap;">

Moin,

das FreifunkNord Netz ist aktuell in 3 Bereiche unterteilt: Plön-Ostholstein (ploh), Kreis Steinburg (iz) und Nord (nord). Für jeden Bereich existiert jeweils eine Firmware, die unabhängig gewartet und aktualisiert werden muss. Das sorgt leider für relativ viele Dinge, die im Grunde gleich sind aber eben 3 mal gemacht werden müssen. Um das zu vereinfachen werden hat unser Firmware-Framework [gluon](https://github.com/freifunk-gluon/gluon) ein "Domain"-Feature.

Eine Domain ist dabei nur noch eine voreingestellte Konfiguration des Routers, die bei der Installation ausgewählt, oder bei Bedarf auch geändert werden kann.

**Über die nächsten Wochen wird es mehrere Updates geben, mit dennen die Router automatisch auf die neue Firmware migrieren.**


In Zukunft wird es also nur noch eine Freifunknord Firmware mit 3 Domains geben. Damit die Router automatisch die richtige Domain auswählen, sind mehrere Updates nötig. Technisch werden die Bereiche `ploh` und `iz` in die Firmware für `nord` integriert. Der Aublauf sieht dann so aus (das `x` ist in `ploh`, `iz`):

1. Alte Firmware bekommt eine Domain `x`, die als default markiert ist
1. Router updaten und merken sich `x` als ihre Domain
1. FFNord-Firmware bekommt zusätzlich eine Domain `x`
1. Alte Firmware bekommt die neue Nord-Firmware über den Autoupdate
1. Router aus den verschiedenen Bereichen wählen sich beim Update ihre Domain `x`, da sie sich diese bei Schritt 2 gespeichert haben


Falls ihr Fragen habt kommt gerne in unseren Matrix Chat und stellt sie dort oder schreibt uns eine Email.

Viele Grüße und frohes Funken
Euer Freifunknord-Team

</div>
