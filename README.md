# Rituals App

**Unlock the Power of Rituals - Dive into the World of Magic!**

![Frame](https://github.com/user-attachments/assets/348fcac5-2591-4a78-8b68-77be1ab7efed)

<!---
<img width="972" alt="Bildschirmfoto 2024-08-26 um 03 14 33" src="https://github.com/user-attachments/assets/676c9ab5-88ec-435d-ac01-d14606e14bc7"> 
--->

## Überblick

Die Rituals App bietet eine einzigartige Plattform, um in die mystische Welt der Magie einzutauchen. Entdecke sorgfältig kuratierte Rituale, die vom Gründer der App erstellt wurden, und erstelle deine eigenen magischen Praktiken. Ob du auf der Suche nach spiritueller Erleuchtung, Schutzritualen oder einfach nur Neugier bist – die Rituals App hat für jeden etwas zu bieten.

## Funktionen

- **Entdecke Rituale:** Stöbere durch eine umfangreiche Liste von Ritualen, die mit Bild, Titel und Beschreibung versehen sind.
- **Favorisiere deine Lieblingsrituale:** Speichere deine favorisierten Rituale auf einem eigenen Bildschirm, um schnell darauf zugreifen zu können. Diese werden sicher in Firebase Firestore gespeichert.
- **Erstelle deine eigenen Rituale:** Erschaffe und personalisiere deine eigenen Rituale mit Titel, Beschreibung und Datum. Du kannst deine Rituale jederzeit bearbeiten oder löschen.
- **Synchronisation mit Firebase:** Alle Daten werden sicher in Firebase Firestore gespeichert und können von überall aus abgerufen werden.
- **Benutzerfreundliches Interface:** Ein klar strukturiertes Design mit einfacher Navigation ermöglicht es dir, dich voll und ganz auf die Magie zu konzentrieren.

## Geplantes Design
<p>
  <img src="https://github.com/user-attachments/assets/1dfac521-d429-4507-87ca-dbaff9dc0371" width="200">
  <img src="https://github.com/user-attachments/assets/b3937568-0358-4e07-8c15-6b4b3280b4d0" width="200">
  <img src="https://github.com/user-attachments/assets/cf4ae07c-7812-4c89-a7b0-2733aa0f2295" width="200">
</p>

<p>
  <img src="https://github.com/user-attachments/assets/4ecd75f7-105f-4c2c-8f87-080399d7cae7" width="200">
  <img src="https://github.com/user-attachments/assets/db96b10c-bbf8-4a4e-acda-46def0a6a5c4" width="200">
  <img src="https://github.com/user-attachments/assets/75a4dfa6-63a1-48ca-a732-c9c50a138b44" width="200">
</p>

## Features

- [x] Liste von Ritualen anzeigen (mit Bild, Titel, Beschreibung)
- [x] Detailansicht eines Rituals
- [x] Favorisieren und Speichern von Ritualen
- [x] Erstellen, Bearbeiten und Löschen von eigenen Ritualen
- [x] Benutzerprofile mit individuellen Einstellungen
- [ ] Push-Benachrichtigungen für neue Rituale und Updates
- [ ] Integration weiterer magischer Inhalte und Ressourcen
--->

## Technischer Aufbau

#### Projektaufbau
Das Projekt folgt dem MVVM-Architekturmuster, um eine klare Trennung von Logik und UI zu gewährleisten. Die Struktur umfasst folgende Hauptkomponenten:

## Komponenten

- **Models**: Datenmodelle, die die Strukturen für Rituale und Benutzerinformationen definieren.
- **ViewModels**: Steuert die Datenlogik und bereitet die Daten für die Anzeige in den Views auf.
- **Views**: Die Benutzeroberfläche, die die Daten aus den ViewModels darstellt.
- **Repositories**: Zuständig für die Kommunikation mit den Datenquellen wie Firebase Firestore.
- **Services**: Enthält alle Netzwerk- und API-Serviceklassen, die für die Kommunikation mit externen Datenquellen verantwortlich sind.

## Datenspeicherung

Die App speichert folgende Daten:

- **Rituale**: Titel, Beschreibung, Benutzer-ID und Erstellungsdatum. Diese Daten werden in Firebase Firestore gespeichert.
- **Favorisierte Rituale**: Speichert die favorisierten Rituale eines Nutzers in einer separaten Sammlung in Firestore, basierend auf der Benutzer-ID.

## API Calls

Für die Simulation von API-Calls wird eine Fake App User API verwendet, die mit Async Await implementiert wird. Diese API dient zum Testen und Entwickeln von Benutzerinteraktionen.

URL: "https://jsonplaceholder.typicode.com/"

## 3rd-Party Frameworks

Die App nutzt folgende Frameworks und Technologien:

- **Firebase**: Für Authentifizierung.
- **MapKit**: Zur Integration von Karten, wenn zukünftige Features dies erfordern.

## Ausblick

Die Rituals App ist ein dynamisches Projekt mit einem klaren Fokus auf kontinuierliche Verbesserung und Erweiterung. Hier sind einige der zukünftigen Pläne:

- **Erweiterung des Ritual-Angebots**: Hinzufügen weiterer Rituale, insbesondere solche, die von der Community erstellt wurden.
- **Social Features**: Möglichkeit, Rituale mit anderen Nutzern zu teilen und Feedback zu geben.
- **Erweiterte Benutzerprofile**: Benutzer können mehr persönliche Informationen und Einstellungen speichern, die ihre magischen Präferenzen widerspiegeln.
- **Integration von Tutorials**: Schritt-für-Schritt-Anleitungen und Videos zur Durchführung von Ritualen.
- **Lokalisierung**: Unterstützung weiterer Sprachen, um eine breitere internationale Nutzerbasis zu erreichen.
- **Offline-Funktionalität**: Nutzung der App ohne Internetverbindung, wobei die Synchronisation bei der nächsten Verbindung erfolgt.

Alle geplanten Features und Erweiterungen werden in Form von Issues dokumentiert und in zukünftigen Releases implementiert.
