

# Opis

Aplikacja powstaje dla firmy dwuosobowej Katya RG Leotards zajmującej się tworzeniem strojów do lekkoatletyki gimnastycznej. Celem aplikacji jest ułatwienie rejestracji i zbierania informacji o czasie tworzenia strojów. Docelowo aplikacja przeznaczona na Androida z późniejszą możliwością rozszerzenia o iOS. Aplikacja po I etapie będzie rozszerzana o lokalną bazę danych sqflite i synchronizację jej z backendem.

## Technologia
Na chwilę obecną zastosowano takie biblioteki jak:
  - bloc - zarządzanie stanem aplikacji
  - http - obsługa REST API
  - get_it/injectable - obsługa dependency injection
  - intl - obsługa dat
  - shared_preferences - obsługa przetrzymywania lokalnych zmian
  - nested_scroll_views - obsługa zagnieżdżonych scrollów (w tym wypadku TabBar i listView.builder)
  - flutter_background_service - obsługa serwisu background oraz foreground dla stopera
  - flutter_background_service_android - obsługa serwisu dla androida
  - flutter_local_notifications - obsługa lokalnych notyfikacji
  - freezed - obsługa autogeneracji plików dto
  - build_runner - obsługa build'u dla freezed oraz injectable

W projekcie istnieją na chwilę obecną dwie klasy bloc: 
- OutfitBloc - zarządzanie listą strojów oraz obsługa usuwania, dodawania, zczytywania z API itp. 
- WorkTimeBloc - zarządzanie listą czasu pracy nad danym strojem, obsługa usuwania, dodawania, zczytywania z API itp. Bloc ten jest wyodrębniony na dwie inne: MomWorkTimeBloc oraz KatyaWorkTimeBloc poprzez mixins

Do obsługi zapytań REST APi używany jest podział na foldery connections, dto, exceptions oraz services.


## TODO

- Implementacja próśb o permisje
- Implementacja ikony aplikacji
- Implementacja dialogów
- Wprowadzenie ręczne godzin

## Zdjęcia z postępów

<p align = center>
<img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/90f4e197-7157-472c-95fe-94224746eb2b" alt="Screenshot 3" width="400">
&nbsp
<img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/6f285039-7fdc-4d9f-a5d4-ccbcb0d9330f" alt="Screenshot 1" width="400">
<img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/c6e8f7f1-3b23-415f-9cef-f41070210745" alt="Screenshot 2" width="400">
</p>
