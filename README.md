# Rituals App

**Schalte die Kraft der Rituale frei - Tauche ein in die Welt der Magie!**

![Frame](https://github.com/user-attachments/assets/348fcac5-2591-4a78-8b68-77be1ab7efed)

## Überblick

Die Rituals App bietet eine einzigartige Plattform, um in die mystische Welt der Magie einzutauchen. Entdecke sorgfältig kuratierte Rituale, die vom Gründer der App erstellt wurden und erstelle deine eigenen magischen Praktiken. Ob du auf der Suche nach spiritueller Erleuchtung, Schutzritualen oder einfach nur Neugier bist – die Rituals App hat für jeden etwas zu bieten.

## Funktionen

- **Entdecke Rituale:** Stöbere durch eine umfangreiche Liste von Ritualen, die mit Bild, Titel und Beschreibung versehen sind.
- **Favorisiere deine Lieblingsrituale:** Speichere deine favorisierten Rituale auf einem eigenen Bildschirm, um schnell darauf zugreifen zu können. Diese werden sicher in Firebase Firestore gespeichert.
- **Erstelle deine eigenen Rituale:** Erschaffe und personalisiere deine eigenen Rituale mit Titel, Beschreibung und Datum. Du kannst deine Rituale jederzeit bearbeiten oder löschen.
- **Teilen Sie Ihre Videos:** Teilen Sie Ihre Rituale mit Schritt-für-Schritt-Anleitungen zur Durchführung von Ritualen
- **Synchronisation mit Firebase:** Alle Daten werden sicher in Firebase Firestore gespeichert und können von überall aus abgerufen werden.
- **Benutzerfreundliches Interface:** Ein klar strukturiertes Design mit einfacher Navigation ermöglicht es dir, dich voll und ganz auf die Magie zu konzentrieren.

## Design

### LOGIN | REGISTER | HOME   
<p>
  <img src="https://github.com/user-attachments/assets/45d224de-ff53-461f-99e7-d6fddc4eb90c" width="200">
  <img src="https://github.com/user-attachments/assets/66be34b9-a04b-4822-af51-0f1ceabcb12d" width="200">
  <img src="https://github.com/user-attachments/assets/eb05a97d-9b06-4bd7-bb69-cbbebd10a330" width="200">
</p>

### FAVORITES | DETAILS | MAPS
<p>
  <img src="https://github.com/user-attachments/assets/896f7569-f2ea-4e3a-b487-43e6d41f333e" width="200">
  <img src="https://github.com/user-attachments/assets/44bbe4b6-eb54-444f-b93f-5c7a9b73ff0c" width="200">
  <img src="https://github.com/user-attachments/assets/1bfd0dda-fea4-4b07-be92-3abc55c98240" width="200">
</p>

 ### USERS API | ABOUT MAGIC | ABOUT MAGIC DETAILS
<p>
  <img src="https://github.com/user-attachments/assets/9e463d13-a96f-4948-ab79-665a91fd72cd" width="200">
  <img src="https://github.com/user-attachments/assets/a5d18a96-188e-4123-9116-49b7462ec3a9" width="200">
  <img src="https://github.com/user-attachments/assets/bd307e4d-45a1-432a-821d-e60cf7fba38f" width="200"> 
</p>

###  COMMUNITY VIDEOS | SHEET TO SELECT VIDEOS | SHEET WITH ALBUMS
<p>
  <img src="https://github.com/user-attachments/assets/46c65b0b-6b38-4102-9c93-792a255e8b92" width="200">
  <img src="https://github.com/user-attachments/assets/794a5f61-63ec-44a3-9454-dd911abba0a8" width="200">
  <img src="https://github.com/user-attachments/assets/088cf475-b299-4f4e-b858-79dce0194483" width="200">
</p>

### USERS RITUALS |  SHEET TO ADD USER RITUALS | VIEW TO UPDATE USER RITUALS
<p>
  <img src="https://github.com/user-attachments/assets/7c4e86fd-4927-4324-9675-454293758498" width="200">
  <img src="https://github.com/user-attachments/assets/d98a4a48-fb62-4097-9622-544c838a78d0" width="200">
  <img src="https://github.com/user-attachments/assets/15eaa6a4-e47b-4edf-872d-74371e24cb09" width="200">
</p>

## Features

- [x] Liste von Ritualen anzeigen (mit Bild, Titel, Beschreibung)
- [x] Detailansicht eines Rituals
- [x] Favorisieren und Speichern von Ritualen
- [x] Erstellen, Bearbeiten und Löschen von eigenen Ritualen
- [x] Benutzerprofile mit individuellen Einstellungen
- [x] Integration weiterer magischer Inhalte und Ressourcen
- [ ] Push-Benachrichtigungen für neue Rituale und Updates


## Technischer Aufbau

#### Projektaufbau
Das Projekt folgt dem MVVM-Architekturmuster, um eine klare Trennung von Logik und UI zu gewährleisten. Die Struktur umfasst folgende Hauptkomponenten:

## Komponenten

- **Models**: Datenmodelle, die die Strukturen für Rituale und Benutzerinformationen definieren.
- **ViewModels**: Steuert die Datenlogik und bereitet die Daten für die Anzeige in den Views auf.
- **Views**: Die Benutzeroberfläche, die die Daten aus den ViewModels darstellt.
- **Repositories**: Zuständig für die Kommunikation mit den Datenquellen wie APIs & Firebase Firestore.
- **Services**: Enthält alle Netzwerk- Serviceklassen, die für die Kommunikation mit externen Datenquellen verantwortlich sind.

## Datenspeicherung

Die App speichert folgende Daten:

- **Favorisierte Rituale**: Speichert die favorisierten Rituale eines Nutzers in einer separaten Sammlung in Firestore, basierend auf der Benutzer-ID.
- **Rituale**: Titel, Beschreibung, Benutzer-ID und Erstellungsdatum. Diese Daten werden in Firebase Firestore gespeichert.
- **Rituale Videos**: Benutzer Videos. Diese Daten werden in Firebase Firestore gespeichert.

Die App Daten:

- **About Magic**: Die vom Gründer der App erstellte Inhalte, wird in Firebase Firestore, Storage gespeichert und in die App angezeigt.
- **Recommended Rituals**: Die vom Gründer der App erstellte Inhalte, wird in Firebase Firestore, Storage gespeichert und in die App angezeigt.

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
- **Integration von Tutorials**: Schritt-für-Schritt-Video-Anleitungen zur Durchführung von Ritualen.
- **Social Features**: Möglichkeit, Rituale mit anderen Nutzern zu teilen und Feedback zu geben.
- **Erweiterte Benutzerprofile**: Benutzer können mehr persönliche Informationen und Einstellungen speichern, die ihre magischen Präferenzen widerspiegeln.
- **Lokalisierung**: Unterstützung weiterer Sprachen, um eine breitere internationale Nutzerbasis zu erreichen.

Alle geplanten Features und Erweiterungen werden in Form von Issues dokumentiert und in zukünftigen Releases implementiert.
