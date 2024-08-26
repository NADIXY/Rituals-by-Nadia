# Rituals App

**Unlock the Power of Rituals - Dive into the World of Magic!**

<img width="972" alt="Bildschirmfoto 2024-08-26 um 03 14 33" src="https://github.com/user-attachments/assets/676c9ab5-88ec-435d-ac01-d14606e14bc7">

## Überblick

Die Rituals App bietet eine einzigartige Plattform, um in die mystische Welt der Magie einzutauchen. Entdecke sorgfältig kuratierte Rituale, die vom Gründer der App erstellt wurden, und erstelle deine eigenen magischen Praktiken. Ob du auf der Suche nach spiritueller Erleuchtung, Schutzritualen oder einfach nur Neugier bist – die Rituals App hat für jeden etwas zu bieten.

## Funktionen

- **Entdecke Rituale:** Stöbere durch eine umfangreiche Liste von Ritualen, die mit Bild, Titel und Beschreibung versehen sind.
- **Favorisiere deine Lieblingsrituale:** Speichere deine favorisierten Rituale auf einem eigenen Bildschirm, um schnell darauf zugreifen zu können. Diese werden sicher in Firebase Firestore gespeichert.
- **Erstelle deine eigenen Rituale:** Erschaffe und personalisiere deine eigenen Rituale mit Titel, Beschreibung und Datum. Du kannst deine Rituale jederzeit bearbeiten oder löschen.
- **Synchronisation mit Firebase:** Alle Daten werden sicher in Firebase Firestore gespeichert und können von überall aus abgerufen werden.
- **Benutzerfreundliches Interface:** Ein klar strukturiertes Design mit einfacher Navigation ermöglicht es dir, dich voll und ganz auf die Magie zu konzentrieren.

## Geplantes Design

Hier sind einige repräsentative Beispiele Designs für die App:

<img width="1664" alt="Bildschirmfoto 2024-08-26 um 04 09 28" src="https://github.com/user-attachments/assets/7a9faa8e-87fc-4ab6-9adc-ba4f38046e4f">

## Features

- [x] Liste von Ritualen anzeigen (mit Bild, Titel, Beschreibung)
- [x] Detailansicht eines Rituals
- [x] Favorisieren und Speichern von Ritualen
- [x] Erstellen, Bearbeiten und Löschen von eigenen Ritualen
- [ ] Benutzerprofile mit individuellen Einstellungen
- [ ] Push-Benachrichtigungen für neue Rituale und Updates
- [ ] Integration weiterer magischer Inhalte und Ressourcen

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
