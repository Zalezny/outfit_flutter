<p align = center>
<img src = "https://github.com/Zalezny/outfit_flutter/assets/65240240/69ece6b0-d3bb-4151-af3a-366e1c4ad358" width="600"/>
</p>
Aplikacja mobilna napisana dla firmy dwuosobowej Katya RG Leotards zajmującej się tworzeniem strojów do lekkoatletyki gimnastycznej. 
Celem aplikacji jest ułatwienie rejestracji i zbierania informacji o czasie tworzenia strojów.
Docelowo aplikacja przeznaczona na Androida z późniejszą możliwością rozszerzenia o iOS. 
Aplikacja używa danych REST API wraz z synchronizacją z lokalną bazą danych Isar (wersja demo posiada jedynie lokalną bazę danych).


## Instalacja

Na początku trzeba sklonować aplikację. Następnie przejść  na branch'a demo: `git checkout demo` (branch na którym nie występują błędy z powodu ukrytych plików) oraz załączyć aplikację w kompilatorze.

## Technologia
Na chwilę obecną zastosowano takie biblioteki jak:
  - bloc - zarządzanie stanem aplikacji
  - isar - lokalna baza danych wykorzystywana w projekcie
  - get_it/injectable - obsługa dependency injection
  - http - obsługa REST API
  - intl - obsługa dat
  - shared_preferences - obsługa przetrzymywania lokalnych zmian
  - nested_scroll_views - obsługa zagnieżdżonych scrollów (w tym wypadku TabBar i listView.builder)
  - flutter_background_service - obsługa serwisu background oraz foreground dla stopera
  - flutter_background_service_android - obsługa serwisu dla androida
  - awesome_notifications - obsługa lokalnych powiadomień foreground oraz ich customizacja dla stopera
  - permission_handler - obsługa permisji dla notyfikacji >= API33
  - freezed - obsługa autogeneracji plików dto
  - pin_code_fields - ui dla kodu pin
  - fluttertoast - ui dla toast'ów informujących użytkownika
  - flutter_picker - picker dla wybrania godziny
  - build_runner - obsługa build'u dla freezed oraz injectable

W projekcie istnieją na chwilę obecną trzy klasy bloc: 
- OutfitBloc - zarządzanie listą strojów oraz obsługa usuwania, dodawania, zczytywania z API itp. 
- WorkTimeBloc - zarządzanie listą czasu pracy nad danym strojem, obsługa usuwania, dodawania, zczytywania z API itp. Bloc ten jest wyodrębniony na dwie inne: MomWorkTimeBloc oraz KatyaWorkTimeBloc poprzez mixins
- StopwatchBloc - zarządzanie obsługą stopera. Komunikuje się także z WorkTimeBloc w celu zapisania liczonego czasu

Do obsługi zapytań REST APi używany jest podział na foldery connections, dto, exceptions oraz services z biblioteką html.


## Schemat Architektury Aplikacji 

<p align = center>
<img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/81dfbf5a-5d7c-40c2-8c2b-2fbf8d09ad9e" >
</p>

## Zdjęcia 

<p align = center>
  <img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/90f4e197-7157-472c-95fe-94224746eb2b" alt="Screenshot 0" width="350">
&nbsp
  <img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/6f285039-7fdc-4d9f-a5d4-ccbcb0d9330f" alt="Screenshot 1" width="350">
&nbsp
  <img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/c6e8f7f1-3b23-415f-9cef-f41070210745" alt="Screenshot 2" width="350">
&nbsp
  <img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/8f95c879-92f7-4d52-9e0a-87284628060d" alt="Screenshot 3" width="350">
&nbsp
  <img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/fe326415-ae39-4aee-919e-d77c91ade357" alt="Screenshot 4" width="350">
&nbsp
  <img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/29bc354f-ebab-477f-8a2e-64cda42231a0" alt="Screenshot 5" width="350">
&nbsp
  <img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/925cf9c4-5149-417e-9740-51e1abc10957" alt="Screenshot 6" width="350">
</p>
