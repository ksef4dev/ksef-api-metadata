# Lista błędów API KSeF z wyjaśnieniem

|kod wyjątku | opis| Wyjaśnienie |
|:----|:----|:------|
|9101 | Nieprawidłowy dokument.| |
|9102 | Brak podpisu.| |
|9103 | Przekroczona liczba [-1] dozwolonych podpisów [-1].| |
|9104 | Niewystarczająca liczba [-1] wymaganych podpisów [-1].| |
|9105 | Nieprawidłowa treść podpisu.| |
|9106 | Nieprawidłowa liczba referencji podpisu [STRING].| |
|9107 | Niezgodność lub nieprawidłowa referencja podpisanych danych [STRING].| |
|9108 | Nieprawidłowa liczba danych referencji podpisu [STRING].| |
|9109 | Brak danych referencji podpisu [STRING].| |
|9110 | Brak referencji do danych podpisu [STRING].| |
|20001 | Niedozwolone sekcje dokumentu.| |
|20002 | Niedozwolone sekcje dokumentu [DTD].| |
|20003 | Niedozwolone sekcje dokumentu [CDATA].| |
|20004 | Nieprawidłowo zakodowana treść (base64).| |
|20005 | Nieprawidłowo zaszyfrowana treść.| |
|20006 | Nieprawidłowy format czasu.| |
|21001 | Nieczytelna treść.| |
|21111 | Nieprawidłowe wyzwanie autoryzacyjne.| |
|21112 | Nieprawidłowy czas tokena.| |
|21116 | Nieprawidłowy token.| |
|21121 | Limit żądań osiągnięty.| Osiągnięto limit wywołań danego endpoint. Wartości limitów do pobrania ze strony MF https://ksef-test.mf.gov.pl/document/LimitValues/1.3/PL |
|21133 | Brak treści faktury żądania wysyłki faktury.| |
|21135 | Brak definicji pakietu.| |
|21136 | Brak definicji szyfrowania.| |
|21137 | Brak sygnatury pliku faktury.| |
|21139 | Brak sygnatury pliku pakietu.| |
|21140 | Brak sygnatury pakietu.| |
|21141 | Brak listy części pakietu.| |
|21143 | Nieprawidłowy typ klucza szyfrującego.| |
|21144 | Nieprawidłowy typ wektora inicjalizacyjnego.| |
|21145 | Nieprawidłowy typ dokumentu.| |
|21146 | Nieprawidłowy typ żądania wysyłki faktury.| |
|21147 | Sprzeczny typ żądania wysyłki faktury.| |
|21148 | Brak numeru referencyjnego.| |
|21149 | Brak sesji.| |
|21151 | Sesja wsadowa nieaktywna.| |
|21153 | Sesja interaktywna nieaktywna.| "
|21154 | Sesja interaktywna zakończona.| |
|21156 | Nieprawidłowa definicja części pakietu.| |
|21157 | Nieprawidłowy rozmiar części pakietu.| |
|21158 | Nieprawidłowy skrót części pakietu.| |
|21159 | Nieprawidłowy podpis.| |
|21160 | Nieprawidłowy kontekst [STRING].| |
|21162 | Nieprawidłowe żądanie [STRING].| |
|21164 | Faktura o podanym identyfikatorze nie istnieje.| |
|21168 | Poświadczenia o podanym identyfikatorze nie istnieją.| |
|21169 | Brak autoryzacji lub faktura o podanym identyfikatorze nie istnieje.| |
|21170 | Sesja interaktywna wygasła.| |
|21171 | Brak tokena sesyjnego.| |
|21172 | Pusta treść żądania.| |
|21173 | Brak sesji o wskazanym numerze referencyjnym.| |
|21174 | Brak nazwy części.| |
|21175 | Wynik zapytania o podanym identyfikatorze nie istnieje.| |
|21176 | Duplikat faktury w kontekście sesji.| |
|21177 | Przekroczona maksymalna liczba wyników [-1]. Doprecyzuj kryteria.| |
|21178 | Nie znaleziono UPO dla podanych kryteriów| |
|21179 | Konflikt wersji żądania i odpowiedzi.| |
|21180 | Nieprawidłowe żądanie.| W większości przypadków oaznacza nieprawidłowy URL endpointu |
|21181 | Sprzedawcy nie są identyczni dla wszystkich podanych faktur.| |
|21182 | Nie wszystkie podane faktury istnieją w systemie.| |
|21183 | Podana faktura nie istnieje w systemie bądź nie znaleziono dla niej identyfikatorów płatności.|  |
|21184 | Podany identyfikator płatności nie istnieje w systemie.| |
|21186 | Wystawca nie może ukrywać faktur.| |
|21187 | Faktura jest już ukryta.| |
|21188 | Faktura nie jest ukryta lub nie można uzyskac do niej dostępu.| |
|21189 | Kontekst źródłowy jest nieuprawnionym typem podmiotu do zgłoszenia nadużycia dla faktury o podanym identyfikatorze.| |
|21190 | Kontekst źródłowy posiada już aktywne zgłoszenie nadużycia dla faktury o podanym identyfikatorze.| |
|21191 | Kontekst źródłowy nie posiada aktywnego zgłoszenia nadużycia dla faktury o podanym identyfikatorze.| |
|21192 | Co najmniej jedno z uprawnień zostało już nadane na jeden z powiązanych identyfikatorów| |
|21193 | Dla podanego kontekstu nie znaleziono identyfikatorów zbiorczych.| |
|21194 | Podana faktura i sesja nie są zgodne.| |
|21204 | Pakiet nie może być zduplikowany.| |
|21205 | Pakiet nie może być pusty.| |
|21206 | Część listy pakietu nie może być pusta.| |
|21207 | Lista elementów pakietu nie może być pusta.| |
|21208 | Czas oczekiwania na requesty upload lub finish został przekroczony.| |
|21211 | Nieprawidłowa deklaracja formularza dokumentu.| |
|21212 | Nieprawidłowy wystawca dokumentu.| |
|21216 | Nieprawidłowa kompresja.| |
|21217 | Nieprawidłowe kodowanie znaków.| |
|21218 | Duplikat faktury w kontekście pakietu.| |
|21301 | Brak autoryzacji.| np. brak uprawnienia do samofakturowania |
|21302 | Token nieaktywny.| | 
|21303 | Token unieważniony.| |
|21304 | Brak uwierzytelnienia.| w większości przypadłów oznacza, że sesja jest jeszcze nie "gotowa", trzeba odczekać i spróbować ponownie |
|21305 | Brak uwierzytelnienia certyfikatu.| |
|21306 | Nieprawidłowa operacja na uprawnieniach.| |
|21307 | Proces uwierzytelnienia zakończył się niepowodzeniem. Próba wykorzystania metod autoryzacyjnych osoby zmarłej| |
|21401 | Dokument nie jest zgodny ze schemą (xsd).| |
|21402 | Nieprawidłowy rozmiar pliku.| |
|21403 | Nieprawidłowy skrót pliku.| |
|21404 | Nieprawidłowy format dokumentu (json).| |
|21405 | Dokument nie jest zgodny ze schemą (json).| |
|21406 | Konflikt podpisu i typu uwierzytelnienia.| |
|21407 | Nieprawidłowy podmiot podpisu.| |
|21409 | Token o podanym identyfikatorze nie istnieje.| |
|21410 | Nieprawidłowy kontekst szyfrowania.| |
|21411 | Nieprawidłowe kodowanie.| |
|21412 | Nieprawidłowy klucz szyfrujacy.| |
|21413 | Nieprawidłowy typ zapytania (plain/encrypted).| |
|21414 | Nieobsługiwana wersja zapytania.| |
|21415 | Brak odszyfrowanego klucza dla sesji w Podprocesie Uwierzytelniania.| |
|21416 | Wersja dokumentu niezgodna z zadeklarowaną podczas nawiązywania sesji.| |
|21417 | Nieobsługiwana wersja dokumentu| |
|21418 | Identyfikator drugiego podmiotu nie może być pusty.| |
|21419 | Identyfikator drugiego podmiotu musi być NIP'em.| |
|21420 | Certyfikat nie jest zgodny z podanymi danymi.| |
|21421 | Podany dostawca peppol został już zarejerstrowany wcześniej.| |
|21422 | Dostawca peppol może mieć nadaną jedynie role invoice_write| |
|21423 | Nie znaleziono korygowanej faktury| |
|23001 | Brak treści [STRING].| |
|24001 | Nieprawidłowy numer referencyjny.| |
|24002 | Nieprawidłowa suma kontrolna identyfikatora wewnętrznego.| |
|31000 | Nieprawidłowe wywołanie.| Błąd nieudokumentowany, najprawdopdobniej skutek usunuętych przez MF danych historycznych |
