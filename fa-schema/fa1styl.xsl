<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="http://crd.gov.pl/wzor/2021/11/29/11089/" version="1.0">
	<xsl:import href="WspolneSzablonyWizualizacji_v11-0E.xsl"/>
	<xsl:output method="html" encoding="UTF-8" indent="yes" version="4.01" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
	<xsl:template name="TytulDokumentu">
		e-FAKTURA KSeF
	</xsl:template>
	<xsl:template name="StyleDlaFormularza">
		<style type="text/css">

			.tlo-formularza { background-color:#D3D3D3; }
			table.wrapping, .break-word {
			white-space: normal !important;
			word-wrap: break-word;
			}

			table {
			width:100%;
			}

			.word-break {
			width:100%;
			word-break: break-all;
			}

			.lewa {	border: 1px solid black; font-size: 1.2em; padding: 1px; vertical-align: top; text-align: left;}
			.srodek { border: 1px solid black; font-size: 1.2em; padding: 1px; vertical-align: top; text-align: center;}
			.prawa { border: 1px solid black; font-size: 1.2em; padding: 1px; vertical-align: top; text-align: right;}
		</style>
	</xsl:template>
	<xsl:template match="tns:Faktura">
		<div class="deklaracja">
			<div class="naglowek">
				<table>
					<tr>
						<td colspan="2">
							<span class="kod-formularza">
								<xsl:value-of select="tns:Naglowek/tns:KodFormularza"/>
							</span>
							<xsl:text> </xsl:text>
							<span class="wariant">(<xsl:value-of select="tns:Naglowek/tns:WariantFormularza"/>)</span>
						</td>
					</tr>
					<tr>
						<td class="etykieta">Kod systemowy <b>
							<xsl:value-of select="tns:Naglowek/tns:KodFormularza/@kodSystemowy"/>
						</b>
						</td>
					</tr>
				</table>
			</div>
			<xsl:call-template name="NaglowekTytulowyKSeF"/>
			<xsl:call-template name="NaglowekTytulowy">
				<xsl:with-param name="uzycie" select="'deklaracja'"/>
				<xsl:with-param name="nazwa">
					<xsl:choose>
						<xsl:when test="tns:Fa/tns:RodzajFaktury = 'VAT'">
							<xsl:text>Faktura VAT</xsl:text>
						</xsl:when>
						<xsl:when test="tns:Fa/tns:RodzajFaktury = 'KOR'">
							<xsl:text>Faktura korygująca</xsl:text>
						</xsl:when>
						<xsl:when test="tns:Fa/tns:RodzajFaktury = 'ZAL'">
							<xsl:text>Faktura (zaliczkowa)</xsl:text>
							<br/>
							<xsl:text>dokumentująca otrzymanie zapłaty lub jej części przed dokonaniem czynności oraz faktura wystawiona w związku z art. 106f ust. 4 ustawy</xsl:text>
						</xsl:when>
						<xsl:when test="tns:Fa/tns:RodzajFaktury = 'ROZ'">
							<xsl:text>Faktura wystawiona w związku z art. 106f ust. 3 ustawy (rozliczająca)</xsl:text>
						</xsl:when>
						<xsl:when test="tns:Fa/tns:RodzajFaktury = 'UPR'">
							<xsl:text>Faktura (uproszczona), o której mowa w art. 106e ust. 5 pkt 3 ustawy</xsl:text>
						</xsl:when>
						<xsl:when test="tns:Fa/tns:RodzajFaktury = 'KOR_ZAL'">
							<xsl:text>Faktura korygująca fakturę dokumentującą otrzymanie zapłaty lub jej części przed dokonaniem czynności oraz fakturę wystawioną w związku z art. 106f ust. 4 ustawy (zaliczkową)</xsl:text>
						</xsl:when>
						<xsl:when test="tns:Fa/tns:RodzajFaktury = 'KOR_ROZ'">
							<xsl:text>Faktura korygująca fakturę wystawioną w związku z art. 106f ust. 3 ustawy (rozliczającą)</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="SystemTeleinfor"/>
			<xsl:call-template name="SprzedawcaNabywca"/>
			<xsl:call-template name="InnyPodmiot"/>
			<xsl:call-template name="PodmiotUpowazniony"/>
			<xsl:call-template name="NrFaktury"/>
			<xsl:call-template name="NrFakturyKOR"/>
			<xsl:call-template name="FaktoraWiersze"/>
			<xsl:call-template name="PodliczenieVAT"/>
			<xsl:call-template name="Platnosc"/>
			<xsl:call-template name="Adnotacje"/>
			<xsl:call-template name="PrzyczynaKorekty"/>
			<xsl:call-template name="NoweSrodkiTransportu"/>
			<xsl:call-template name="DodatkowyOpis"/>
			<xsl:call-template name="Rozliczenie"/>
			<xsl:call-template name="WarunkiTransakcji"/>
			<xsl:call-template name="Zamowienie"/>
			<xsl:call-template name="WZ"/>
			<xsl:call-template name="Stopka"/>
		</div>
	</xsl:template>
	<xsl:template name="NaglowekTytulowyKSeF">
		<div style="text-align:left">
			<b>Krajowy System <font style="color:red">e</font>-Faktur (KS<font style="color:red">e</font>F)</b>
		</div>
	</xsl:template>
	<xsl:template name="SystemTeleinfor">
		<td class="niewypelnianeopisy">Data i czas wytworzenia faktury: </td>
		<td class="wypelniane">
			<b>
				<xsl:value-of select="tns:Naglowek/tns:DataWytworzeniaFa"/>
			</b>
		</td>
		<br/>
		<xsl:if test="tns:Naglowek/tns:SystemInfo">
			<table class="break-word">
				<tr>
					<td>Nazwa systemu teleinformatycznego, z którego korzysta podatnik:
						<b>
							<xsl:value-of select="tns:Naglowek/tns:SystemInfo"/>
						</b>
					</td>
				</tr>
			</table>
		</xsl:if>
		<br/>
		<br/>
		<br/>
	</xsl:template>
	<xsl:template name="NrFaktury">
		<table class="break-word" width="100%">
			<tr>
				<td>
					Kod waluty:
					<b>
						<xsl:value-of select="tns:Fa/tns:KodWaluty"/>
					</b>
				</td>
			</tr>
			<tr>
				<td>
					Numer faktury:
					<b>
						<xsl:value-of select="tns:Fa/tns:P_2"/>
					</b>
				</td>
			</tr>
			<tr>
				<td>
					Data wystawienia:
					<b>
						<xsl:value-of select="tns:Fa/tns:P_1"/>
					</b>
				</td>
			</tr>
			<xsl:if test="tns:Fa/tns:P_1M">
				<tr>
					<td>Miejsce wystawienia:
						<b>
							<xsl:value-of select="tns:Fa/tns:P_1M"/>
						</b>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td>
					<xsl:choose>
						<xsl:when test="tns:Fa/tns:P_6">
							<xsl:if test="((tns:Fa/tns:RodzajFaktury = 'VAT') or (tns:Fa/tns:RodzajFaktury = 'KOR') or (tns:Fa/tns:RodzajFaktury = 'ROZ') or (tns:Fa/tns:RodzajFaktury = 'KOR_ROZ') or (tns:Fa/tns:RodzajFaktury = 'UPR'))">
								Data dokonania lub zakończenia dostawy towarów lub wykonania usługi:
							</xsl:if>
							<xsl:if test="((tns:Fa/tns:RodzajFaktury = 'ZAL') or (tns:Fa/tns:RodzajFaktury = 'KOR_ZAL'))">
								Data otrzymania zapłaty:
							</xsl:if>
							<b>
								<xsl:value-of select="tns:Fa/tns:P_6"/>
							</b>
						</xsl:when>
						<xsl:when test="tns:Fa/tns:OkresFa">
							<xsl:text>Data otrzymania zapłaty: od </xsl:text>
							<b>
								<xsl:value-of select="tns:Fa/tns:OkresFa/tns:P_6_Od"/>
							</b>
							<xsl:text> do </xsl:text>
							<b>
								<xsl:value-of select="tns:Fa/tns:OkresFa/tns:P_6_Do"/>
							</b>
						</xsl:when>
					</xsl:choose>
				</td>
			</tr>
			<xsl:if test="tns:Fa/tns:FP = '1'">
				<tr>
					<td>Faktura, o której mowa w art. 109 ust. 3d ustawy:
						<input type="checkbox" checked="checked" disabled="disabled"/>
						<b>1. Tak</b>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="tns:Fa/tns:TP = '1'">
				<tr>
					<td>Istniejące powiązania między nabywcą a dokonującym dostawy towarów lub usługodawcą:
						<input type="checkbox" checked="checked" disabled="disabled"/>
						<b>1. Tak</b>
					</td>
				</tr>
			</xsl:if>
			<br/>
			<br/>
		</table>
	</xsl:template>
	<xsl:template name="NrFakturyKOR">
		<xsl:if test="tns:Fa/tns:DaneFaKorygowanej">
			<br/>
			<table class="break-word">
				<tr>
					<td class="niewypelniane" width="60%">Numer faktury korygowanej</td>
					<td class="niewypelniane" width="10%">Data wystawienia faktury, której dotyczy faktura korygująca</td>
					<td class="niewypelniane" width="30%">Numer identyfikujący fakturę korygowaną w Krajowym Systemie e-Faktur (KSeF)</td>
				</tr>
				<xsl:for-each select="tns:Fa/tns:DaneFaKorygowanej">
					<tr>
						<td class="wypelniane" width="60%">
							<xsl:value-of select="tns:NrFaKorygowanej"/>
						</td>
						<td class="wypelniane" width="10%">
							<xsl:value-of select="tns:DataWystFaKorygowanej"/>
						</td>
						<td class="wypelniane" width="30%">
							<xsl:value-of select="tns:NrKSeFFaKorygowanej"/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="SprzedawcaNabywca">
		<br/>
		<table class="break-word">
			<tr>
				<td style="width:50%">
					<b>SPRZEDAWCA</b>
				</td>
				<td style="width:50%">
					<b>NABYWCA</b>
					<br/>
					<br/>
				</td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot1/tns:NrEORI">
						<xsl:text>Numer EORI: </xsl:text>
						<xsl:value-of select="tns:Podmiot1/tns:NrEORI"/>
					</xsl:if>
				</td>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot2/tns:NrEORI">
						<xsl:text>Numer EORI: </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:NrEORI"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot1/tns:DaneIdentyfikacyjne/tns:PelnaNazwa">
						<xsl:value-of select="tns:Podmiot1/tns:DaneIdentyfikacyjne/tns:PelnaNazwa"/>
					</xsl:if>
					<xsl:if test="tns:Podmiot1/tns:DaneIdentyfikacyjne/tns:Nazwisko">
						<xsl:value-of select="tns:Podmiot1/tns:DaneIdentyfikacyjne/tns:ImiePierwsze"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot1/tns:DaneIdentyfikacyjne/tns:Nazwisko"/>
					</xsl:if>
				</td>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot2/tns:DaneIdentyfikacyjne/tns:PelnaNazwa">
						<xsl:value-of select="tns:Podmiot2/tns:DaneIdentyfikacyjne/tns:PelnaNazwa"/>
					</xsl:if>
					<xsl:if test="tns:Podmiot2/tns:DaneIdentyfikacyjne/tns:Nazwisko">
						<xsl:value-of select="tns:Podmiot2/tns:DaneIdentyfikacyjne/tns:ImiePierwsze"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:DaneIdentyfikacyjne/tns:Nazwisko"/>
					</xsl:if>
				</td>
				<td/>
			</tr>
			<tr>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot1/tns:DaneIdentyfikacyjne/tns:NazwaHandlowa">
						<xsl:value-of select="tns:Podmiot1/tns:DaneIdentyfikacyjne/tns:NazwaHandlowa"/>
					</xsl:if>
				</td>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot2/tns:DaneIdentyfikacyjne/tns:NazwaHandlowa">
						<xsl:value-of select="tns:Podmiot2/tns:DaneIdentyfikacyjne/tns:NazwaHandlowa"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<xsl:if test="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:KodKraju">
					<td style="width:50%">
						<xsl:apply-templates select="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:KodKraju"/>
					</td>
				</xsl:if>
				<xsl:if test="tns:Podmiot1/tns:Adres/tns:AdresZagr/tns:KodKraju">
					<td style="width:50%">
						<xsl:apply-templates select="tns:Podmiot1/tns:Adres/tns:AdresZagr/tns:KodKraju"/>
					</td>
				</xsl:if>
				<xsl:if test="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:KodKraju">
					<td style="width:50%">
						<xsl:apply-templates select="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:KodKraju"/>
					</td>
				</xsl:if>
				<xsl:if test="tns:Podmiot2/tns:Adres/tns:AdresZagr/tns:KodKraju">
					<td style="width:50%">
						<xsl:apply-templates select="tns:Podmiot2/tns:Adres/tns:AdresZagr/tns:KodKraju"/>
					</td>
				</xsl:if>
			</tr>
			<tr>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:Wojewodztwo">
						<xsl:value-of select="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:Wojewodztwo"/>
					</xsl:if>
				</td>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:Wojewodztwo">
						<xsl:value-of select="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:Wojewodztwo"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:Powiat">
						<xsl:value-of select="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:Powiat"/>
					</xsl:if>
				</td>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:Powiat">
						<xsl:value-of select="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:Powiat"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:Gmina">
						<xsl:value-of select="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:Gmina"/>
					</xsl:if>
				</td>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:Gmina">
						<xsl:value-of select="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:Gmina"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<xsl:if test="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:Ulica|tns:Podmiot1/tns:Adres/tns:AdresPol/tns:NrDomu">
					<td style="width:50%">
						<xsl:value-of select="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:Ulica"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:NrDomu"/>
						<xsl:if test="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:NrLokalu">
							<xsl:text>/</xsl:text>
							<xsl:value-of select="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:NrLokalu"/>
						</xsl:if>
					</td>
				</xsl:if>
				<xsl:if test="tns:Podmiot1/tns:Adres/tns:AdresZagr/tns:Ulica|tns:Podmiot1/tns:Adres/tns:AdresZagr/tns:NrDomu">
					<td style="width:50%">
						<xsl:value-of select="tns:Podmiot1/tns:Adres/tns:AdresZagr/tns:Ulica"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot1/tns:Adres/tns:AdresZagr/tns:NrDomu"/>
						<xsl:if test="tns:Podmiot1/tns:Adres/tns:AdresZagr/tns:NrLokalu">
							<xsl:text>/</xsl:text>
							<xsl:value-of select="tns:Podmiot1/tns:Adres/tns:AdresZagr/tns:NrLokalu"/>
						</xsl:if>
					</td>
				</xsl:if>
				<xsl:if test="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:Ulica|tns:Podmiot2/tns:Adres/tns:AdresPol/tns:NrDomu">
					<td style="width:50%">
						<xsl:value-of select="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:Ulica"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:NrDomu"/>
						<xsl:if test="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:NrLokalu">
							<xsl:text>/</xsl:text>
							<xsl:value-of select="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:NrLokalu"/>
						</xsl:if>
					</td>
				</xsl:if>
				<xsl:if test="tns:Podmiot2/tns:Adres/tns:AdresZagr/tns:Ulica|tns:Podmiot2/tns:Adres/tns:AdresZagr/tns:NrDomu">
					<td style="width:50%">
						<xsl:value-of select="tns:Podmiot2/tns:Adres/tns:AdresZagr/tns:Ulica"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:Adres/tns:AdresZagr/tns:NrDomu"/>
						<xsl:if test="tns:Podmiot2/tns:Adres/tns:AdresZagr/tns:NrLokalu">
							<xsl:text>/</xsl:text>
							<xsl:value-of select="tns:Podmiot2/tns:Adres/tns:AdresZagr/tns:NrLokalu"/>
						</xsl:if>
					</td>
				</xsl:if>
			</tr>
			<tr>
				<xsl:if test="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:KodPocztowy|tns:Podmiot1/tns:Adres/tns:AdresPol/tns:Miejscowosc">
					<td style="width:50%">
						<xsl:value-of select="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:KodPocztowy"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:Miejscowosc"/>
					</td>
				</xsl:if>
				<xsl:if test="tns:Podmiot1/tns:Adres/tns:AdresZagr/tns:KodPocztowy|tns:Podmiot1/tns:Adres/tns:AdresZagr/tns:Miejscowosc">
					<td style="width:50%">
						<xsl:value-of select="tns:Podmiot1/tns:Adres/tns:AdresZagr/tns:KodPocztowy"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot1/tns:Adres/tns:AdresZagr/tns:Miejscowosc"/>
					</td>
				</xsl:if>
				<xsl:if test="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:KodPocztowy|tns:Podmiot2/tns:Adres/tns:AdresPol/tns:Miejscowosc">
					<td style="width:50%">
						<xsl:value-of select="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:KodPocztowy"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:Miejscowosc"/>
					</td>
				</xsl:if>
				<xsl:if test="tns:Podmiot2/tns:Adres/tns:AdresZagr/tns:KodPocztowy|tns:Podmiot2/tns:Adres/tns:AdresZagr/tns:Miejscowosc">
					<td style="width:50%">
						<xsl:value-of select="tns:Podmiot2/tns:Adres/tns:AdresZagr/tns:KodPocztowy"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:Adres/tns:AdresZagr/tns:Miejscowosc"/>
					</td>
				</xsl:if>
			</tr>
			<tr>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:GLN">
						<xsl:text>GLN: </xsl:text>
						<xsl:value-of select="tns:Podmiot1/tns:Adres/tns:AdresPol/tns:GLN"/>
					</xsl:if>
					<xsl:if test="tns:Podmiot1/tns:Adres/tns:AdresZagr/tns:GLN">
						<xsl:text>GLN: </xsl:text>
						<xsl:value-of select="tns:Podmiot1/tns:Adres/tns:AdresZagr/tns:GLN"/>
					</xsl:if>
				</td>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:GLN">
						<xsl:text>GLN: </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:Adres/tns:AdresPol/tns:GLN"/>
					</xsl:if>
					<xsl:if test="tns:Podmiot2/tns:Adres/tns:AdresZagr/tns:GLN">
						<xsl:text>GLN: </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:Adres/tns:AdresZagr/tns:GLN"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td style="width:50%">
					<xsl:text>NIP: </xsl:text>
					<xsl:value-of select="tns:Podmiot1/tns:PrefiksPodatnika"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="tns:Podmiot1/tns:DaneIdentyfikacyjne/tns:NIP"/>
				</td>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot2/tns:DaneIdentyfikacyjne/tns:NIP">
						<xsl:text>NIP: </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:PrefiksNabywcy"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:DaneIdentyfikacyjne/tns:NIP"/>
					</xsl:if>
					<xsl:if test="tns:Podmiot2/tns:DaneIdentyfikacyjne/tns:NrID">
						<xsl:text>Identyfikator podatkowy: </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:PrefiksNabywcy"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:DaneIdentyfikacyjne/tns:NrID"/>
					</xsl:if>
					<xsl:if test="tns:Podmiot2/tns:DaneIdentyfikacyjne/tns:BrakID = '1'">
						<xsl:value-of select="tns:Podmiot2/tns:PrefiksNabywcy"/>
						<xsl:text>Podmiot nie posiada identyfikatora podatkowego</xsl:text>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot1/tns:Email">
						<xsl:value-of select="tns:Podmiot1/tns:Email"/>
					</xsl:if>
				</td>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot2/tns:Email">
						<xsl:value-of select="tns:Podmiot2/tns:Email"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot1/tns:Telefon">
						<xsl:text>tel.: </xsl:text>
						<xsl:value-of select="tns:Podmiot1/tns:Telefon"/>
					</xsl:if>
				</td>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot2/tns:Telefon">
						<xsl:text>tel.: </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:Telefon"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td style="width:50%">
					<xsl:for-each select="tns:Podmiot1">
						<xsl:if test="tns:StatusInfoPodatnika">
							<xsl:choose>
								<xsl:when test="tns:StatusInfoPodatnika = 1">
									<xsl:text>Faktura dokumentująca sprzedaż dokonywaną przez podatnika znajdującego się w stanie likwidacji</xsl:text>
								</xsl:when>
								<xsl:when test="tns:StatusInfoPodatnika = 2">
									<xsl:text>Faktura dokumentująca sprzedaż dokonywaną przez podatnika, który jest w trakcie postępowania restrukturyzacyjnego</xsl:text>
								</xsl:when>
								<xsl:when test="tns:StatusInfoPodatnika = 3">
									<xsl:text>Faktura dokumentująca sprzedaż dokonywaną przez podatnika znajdującego się w stanie upadłości</xsl:text>
								</xsl:when>
								<xsl:when test="tns:StatusInfoPodatnika = 4">
									<xsl:text>Faktura dokumentująca sprzedaż dokonywaną przez przedsiębiorstwo w spadku</xsl:text>
								</xsl:when>
							</xsl:choose>
						</xsl:if>
					</xsl:for-each>
				</td>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot2/tns:NrKlienta">
						<xsl:text>Numer klienta: </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:NrKlienta"/>
					</xsl:if>
				</td>
			</tr>
		</table>
		<br/>
		<table class="break-word">
			<tr>
				<xsl:if test="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol|tns:Podmiot1/tns:AdresKoresp/tns:AdresZagr">
					<td style="width:50%">
						<b>Adres korespondencyjny sprzedawcy</b>
					</td>
				</xsl:if>
				<xsl:if test="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol|tns:Podmiot2/tns:AdresKoresp/tns:AdresZagr">
					<td style="width:50%">
						<b>Adres korespondencyjny nabywcy</b>
					</td>
				</xsl:if>
				<td/>
			</tr>
			<tr>
				<xsl:if test="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:KodKraju">
					<td style="width:50%">
						<xsl:apply-templates select="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:KodKraju"/>
					</td>
				</xsl:if>
				<xsl:if test="tns:Podmiot1/tns:AdresKoresp/tns:AdresZagr/tns:KodKraju">
					<td style="width:50%">
						<xsl:apply-templates select="tns:Podmiot1/tns:AdresKoresp/tns:AdresZagr/tns:KodKraju"/>
					</td>
				</xsl:if>
				<xsl:if test="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:KodKraju">
					<td style="width:50%">
						<xsl:apply-templates select="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:KodKraju"/>
					</td>
				</xsl:if>
				<xsl:if test="tns:Podmiot2/tns:AdresKoresp/tns:AdresZagr/tns:KodKraju">
					<td style="width:50%">
						<xsl:apply-templates select="tns:Podmiot2/tns:AdresKoresp/tns:AdresZagr/tns:KodKraju"/>
					</td>
				</xsl:if>
			</tr>
			<tr>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:Wojewodztwo">
						<xsl:value-of select="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:Wojewodztwo"/>
					</xsl:if>
				</td>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:Wojewodztwo">
						<xsl:value-of select="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:Wojewodztwo"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:Powiat">
						<xsl:value-of select="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:Powiat"/>
					</xsl:if>
				</td>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:Powiat">
						<xsl:value-of select="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:Powiat"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:Gmina">
						<xsl:value-of select="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:Gmina"/>
					</xsl:if>
				</td>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:Gmina">
						<xsl:value-of select="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:Gmina"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:Ulica|tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:NrDomu">
						<xsl:value-of select="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:Ulica"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:NrDomu"/>
						<xsl:if test="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:NrLokalu">
							<xsl:text> / </xsl:text>
							<xsl:value-of select="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:NrLokalu"/>
						</xsl:if>
					</xsl:if>
					<xsl:if test="tns:Podmiot1/tns:AdresKoresp/tns:AdresZagr/tns:Ulica|tns:Podmiot1/tns:AdresKoresp/tns:AdresZagr/tns:NrDomu">
						<xsl:value-of select="tns:Podmiot1/tns:AdresKoresp/tns:AdresZagr/tns:Ulica"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot1/tns:AdresKoresp/tns:AdresZagr/tns:NrDomu"/>
						<xsl:if test="tns:Podmiot1/tns:AdresKoresp/tns:AdresZagr/tns:NrLokalu">
							<xsl:text>/</xsl:text>
							<xsl:value-of select="tns:Podmiot1/tns:AdresKoresp/tns:AdresZagr/tns:NrLokalu"/>
						</xsl:if>
					</xsl:if>
				</td>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:Ulica|tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:NrDomu">
						<xsl:value-of select="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:Ulica"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:NrDomu"/>
						<xsl:if test="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:NrLokalu">
							<xsl:text>/</xsl:text>
							<xsl:value-of select="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:NrLokalu"/>
						</xsl:if>
					</xsl:if>
					<xsl:if test="tns:Podmiot2/tns:AdresKoresp/tns:AdresZagr/tns:Ulica|tns:Podmiot2/tns:AdresKoresp/tns:AdresZagr/tns:NrDomu">
						<xsl:value-of select="tns:Podmiot2/tns:AdresKoresp/tns:AdresZagr/tns:Ulica"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:AdresKoresp/tns:AdresZagr/tns:NrDomu"/>
						<xsl:if test="tns:Podmiot2/tns:AdresKoresp/tns:AdresZagr/tns:NrLokalu">
							<xsl:text>/</xsl:text>
							<xsl:value-of select="tns:Podmiot2/tns:AdresKoresp/tns:AdresZagr/tns:NrLokalu"/>
						</xsl:if>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:KodPocztowy|tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:Miejscowosc">
						<xsl:value-of select="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:KodPocztowy"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:Miejscowosc"/>
					</xsl:if>
					<xsl:if test="tns:Podmiot1/tns:AdresKoresp/tns:AdresZagr/tns:KodPocztowy|tns:Podmiot1/tns:AdresKoresp/tns:AdresZagr/tns:Miejscowosc">
						<xsl:value-of select="tns:Podmiot1/tns:AdresKoresp/tns:AdresZagr/tns:KodPocztowy"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot1/tns:AdresKoresp/tns:AdresZagr/tns:Miejscowosc"/>
					</xsl:if>
				</td>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:KodPocztowy|tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:Miejscowosc">
						<xsl:value-of select="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:KodPocztowy"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:Miejscowosc"/>
					</xsl:if>
					<xsl:if test="tns:Podmiot2/tns:AdresKoresp/tns:AdresZagr/tns:KodPocztowy|tns:Podmiot2/tns:AdresKoresp/tns:AdresZagr/tns:Miejscowosc">
						<xsl:value-of select="tns:Podmiot2/tns:AdresKoresp/tns:AdresZagr/tns:KodPocztowy"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:AdresKoresp/tns:AdresZagr/tns:Miejscowosc"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:GLN">
						<xsl:text>GLN: </xsl:text>
						<xsl:value-of select="tns:Podmiot1/tns:AdresKoresp/tns:AdresPol/tns:GLN"/>
					</xsl:if>
					<xsl:if test="tns:Podmiot1/tns:AdresKoresp/tns:AdresZagr/tns:GLN">
						<xsl:text>GLN: </xsl:text>
						<xsl:value-of select="tns:Podmiot1/tns:AdresKoresp/tns:AdresZagr/tns:GLN"/>
					</xsl:if>
				</td>
				<td style="width:50%">
					<xsl:if test="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:GLN">
						<xsl:text>GLN: </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:AdresKoresp/tns:AdresPol/tns:GLN"/>
					</xsl:if>
					<xsl:if test="tns:Podmiot2/tns:AdresKoresp/tns:AdresZagr/tns:GLN">
						<xsl:text>GLN: </xsl:text>
						<xsl:value-of select="tns:Podmiot2/tns:AdresKoresp/tns:AdresZagr/tns:GLN"/>
					</xsl:if>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="InnyPodmiot">
		<xsl:for-each select="tns:Podmiot3">
			<table class="break-word">
				<tr>
					<td style="width:50%">
					</td>
					<td style="width:50%">
						<br/>
						<b>Podmiot trzeci <xsl:number value="position()" format="(1) "/>
						</b>
					</td>
				</tr>
				<tr>
					<td/>
					<td>
						<xsl:if test="tns:NrEORI">
							<xsl:text>Numer EORI: </xsl:text>
							<xsl:value-of select="tns:NrEORI"/>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td/>
					<td style="width:50%">
						<xsl:if test="tns:DaneIdentyfikacyjne/tns:PelnaNazwa">
							<xsl:value-of select="tns:DaneIdentyfikacyjne/tns:PelnaNazwa"/>
						</xsl:if>
						<xsl:if test="tns:DaneIdentyfikacyjne/tns:ImiePierwsze">
							<xsl:value-of select="tns:DaneIdentyfikacyjne/tns:ImiePierwsze"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="tns:DaneIdentyfikacyjne/tns:Nazwisko"/>
						</xsl:if>
					</td>
					<td/>
				</tr>
				<tr>
					<td/>
					<td>
						<xsl:if test="tns:DaneIdentyfikacyjne/tns:NazwaHandlowa">
							<xsl:value-of select="tns:DaneIdentyfikacyjne/tns:NazwaHandlowa"/>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<xsl:if test="tns:Adres/tns:AdresPol/tns:KodKraju">
						<td/>
						<td style="width:50%">
							<xsl:apply-templates select="tns:Adres/tns:AdresPol/tns:KodKraju"/>
						</td>
					</xsl:if>
					<xsl:if test="tns:Adres/tns:AdresZagr/tns:KodKraju">
						<td/>
						<td style="width:50%">
							<xsl:apply-templates select="tns:Adres/tns:AdresZagr/tns:KodKraju"/>
						</td>
					</xsl:if>
				</tr>
				<tr>
					<xsl:if test="tns:Adres/tns:AdresPol/tns:Wojewodztwo">
						<td/>
						<td style="width:50%">
							<xsl:value-of select="tns:Adres/tns:AdresPol/tns:Wojewodztwo"/>
						</td>
					</xsl:if>
				</tr>
				<tr>
					<xsl:if test="tns:Adres/tns:AdresPol/tns:Powiat">
						<td/>
						<td style="width:50%">
							<xsl:value-of select="tns:Adres/tns:AdresPol/tns:Powiat"/>
						</td>
					</xsl:if>
				</tr>
				<tr>
					<xsl:if test="tns:Adres/tns:AdresPol/tns:Gmina">
						<td/>
						<td style="width:50%">
							<xsl:value-of select="tns:Adres/tns:AdresPol/tns:Gmina"/>
						</td>
					</xsl:if>
				</tr>
				<tr>
					<xsl:if test="tns:Adres/tns:AdresPol/tns:Ulica|tns:Adres/tns:AdresPol/tns:NrDomu">
						<td/>
						<td style="width:50%">
							<xsl:value-of select="tns:Adres/tns:AdresPol/tns:Ulica"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="tns:Adres/tns:AdresPol/tns:NrDomu"/>
							<xsl:if test="tns:Adres/tns:AdresPol/tns:NrLokalu">
								<xsl:text>/</xsl:text>
								<xsl:value-of select="tns:Adres/tns:AdresPol/tns:NrLokalu"/>
							</xsl:if>
						</td>
					</xsl:if>
					<xsl:if test="tns:Adres/tns:AdresZagr/tns:Ulica|tns:Adres/tns:AdresZagr/tns:NrDomu">
						<td/>
						<td style="width:50%">
							<xsl:value-of select="tns:Adres/tns:AdresZagr/tns:Ulica"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="tns:Adres/tns:AdresZagr/tns:NrDomu"/>
							<xsl:if test="tns:Adres/tns:AdresZagr/tns:NrLokalu">
								<xsl:text>/</xsl:text>
								<xsl:value-of select="tns:Adres/tns:AdresZagr/tns:NrLokalu"/>
							</xsl:if>
						</td>
					</xsl:if>
				</tr>
				<tr>
					<xsl:if test="tns:Adres/tns:AdresPol/tns:KodPocztowy|tns:Adres/tns:AdresPol/tns:Miejscowosc">
						<td/>
						<td style="width:50%">
							<xsl:value-of select="tns:Adres/tns:AdresPol/tns:KodPocztowy"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="tns:Adres/tns:AdresPol/tns:Miejscowosc"/>
						</td>
					</xsl:if>
				</tr>
				<tr>
					<td/>
					<td>
						<xsl:if test="tns:Adres/tns:AdresPol/tns:GLN">
							<xsl:text>GLN: </xsl:text>
							<xsl:value-of select="tns:Adres/tns:AdresPol/tns:GLN"/>
						</xsl:if>
						<xsl:if test="tns:Adres/tns:AdresZagr/tns:GLN">
							<xsl:text>GLN: </xsl:text>
							<xsl:value-of select="tns:Adres/tns:AdresZagr/tns:GLN"/>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td/>
					<td>
						<xsl:if test="tns:Email">
							<xsl:value-of select="tns:Email"/>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td/>
					<td>
						<xsl:if test="tns:Telefon">
							<xsl:value-of select="tns:Telefon"/>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td/>
					<td>
						<xsl:if test="tns:Rola">
							<xsl:text>Rola: </xsl:text>
							<xsl:choose>
								<xsl:when test="tns:Rola = 1">
									<xsl:text>Faktor</xsl:text>
								</xsl:when>
								<xsl:when test="tns:Rola = 2">
									<xsl:text>Odbiorca</xsl:text>
								</xsl:when>
								<xsl:when test="tns:Rola = 3">
									<xsl:text>Podmiot pierwotny</xsl:text>
								</xsl:when>
								<xsl:when test="tns:Rola = 4">
									<xsl:text>Dodatkowy nabywca</xsl:text>
								</xsl:when>
								<xsl:when test="tns:Rola = 5">
									<xsl:text>Wystawca faktury</xsl:text>
								</xsl:when>
								<xsl:when test="tns:Rola = 6">
									<xsl:text>Dokonujący płatności</xsl:text>
								</xsl:when>
							</xsl:choose>
						</xsl:if>
						<xsl:if test="tns:RolaInna">
							<xsl:choose>
								<xsl:when test="tns:RolaInna = 1">
									<xsl:text>Rola inna: </xsl:text>
									<xsl:value-of select="tns:OpisRoli"/>
									<br/>
								</xsl:when>
							</xsl:choose>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td/>
					<td>
						<xsl:if test="tns:Udzial">
							<xsl:text>Udział: </xsl:text>
							<xsl:value-of select="tns:Udzial"/>%
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td/>
					<td>
						<xsl:if test="tns:NrKlienta">
							<xsl:text>Numer klienta: </xsl:text>
							<xsl:value-of select="tns:NrKlienta"/>
						</xsl:if>
					</td>
				</tr>
				<xsl:if test="tns:AdresKoresp">
					<tr>
						<td style="width:50%">
						</td>
						<td style="width:50%">
							<br/>
							<b>Adres korespondencyjny podmiotu trzeciego</b>
						</td>
					</tr>
					<tr>
						<td/>
						<xsl:if test="tns:AdresKoresp/tns:AdresPol/tns:KodKraju">
							<td style="width:50%">
								<xsl:apply-templates select="tns:AdresKoresp/tns:AdresPol/tns:KodKraju"/>
							</td>
						</xsl:if>
						<xsl:if test="tns:AdresKoresp/tns:AdresZagr/tns:KodKraju">
							<td style="width:50%">
								<xsl:apply-templates select="tns:AdresKoresp/tns:AdresZagr/tns:KodKraju"/>
							</td>
						</xsl:if>
					</tr>
					<tr>
						<td/>
						<xsl:if test="tns:AdresKoresp/tns:AdresPol/tns:Wojewodztwo">
							<td style="width:50%">
								<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:Wojewodztwo"/>
							</td>
						</xsl:if>
					</tr>
					<tr>
						<td/>
						<xsl:if test="tns:AdresKoresp/tns:AdresPol/tns:Powiat">
							<td style="width:50%">
								<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:Powiat"/>
							</td>
						</xsl:if>
					</tr>
					<tr>
						<td/>
						<xsl:if test="tns:AdresKoresp/tns:AdresPol/tns:Gmina">
							<td style="width:50%">
								<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:Gmina"/>
							</td>
						</xsl:if>
					</tr>
					<tr>
						<td/>
						<xsl:if test="tns:AdresKoresp/tns:AdresPol/tns:Ulica|tns:AdresKoresp/tns:AdresPol/tns:NrDomu">
							<td style="width:50%">
								<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:Ulica"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:NrDomu"/>
								<xsl:if test="tns:AdresKoresp/tns:AdresPol/tns:NrLokalu">
									<xsl:text>/</xsl:text>
									<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:NrLokalu"/>
								</xsl:if>
							</td>
						</xsl:if>
						<xsl:if test="tns:AdresKoresp/tns:AdresZagr/tns:Ulica|tns:AdresKoresp/tns:AdresZagr/tns:NrDomu">
							<td style="width:50%">
								<xsl:value-of select="tns:AdresKoresp/tns:AdresZagr/tns:Ulica"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="tns:AdresKoresp/tns:AdresZagr/tns:NrDomu"/>
								<xsl:if test="tns:AdresKoresp/tns:AdresZagr/tns:NrLokalu">
									<xsl:text>/</xsl:text>
									<xsl:value-of select="tns:AdresKoresp/tns:AdresZagr/tns:NrLokalu"/>
								</xsl:if>
							</td>
						</xsl:if>
					</tr>
					<tr>
						<td/>
						<xsl:if test="tns:AdresKoresp/tns:AdresPol/tns:KodPocztowy|tns:AdresKoresp/tns:AdresPol/tns:Miejscowosc">
							<td style="width:50%">
								<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:KodPocztowy"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:Miejscowosc"/>
							</td>
						</xsl:if>
						<xsl:if test="tns:AdresKoresp/tns:AdresZagr/tns:KodPocztowy|tns:AdresKoresp/tns:AdresZagr/tns:Miejscowosc">
							<td style="width:50%">
								<xsl:value-of select="tns:AdresKoresp/tns:AdresZagr/tns:KodPocztowy"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="tns:AdresKoresp/tns:AdresZagr/tns:Miejscowosc"/>
							</td>
						</xsl:if>
					</tr>
					<tr>
						<td/>
						<td>
							<xsl:if test="tns:AdresKoresp/tns:AdresPol/tns:GLN">
								<xsl:text>GLN: </xsl:text>
								<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:GLN"/>
							</xsl:if>
							<xsl:if test="tns:AdresKoresp/tns:AdresZagr/tns:GLN">
								<xsl:text>GLN: </xsl:text>
								<xsl:value-of select="tns:AdresKoresp/tns:AdresZagr/tns:GLN"/>
							</xsl:if>
						</td>
					</tr>
				</xsl:if>
			</table>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="PodmiotUpowazniony">
		<xsl:if test="tns:PodmiotUpowazniony">
			<xsl:for-each select="tns:PodmiotUpowazniony">
				<table class="break-word">
					<tr>
						<td style="width:50%">
						</td>
						<td style="width:50%">
							<br/>
							<b>Podmiot upoważniony
							</b>
						</td>
					</tr>
					<tr>
						<td/>
						<td>
							<xsl:if test="tns:NrEORI">
								<xsl:text>Numer EORI: </xsl:text>
								<xsl:value-of select="tns:NrEORI"/>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td/>
						<td style="width:50%">
							<xsl:if test="tns:DaneIdentyfikacyjne/tns:PelnaNazwa">
								<xsl:value-of select="tns:DaneIdentyfikacyjne/tns:PelnaNazwa"/>
							</xsl:if>
							<xsl:if test="tns:DaneIdentyfikacyjne/tns:ImiePierwsze">
								<xsl:value-of select="tns:DaneIdentyfikacyjne/tns:ImiePierwsze"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="tns:DaneIdentyfikacyjne/tns:Nazwisko"/>
							</xsl:if>
						</td>
						<td/>
					</tr>
					<tr>
						<td/>
						<td>
							<xsl:if test="tns:DaneIdentyfikacyjne/tns:NazwaHandlowa">
								<xsl:value-of select="tns:DaneIdentyfikacyjne/tns:NazwaHandlowa"/>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<xsl:if test="tns:Adres/tns:AdresPol/tns:KodKraju">
							<td/>
							<td style="width:50%">
								<xsl:apply-templates select="tns:Adres/tns:AdresPol/tns:KodKraju"/>
							</td>
						</xsl:if>
						<xsl:if test="tns:Adres/tns:AdresZagr/tns:KodKraju">
							<td/>
							<td style="width:50%">
								<xsl:apply-templates select="tns:Adres/tns:AdresZagr/tns:KodKraju"/>
							</td>
						</xsl:if>
					</tr>
					<tr>
						<xsl:if test="tns:Adres/tns:AdresPol/tns:Wojewodztwo">
							<td/>
							<td style="width:50%">
								<xsl:value-of select="tns:Adres/tns:AdresPol/tns:Wojewodztwo"/>
							</td>
						</xsl:if>
					</tr>
					<tr>
						<xsl:if test="tns:Adres/tns:AdresPol/tns:Powiat">
							<td/>
							<td style="width:50%">
								<xsl:value-of select="tns:Adres/tns:AdresPol/tns:Powiat"/>
							</td>
						</xsl:if>
					</tr>
					<tr>
						<xsl:if test="tns:Adres/tns:AdresPol/tns:Gmina">
							<td/>
							<td style="width:50%">
								<xsl:value-of select="tns:Adres/tns:AdresPol/tns:Gmina"/>
							</td>
						</xsl:if>
					</tr>
					<tr>
						<xsl:if test="tns:Adres/tns:AdresPol/tns:Ulica|tns:Adres/tns:AdresPol/tns:NrDomu">
							<td/>
							<td style="width:50%">
								<xsl:value-of select="tns:Adres/tns:AdresPol/tns:Ulica"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="tns:Adres/tns:AdresPol/tns:NrDomu"/>
								<xsl:if test="tns:Adres/tns:AdresPol/tns:NrLokalu">
									<xsl:text>/</xsl:text>
									<xsl:value-of select="tns:Adres/tns:AdresPol/tns:NrLokalu"/>
								</xsl:if>
							</td>
						</xsl:if>
						<xsl:if test="tns:Adres/tns:AdresZagr/tns:Ulica|tns:Adres/tns:AdresZagr/tns:NrDomu">
							<td/>
							<td style="width:50%">
								<xsl:value-of select="tns:Adres/tns:AdresZagr/tns:Ulica"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="tns:Adres/tns:AdresZagr/tns:NrDomu"/>
								<xsl:if test="tns:Adres/tns:AdresZagr/tns:NrLokalu">
									<xsl:text>/</xsl:text>
									<xsl:value-of select="tns:Adres/tns:AdresZagr/tns:NrLokalu"/>
								</xsl:if>
							</td>
						</xsl:if>
					</tr>
					<tr>
						<xsl:if test="tns:Adres/tns:AdresPol/tns:KodPocztowy|tns:Adres/tns:AdresPol/tns:Miejscowosc">
							<td/>
							<td style="width:50%">
								<xsl:value-of select="tns:Adres/tns:AdresPol/tns:KodPocztowy"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="tns:Adres/tns:AdresPol/tns:Miejscowosc"/>
							</td>
						</xsl:if>
						<xsl:if test="tns:Adres/tns:AdresZagr/tns:KodPocztowy|tns:Adres/tns:AdresZagr/tns:Miejscowosc">
							<td/>
							<td style="width:50%">
								<xsl:value-of select="tns:Adres/tns:AdresZagr/tns:KodPocztowy"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="tns:Adres/tns:AdresZagr/tns:Miejscowosc"/>
							</td>
						</xsl:if>
					</tr>
					<tr>
						<td/>
						<td>
							<xsl:if test="tns:Adres/tns:AdresPol/tns:GLN">
								<xsl:text>GLN: </xsl:text>
								<xsl:value-of select="tns:Adres/tns:AdresPol/tns:GLN"/>
							</xsl:if>
							<xsl:if test="tns:Adres/tns:AdresZagr/tns:GLN">
								<xsl:text>GLN: </xsl:text>
								<xsl:value-of select="tns:Podmiot3/tns:Adres/tns:AdresZagr/tns:GLN"/>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td/>
						<td style="width:50%">
							<xsl:if test="tns:DaneIdentyfikacyjne/tns:NIP">
								<xsl:text>NIP: </xsl:text>
								<xsl:value-of select="tns:DaneIdentyfikacyjne/tns:NIP"/>
							</xsl:if>
							<xsl:if test="tns:DaneIdentyfikacyjne/tns:NrID">
								<xsl:text>Identyfikator podatkowy: </xsl:text>
								<xsl:value-of select="tns:DaneIdentyfikacyjne/tns:NrID"/>
							</xsl:if>
							<xsl:if test="tns:DaneIdentyfikacyjne/tns:BrakID = '1'">
								<xsl:text>Podmiot nie posiada identyfikatora podatkowego</xsl:text>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td/>
						<td>
							<xsl:if test="tns:Adres/tns:GLN">
								<xsl:text>GLN: </xsl:text>
								<xsl:value-of select="tns:Adres/tns:GLN"/>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td/>
						<td>
							<xsl:if test="tns:PUEmail">
								<xsl:value-of select="tns:PUEmail"/>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td/>
						<td>
							<xsl:if test="tns:PUTelefon">
								<xsl:value-of select="tns:PUTelefon"/>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td/>
						<td>
							<xsl:if test="tns:RolaPU">
								<xsl:choose>
									<xsl:when test="tns:RolaPU = 1">
										<xsl:text>Organ egzekucyjny</xsl:text>
									</xsl:when>
									<xsl:when test="tns:RolaPU = 2">
										<xsl:text>Komornik sądowy</xsl:text>
									</xsl:when>
									<xsl:when test="tns:RolaPU = 3">
										<xsl:text>Przedstawiciel podatkowy</xsl:text>
									</xsl:when>
								</xsl:choose>
							</xsl:if>
						</td>
					</tr>
					<xsl:if test="tns:AdresKoresp">
						<tr>
							<td style="width:50%">
							</td>
							<td style="width:50%">
								<br/>
								<b>Adres korespondencyjny podmiotu upoważnionego</b>
							</td>
						</tr>
						<tr>
							<td/>
							<xsl:if test="tns:AdresKoresp/tns:AdresPol/tns:KodKraju">
								<td style="width:50%">
									<xsl:apply-templates select="tns:AdresKoresp/tns:AdresPol/tns:KodKraju"/>
								</td>
							</xsl:if>
							<xsl:if test="tns:AdresKoresp/tns:AdresZagr/tns:KodKraju">
								<td style="width:50%">
									<xsl:apply-templates select="tns:AdresKoresp/tns:AdresZagr/tns:KodKraju"/>
								</td>
							</xsl:if>
						</tr>
						<tr>
							<td/>
							<xsl:if test="tns:AdresKoresp/tns:AdresPol/tns:Wojewodztwo">
								<td style="width:50%">
									<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:Wojewodztwo"/>
								</td>
							</xsl:if>
						</tr>
						<tr>
							<td/>
							<xsl:if test="tns:AdresKoresp/tns:AdresPol/tns:Powiat">
								<td style="width:50%">
									<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:Powiat"/>
								</td>
							</xsl:if>
						</tr>
						<tr>
							<td/>
							<xsl:if test="tns:AdresKoresp/tns:AdresPol/tns:Gmina">
								<td style="width:50%">
									<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:Gmina"/>
								</td>
							</xsl:if>
						</tr>
						<tr>
							<td/>
							<xsl:if test="tns:AdresKoresp/tns:AdresPol/tns:Ulica|tns:AdresKoresp/tns:AdresPol/tns:NrDomu">
								<td style="width:50%">
									<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:Ulica"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:NrDomu"/>
									<xsl:if test="tns:AdresKoresp/tns:AdresPol/tns:NrLokalu">
										<xsl:text>/</xsl:text>
										<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:NrLokalu"/>
									</xsl:if>
								</td>
							</xsl:if>
							<xsl:if test="tns:AdresKoresp/tns:AdresZagr/tns:Ulica|tns:AdresKoresp/tns:AdresZagr/tns:NrDomu">
								<td style="width:50%">
									<xsl:value-of select="tns:AdresKoresp/tns:AdresZagr/tns:Ulica"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="tns:AdresKoresp/tns:AdresZagr/tns:NrDomu"/>
									<xsl:if test="tns:AdresKoresp/tns:AdresZagr/tns:NrLokalu">
										<xsl:text>/</xsl:text>
										<xsl:value-of select="tns:AdresKoresp/tns:AdresZagr/tns:NrLokalu"/>
									</xsl:if>
								</td>
							</xsl:if>
						</tr>
						<tr>
							<td/>
							<xsl:if test="tns:AdresKoresp/tns:AdresPol/tns:KodPocztowy|tns:AdresKoresp/tns:AdresPol/tns:Miejscowosc">
								<td style="width:50%">
									<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:KodPocztowy"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:Miejscowosc"/>
								</td>
							</xsl:if>
							<xsl:if test="tns:AdresKoresp/tns:AdresZagr/tns:KodPocztowy|tns:AdresKoresp/tns:AdresZagr/tns:Miejscowosc">
								<td style="width:50%">
									<xsl:value-of select="tns:AdresKoresp/tns:AdresZagr/tns:KodPocztowy"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="tns:AdresKoresp/tns:AdresZagr/tns:Miejscowosc"/>
								</td>
							</xsl:if>
						</tr>
						<tr>
							<td/>
							<td>
								<xsl:if test="tns:AdresKoresp/tns:AdresPol/tns:GLN">
									<xsl:text>GLN: </xsl:text>
									<xsl:value-of select="tns:AdresKoresp/tns:AdresPol/tns:GLN"/>
								</xsl:if>
								<xsl:if test="tns:AdresKoresp/tns:AdresZagr/tns:GLN">
									<xsl:text>GLN: </xsl:text>
									<xsl:value-of select="tns:AdresKoresp/tns:AdresZagr/tns:GLN"/>
								</xsl:if>
							</td>
						</tr>
					</xsl:if>
				</table>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template name="FaktoraWiersze">
		<br/>
		<div>
			<xsl:if test="tns:Fa/tns:FaWiersze/tns:LiczbaWierszyFaktury">
				Liczba wierszy faktury:
				<b>
					<xsl:value-of select="tns:Fa/tns:FaWiersze/tns:LiczbaWierszyFaktury"/>
				</b>
			</xsl:if>
			<br/>
			<br/>
			<xsl:choose>
				<xsl:when test="tns:RolaPU = 1">
					<xsl:text>Organ egzekucyjny</xsl:text>
				</xsl:when>
				<xsl:when test="tns:Fa/tns:FaWiersze/tns:WartoscWierszyFaktury1">
					<xsl:text>Łączna wartość sprzedaży netto: </xsl:text>
					<b>
						<xsl:value-of select="tns:Fa/tns:FaWiersze/tns:WartoscWierszyFaktury1"/>
					</b>
				</xsl:when>
				<xsl:when test="tns:Fa/tns:FaWiersze/tns:WartoscWierszyFaktury2">
					<xsl:text>Łączna wartość sprzedaży brutto: </xsl:text>
					<b>
						<xsl:value-of select="tns:Fa/tns:FaWiersze/tns:WartoscWierszyFaktury2"/>
					</b>
				</xsl:when>
			</xsl:choose>
		</div>
		<br/>
		<xsl:if test="tns:Fa/tns:FaWiersze/tns:FaWiersz">
			<table class="white-space">
				<tr>
					<td class="niewypelniane">Numer wiersza</td>
					<td class="niewypelniane">Uniwersalny unikalny numer wiersza faktury</td>
					<td class="niewypelniane">Nazwa (rodzaj) towaru lub usługi</td>
					<td class="niewypelniane">Jednostka miary</td>
					<td class="niewypelniane">Ilość</td>
					<td class="niewypelniane">Cena jednostkowa</td>
					<td class="niewypelniane">Opusty i obniżki cen</td>
					<td class="niewypelniane">Wartość sprzedaży</td>
					<td class="niewypelniane">Stawka podatku</td>
					<td class="niewypelniane">Stawka podatku od wartości dodanej</td>
					<td class="niewypelniane">Data dokonania lub zakończenia dostawy towarów lub wykonania usługi lub data otrzymania zapłaty</td>
					<td class="niewypelniane">Klasyfikacja</td>
					<td class="niewypelniane">Dodatkowe informacje</td>
					<td class="niewypelniane">Wskazanie procedury dla wiersza faktury</td>
					<td class="niewypelniane">Kwota podatku akcyzowego zawarta w cenie towaru</td>
					<td class="niewypelniane">Oznaczenie dotyczące dostawy towarów i świadczenia usług lub procedury</td>
					<td class="niewypelniane">Kurs waluty, z art. 31a ustawy</td>
				</tr>
				<xsl:for-each select="tns:Fa/tns:FaWiersze/tns:FaWiersz">
					<tr>
						<td class="srodek" width="auto">
							<xsl:value-of select="tns:NrWierszaFa"/>
						</td>
						<td class="srodek" width="auto">
							<xsl:value-of select="tns:UU_ID"/>
						</td>
						<td class="lewa" width="auto">
							<xsl:value-of select="tns:P_7"/>
						</td>
						<td class="srodek" width="auto">
							<xsl:value-of select="tns:P_8A"/>
						</td>
						<td class="prawa" width="auto">
							<xsl:value-of select="tns:P_8B"/>
						</td>
						<td class="prawa" width="auto">
							<xsl:if test="tns:P_9A">
								<xsl:value-of select="tns:P_9A"/> netto
							</xsl:if>
							<xsl:if test="tns:P_9B">
								<br/>
								<xsl:value-of select="tns:P_9B"/> brutto
							</xsl:if>
						</td>
						<td class="prawa" width="auto">
							<xsl:value-of select="tns:P_10"/>
						</td>
						<td class="prawa" width="auto">
							<xsl:if test="tns:P_11">
								<xsl:value-of select="tns:P_11"/> netto
							</xsl:if>
							<xsl:if test="tns:P_11A">
								<br/>
								<xsl:value-of select="tns:P_11A"/> brutto
							</xsl:if>
						</td>
						<td class="srodek" width="auto">
							<xsl:choose>
								<xsl:when test="tns:P_12 = '23'">
									<xsl:text>23%</xsl:text>
								</xsl:when>
								<xsl:when test="tns:P_12 = '22'">
									<xsl:text>22%</xsl:text>
								</xsl:when>
								<xsl:when test="tns:P_12 = '8'">
									<xsl:text>8%</xsl:text>
								</xsl:when>
								<xsl:when test="tns:P_12 = '7'">
									<xsl:text>7%</xsl:text>
								</xsl:when>
								<xsl:when test="tns:P_12 = '5'">
									<xsl:text>5%</xsl:text>
								</xsl:when>
								<xsl:when test="tns:P_12 = '4'">
									<xsl:text>4%</xsl:text>
								</xsl:when>
								<xsl:when test="tns:P_12 = '3'">
									<xsl:text>3%</xsl:text>
								</xsl:when>
								<xsl:when test="tns:P_12 = '0'">
									<xsl:text>0%</xsl:text>
								</xsl:when>
								<xsl:when test="tns:P_12 = 'zw'">
									<xsl:text>zw</xsl:text>
								</xsl:when>
								<xsl:when test="tns:P_12 = 'oo'">
									<xsl:text>oo</xsl:text>
								</xsl:when>
								<xsl:when test="tns:P_12 = 'np'">
									<xsl:text>np</xsl:text>
								</xsl:when>
							</xsl:choose>
						</td>
						<td class="srodek" width="auto">
							<xsl:if test="tns:P_12_XII">
								<xsl:value-of select="tns:P_12_XII"/>
								<xsl:text>%</xsl:text>
							</xsl:if>
						</td>
						<td class="srodek" width="auto">
							<xsl:value-of select="tns:P_6A"/>
						</td>
						<td class="lewa" width="auto">
							<xsl:if test="tns:GTIN">
								GTIN:
								<xsl:value-of select="tns:GTIN"/>;
							</xsl:if>
							<xsl:if test="tns:PKWiU">
								<xsl:if test="tns:GTIN">
									<br/>
								</xsl:if>
								PKWiU:
								<xsl:value-of select="tns:PKWiU"/>;
							</xsl:if>
							<xsl:if test="tns:CN">
								<xsl:if test="tns:GTIN|tns:PKWiU">
									<br/>
								</xsl:if>
								CN:
								<xsl:value-of select="tns:CN"/>;
							</xsl:if>
							<xsl:if test="tns:PKOB">
								<xsl:if test="tns:GTIN|tns:PKWiU|tns:CN">
									<br/>
								</xsl:if>
								PKOB:
								<xsl:value-of select="tns:PKOB"/>;
							</xsl:if>
						</td>
						<td class="lewa" width="auto">
							<xsl:value-of select="tns:DodatkoweInfo"/>
						</td>
						<td class="srodek" width="auto">
							<xsl:choose>
								<xsl:when test="tns:P_12_Procedura = '1'">
									<xsl:text>Stawka 0% stosowana w ramach sprzedaży krajowej</xsl:text>
								</xsl:when>
								<xsl:when test="tns:P_12_Procedura = '2'">
									<xsl:text>Stawka 0% - wewnątrzwspólnotowa dostawa towarów</xsl:text>
								</xsl:when>
								<xsl:when test="tns:P_12_Procedura = '3'">
									<xsl:text>Stawka 0% - eksport towarów</xsl:text>
								</xsl:when>
								<xsl:when test="tns:P_12_Procedura = '4'">
									<xsl:text>Dostawa towarów oraz świadczenie usług opodatkowane poza terytorium kraju</xsl:text>
								</xsl:when>
								<xsl:when test="tns:P_12_Procedura = '5'">
									<xsl:text>Świadczenie usług z art. 100 ust. 1 pkt 4 ustawy</xsl:text>
								</xsl:when>
								<xsl:when test="tns:P_12_Procedura = '6'">
									<xsl:text>Towar/usługa wymienione w załączniku 15</xsl:text>
								</xsl:when>
								<xsl:when test="tns:P_12_Procedura = '7'">
									<xsl:text>Pozostała sprzedaż krajowa</xsl:text>
								</xsl:when>
							</xsl:choose>
						</td>
						<td class="prawa" width="auto">
							<xsl:value-of select="tns:KwotaAkcyzy"/>
						</td>
						<td class="srodek" width="auto">
							<xsl:if test="tns:GTU">
								<xsl:value-of select="tns:GTU"/>
							</xsl:if>
							<xsl:if test="tns:Procedura">
								<xsl:if test="tns:GTU">
									<br/>
								</xsl:if>
								<xsl:value-of select="tns:Procedura"/>
							</xsl:if>
						</td>
						<td class="prawa">
							<xsl:value-of select="tns:KursWaluty"/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
		<br/>
	</xsl:template>
	<xsl:template name="PodliczenieVAT">
		<xsl:if test="tns:Fa/tns:P_13_1|tns:Fa/tns:P_14_1|tns:Fa/tns:P_13_2|tns:Fa/tns:P_14_2|tns:Fa/tns:P_13_3|tns:Fa/tns:P_14_3|tns:Fa/tns:P_13_6|tns:Fa/tns:P_13_7|tns:Fa/tns:P_13_4|tns:Fa/tns:P_14_4|tns:Fa/tns:P_13_5">
			<b>Podsumowanie wg stawek</b>
			<br/>
			<br/>
			<table class="break-word" width="60%">
				<tr>
					<td class="niewypelniane" width="12%">Stawka VAT</td>
					<td class="niewypelniane" width="12%">Suma wartości sprzedaży netto</td>
					<td class="niewypelniane" width="12%">Kwota podatku od sumy wartości sprzedaży netto</td>
					<td class="niewypelniane" width="12%">Kwota podatku od sumy wartości sprzedaży netto, przeliczona zgodnie z art. 31a [PLN]</td>
					<td class="niewypelniane" width="12%">Kwota podatku od wartości dodanej w przypadku procedury szczególnej, o której mowa w dziale XII w rozdziale 6a ustawy</td>
					<td>
						<table width="10%">
							<tbody>
								<tr>
									<td/>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<xsl:if test="tns:Fa/tns:P_13_1|tns:Fa/tns:P_14_1">
						<td class="wypelniane" width="12%">
							<xsl:text>22% lub 23%</xsl:text>
						</td>
						<td class="prawa" width="12%">
							<xsl:value-of select="tns:Fa/tns:P_13_1"/>
						</td>
						<td class="prawa" width="12%">
							<xsl:value-of select="tns:Fa/tns:P_14_1"/>
						</td>
						<td class="prawa" width="12%">
							<xsl:value-of select="tns:Fa/tns:P_14_1W"/>
						</td>
						<td class="niewypelniane" width="12%">
						</td>
					</xsl:if>
				</tr>
				<tr>
					<xsl:if test="tns:Fa/tns:P_13_2|tns:Fa/tns:P_14_2">
						<td class="wypelniane" width="12%">
							<xsl:text>7% lub 8%</xsl:text>
						</td>
						<td class="prawa" width="12%">
							<xsl:value-of select="tns:Fa/tns:P_13_2"/>
						</td>
						<td class="prawa" width="12%">
							<xsl:value-of select="tns:Fa/tns:P_14_2"/>
						</td>
						<td class="prawa" width="12%">
							<xsl:value-of select="tns:Fa/tns:P_14_2W"/>
						</td>
						<td class="niewypelniane" width="12%"/>
					</xsl:if>
				</tr>
				<tr>
					<xsl:if test="tns:Fa/tns:P_13_3|tns:Fa/tns:P_14_3">
						<td class="wypelniane" width="12%">
							<xsl:text>5%</xsl:text>
						</td>
						<td class="prawa" width="12%">
							<xsl:value-of select="tns:Fa/tns:P_13_3"/>
						</td>
						<td class="prawa" width="12%">
							<xsl:value-of select="tns:Fa/tns:P_14_3"/>
						</td>
						<td class="prawa" width="12%">
							<xsl:value-of select="tns:Fa/tns:P_14_3W"/>
						</td>
						<td class="niewypelniane" width="12%"/>
					</xsl:if>
				</tr>
				<tr>
					<xsl:if test="tns:Fa/tns:P_13_6">
						<td class="wypelniane" width="12%">
							<xsl:text>0%</xsl:text>
						</td>
						<td class="prawa" width="12%">
							<xsl:value-of select="tns:Fa/tns:P_13_6"/>
						</td>
						<td class="niewypelniane" width="12%"/>
						<td class="niewypelniane" width="12%"/>
						<td class="niewypelniane" width="12%"/>
					</xsl:if>
				</tr>
				<tr>
					<xsl:if test="tns:Fa/tns:P_13_7">
						<td class="wypelniane" width="12%">
							<xsl:text>zw</xsl:text>
						</td>
						<td class="prawa" width="12%">
							<xsl:value-of select="tns:Fa/tns:P_13_7"/>
						</td>
						<td class="niewypelniane" width="12%"/>
						<td class="niewypelniane" width="12%"/>
						<td class="niewypelniane" width="12%"/>
					</xsl:if>
				</tr>
				<tr>
					<xsl:if test="tns:Fa/tns:P_13_4|tns:Fa/tns:P_14_4">
						<td class="wypelniane" width="12%">
							<xsl:text>oo lub ryczałt taxi</xsl:text>
						</td>
						<td class="prawa" width="12%">
							<xsl:value-of select="tns:Fa/tns:P_13_4"/>
						</td>
						<td class="prawa" width="12%">
							<xsl:value-of select="tns:Fa/tns:P_14_4"/>
						</td>
						<td class="prawa" width="12%">
							<xsl:value-of select="tns:Fa/tns:P_14_4W"/>
						</td>
						<td class="niewypelniane" width="12%"/>
					</xsl:if>
				</tr>
				<tr>
					<xsl:if test="tns:Fa/tns:P_13_5">
						<td class="wypelniane" width="12%">
							<xsl:text>np</xsl:text>
						</td>
						<td class="prawa" width="12%">
							<xsl:value-of select="tns:Fa/tns:P_13_5"/>
						</td>
						<td class="niewypelniane" width="12%">
						</td>
						<td class="niewypelniane" width="12%">
						</td>
						<td class="prawa" width="12%">
							<xsl:value-of select="tns:Fa/tns:P_14_5"/>
						</td>
					</xsl:if>
				</tr>
			</table>
		</xsl:if>
		<table>
			<tr>
				<td>
					<br/>
					<b>
						<xsl:if test="((tns:Fa/tns:RodzajFaktury = 'VAT') or (tns:Fa/tns:RodzajFaktury = 'KOR') or (tns:Fa/tns:RodzajFaktury = 'UPR'))">
							Kwota należności ogółem:
						</xsl:if>
						<xsl:if test="((tns:Fa/tns:RodzajFaktury = 'ZAL') or (tns:Fa/tns:RodzajFaktury = 'KOR_ZAL'))">
							Otrzymana kwota zapłaty:
						</xsl:if>
						<xsl:if test="((tns:Fa/tns:RodzajFaktury = 'ROZ') or (tns:Fa/tns:RodzajFaktury = 'KOR_ROZ'))">
							Kwota pozostała do zapłaty:
						</xsl:if>
						<!--Kwota należności ogółem/otrzymana kwota zapłaty/korekta kwoty należności ogółem: -->
						<xsl:value-of select="tns:Fa/tns:P_15"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tns:Fa/tns:KodWaluty"/>
					</b>
					<br/>
					<br/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="Rozliczenie">
		<xsl:if test="tns:Fa/tns:Rozliczenie">
			<xsl:for-each select="tns:Fa/tns:Rozliczenie">
				<b>Rozliczenie</b>
				<br/>
				<br/>
				<xsl:if test="tns:Obciazenia">
					<table>
						<tr>
							<td class="niewypelniane">Obciążenia</td>
						</tr>
					</table>
					<table class="break-word">
						<tr>
							<td class="niewypelniane" width="20%">Kwota obciążeń</td>
							<td class="niewypelniane" width="80%">Powód obciążenia</td>
						</tr>
						<xsl:for-each select="tns:Obciazenia">
							<tr>
								<td class="prawa" width="20%">
									<xsl:value-of select="tns:Kwota"/>
								</td>
								<td class="wypelniane" width="80%">
									<xsl:value-of select="tns:Powod"/>
								</td>
							</tr>
						</xsl:for-each>
						<tr>
							<td class="niewypelniane" width="20%">Suma obciążeń</td>
							<td class="prawa" width="80%">
								<xsl:value-of select="tns:SumaObciazen"/>
							</td>
						</tr>
					</table>
				</xsl:if>
				<br/>
				<xsl:if test="tns:Odliczenia">
					<table>
						<tr>
							<td class="niewypelniane">Odliczenia</td>
						</tr>
					</table>
					<table class="break-word">
						<tr>
							<td class="niewypelniane" width="20%">Kwota odliczeń</td>
							<td class="niewypelniane" width="80%">Powód odliczenia</td>
						</tr>
						<xsl:for-each select="tns:Odliczenia">
							<tr>
								<td class="prawa" width="20%">
									<xsl:value-of select="tns:Kwota"/>
								</td>
								<td class="wypelniane" width="80%">
									<xsl:value-of select="tns:Powod"/>
								</td>
							</tr>
						</xsl:for-each>
						<tr>
							<td class="niewypelniane" width="20%">Suma odliczeń</td>
							<td class="prawa" width="80%">
								<xsl:value-of select="tns:SumaOdliczen"/>
							</td>
						</tr>
					</table>
					<br/>
					<b>Do zapłaty / Do rozliczenia</b>
					<br/>
					<br/>
					<table class="break-word">
						<tr>
							<xsl:choose>
								<xsl:when test="tns:DoZaplaty">
									<td class="niewypelniane" width="20%">Do zapłaty</td>
									<td class="prawa" width="80%">
										<xsl:value-of select="tns:DoZaplaty"/>
									</td>
								</xsl:when>
								<xsl:when test="tns:DoRozliczenia">
									<td class="niewypelniane" width="20%">Do rozliczenia</td>
									<td class="prawa" width="80%">
										<xsl:value-of select="tns:DoRozliczenia"/>
									</td>
								</xsl:when>
							</xsl:choose>
						</tr>
					</table>
				</xsl:if>
				<br/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template name="Platnosc">
		<xsl:for-each select="tns:Fa/tns:Platnosc">
			<xsl:if test="tns:TerminyPlatnosci|tns:FormaPlatnosci|tns:PlatnoscInna|tns:Zaplacono|tns:ZaplataCzesciowa">
				<b>Płatność</b>
				<br/>
				<br/>
				<xsl:if test="tns:TerminPlatnosci|tns:TerminPlatnosciOpis">
					<table class="break-word">
						<tr>
							<td class="niewypelniane" width="20%">Termin płatności</td>
							<td class="niewypelniane" width="80%">Termin płatności opis</td>
						</tr>
						<xsl:for-each select="tns:TerminyPlatnosci">
							<tr>
								<td class="wypelniane" width="20%">
									<xsl:value-of select="tns:TerminPlatnosci"/>
								</td>
								<td class="wypelniane" width="80%">
									<xsl:value-of select="tns:TerminPlatnosciOpis"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</xsl:if>
				<xsl:if test="tns:FormaPlatnosci">
					<table class="normalna">
						<tr>
							<td class="niewypelniane" width="20%">Forma płatności</td>
						</tr>
						<tr>
							<td class="wypelniane" width="20%">
								<xsl:choose>
									<xsl:when test="tns:FormaPlatnosci = '1'">
										<xsl:text>gotówka</xsl:text>
									</xsl:when>
									<xsl:when test="tns:FormaPlatnosci = '2'">
										<xsl:text>karta</xsl:text>
									</xsl:when>
									<xsl:when test="tns:FormaPlatnosci = '3'">
										<xsl:text>bon</xsl:text>
									</xsl:when>
									<xsl:when test="tns:FormaPlatnosci = '4'">
										<xsl:text>czek</xsl:text>
									</xsl:when>
									<xsl:when test="tns:FormaPlatnosci = '5'">
										<xsl:text>kredyt</xsl:text>
									</xsl:when>
									<xsl:when test="tns:FormaPlatnosci = '6'">
										<xsl:text>przelew</xsl:text>
									</xsl:when>
									<xsl:when test="tns:FormaPlatnosci = '7'">
										<xsl:text>mobilna</xsl:text>
									</xsl:when>
								</xsl:choose>
							</td>
						</tr>
					</table>
				</xsl:if>
			</xsl:if>
			<xsl:if test="tns:PlatnoscInna">
				<table class="break-word">
					<tr>
						<td class="niewypelniane" width="20%">Inna forma płatności</td>
						<td class="niewypelniane" width="80%">Opis płatności</td>
					</tr>
					<tr>
						<td class="wypelniane" width="20%">
							<xsl:if test="tns:PlatnoscInna = '1'">
								<input type="checkbox" checked="checked" disabled="disabled"/>
								<b>1. Tak</b>
							</xsl:if>
						</td>
						<td class="wypelniane" width="80%">
							<xsl:value-of select="tns:OpisPlatnosci"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table class="normalna" width="60%">
				<xsl:if test="tns:Zaplacono = '1'">
					<tr>
						<br/>
						<td class="niewypelniane" width="30%">
							Zapłacono
						</td>
						<td class="niewypelniane" width="30%">
							Data zapłaty
						</td>
					</tr>
					<tr>
						<td class="wypelniane" width="30%">
							<input type="checkbox" checked="checked" disabled="disabled"/>
							<b>1. Tak</b>
						</td>
						<td class="wypelniane" width="30%">
							<xsl:value-of select="tns:DataZaplaty"/>
						</td>
					</tr>
				</xsl:if>
				<br/>
				<xsl:if test="tns:ZaplataCzesciowa = '1'">
					<tr>
						<td class="niewypelniane" width="20%" rowspan="2">Zapłata częściowa</td>
						<td class="niewypelniane" width="40%" colspan="2">Płatności częściowe</td>
					</tr>
					<tr>
						<td class="niewypelniane" width="20%">Kwota zapłaty częściowej</td>
						<td class="niewypelniane" width="20%">Data zapłaty częściowej</td>
					</tr>
					<tr>
						<td class="wypelniane" width="20%" rowspan="100%">
							<input type="checkbox" checked="checked" disabled="disabled"/>
							<b>1. Tak</b>
						</td>
						<xsl:for-each select="tns:PlatnosciCzesciowe">
							<tr>
								<td class="wypelniane" width="20%">
									<xsl:value-of select="tns:KwotaZaplatyCzesciowej"/>
								</td>
								<td class="wypelniane" width="20%">
									<xsl:value-of select="tns:DataZaplatyCzesciowej"/>
									<br/>
								</td>
							</tr>
						</xsl:for-each>
					</tr>
				</xsl:if>
			</table>
			<xsl:if test="tns:RachunekBankowy/tns:NrRBPL">
				<br/>
				<b>Rachunek bankowy</b>
				<table class="break-word">
					<tr>
						<br/>
						<td class="niewypelniane" width="17%">Pełny numer rachunku w standardzie NRB
						</td>
						<td class="niewypelniane" width="23%">Rachunek własny banku
						</td>
						<td class="niewypelniane" width="60%">Nazwa banku
						</td>
					</tr>
					<xsl:for-each select="tns:RachunekBankowy">
						<xsl:if test="tns:NrRBPL">
							<tr>
								<td class="wypelniane" width="17%">
									<xsl:value-of select="tns:NrRBPL"/>
								</td>
								<td class="wypelniane" width="23%">
									<xsl:choose>
										<xsl:when test="tns:RachunekWlasnyBanku = 1">
											<xsl:text>rachunek banku lub rachunek spółdzielczej kasy oszczędnościowo-kredytowej służący do dokonywania rozliczeń z tytułu nabywanych przez ten bank lub tę kasę wierzytelności pieniężnych</xsl:text>
										</xsl:when>
										<xsl:when test="tns:RachunekWlasnyBanku = 2">
											<xsl:text>rachunek banku lub rachunek spółdzielczej kasy oszczędnościowo-kredytowej wykorzystywany przez ten bank lub tę kasę do pobrania należności od nabywcy towarów lub usługobiorcy za dostawę towarów lub świadczenie usług, potwierdzone fakturą, i przekazania jej w całości albo części dostawcy towarów lub usługodawcy</xsl:text>
										</xsl:when>
										<xsl:when test="tns:RachunekWlasnyBanku = 3">
											<xsl:text>rachunek banku lub rachunek spółdzielczej kasy oszczędnościowo-kredytowej prowadzony przez ten bank lub tę kasę w ramach gospodarki własnej, niebędący rachunkiem rozliczeniowym</xsl:text>
										</xsl:when>
									</xsl:choose>
								</td>
								<td class="wypelniane" width="60%">
									<xsl:value-of select="tns:NazwaBanku"/>
								</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</table>
			</xsl:if>
			<table class="break-word">
				<xsl:if test="tns:RachunekBankowy/tns:NrRBZagr">
					<tr>
						<td class="niewypelniane" width="18%">Pełny numer rachunku zagranicznego
						</td>
						<td class="niewypelniane" width="6%">SWIFT
						</td>
						<td class="niewypelniane" width="23%">Rachunek własny banku
						</td>
						<td class="niewypelniane" width="43%">Nazwa banku
						</td>
					</tr>
					<xsl:for-each select="tns:RachunekBankowy">
						<xsl:if test="tns:NrRBZagr">
							<tr>
								<td class="wypelniane" width="18%">
									<xsl:value-of select="tns:NrRBZagr"/>
								</td>
								<td class="wypelniane" width="6%">
									<xsl:value-of select="tns:SWIFT"/>
								</td>
								<td class="wypelniane" width="23%">
									<xsl:choose>
										<xsl:when test="tns:RachunekWlasnyBanku = 1">
											<xsl:text>rachunek banku lub rachunek spółdzielczej kasy oszczędnościowo-kredytowej służący do dokonywania rozliczeń z tytułu nabywanych przez ten bank lub tę kasę wierzytelności pieniężnych</xsl:text>
										</xsl:when>
										<xsl:when test="tns:RachunekWlasnyBanku = 2">
											<xsl:text>rachunek banku lub rachunek spółdzielczej kasy oszczędnościowo-kredytowej wykorzystywany przez ten bank lub tę kasę do pobrania należności od nabywcy towarów lub usługobiorcy za dostawę towarów lub świadczenie usług, potwierdzone fakturą, i przekazania jej w całości albo części dostawcy towarów lub usługodawcy</xsl:text>
										</xsl:when>
										<xsl:when test="tns:RachunekWlasnyBanku = 3">
											<xsl:text>rachunek banku lub rachunek spółdzielczej kasy oszczędnościowo-kredytowej prowadzony przez ten bank lub tę kasę w ramach gospodarki własnej, niebędący rachunkiem rozliczeniowym</xsl:text>
										</xsl:when>
									</xsl:choose>
								</td>
								<td class="wypelniane" width="43%">
									<xsl:value-of select="tns:NazwaBanku"/>
								</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
			</table>
			<xsl:if test="tns:RachunekBankowyFaktora/tns:NrRBPL">
				<br/>
				<b>Rachunek bankowy faktora</b>
				<table class="break-word">
					<tr>
						<br/>
						<td class="niewypelniane" width="17%">Pełny numer rachunku w standardzie NRB
						</td>
						<td class="niewypelniane" width="23%">Rachunek własny banku
						</td>
						<td class="niewypelniane" width="60%">Nazwa banku
						</td>
					</tr>
					<xsl:for-each select="tns:RachunekBankowyFaktora">
						<xsl:if test="tns:NrRBPL">
							<tr>
								<td class="wypelniane" width="17%">
									<xsl:value-of select="tns:NrRBPL"/>
								</td>
								<td class="wypelniane" width="23%">
									<xsl:choose>
										<xsl:when test="tns:RachunekWlasnyBanku = 1">
											<xsl:text>rachunek banku lub rachunek spółdzielczej kasy oszczędnościowo-kredytowej służący do dokonywania rozliczeń z tytułu nabywanych przez ten bank lub tę kasę wierzytelności pieniężnych</xsl:text>
										</xsl:when>
										<xsl:when test="tns:RachunekWlasnyBanku = 2">
											<xsl:text>rachunek banku lub rachunek spółdzielczej kasy oszczędnościowo-kredytowej wykorzystywany przez ten bank lub tę kasę do pobrania należności od nabywcy towarów lub usługobiorcy za dostawę towarów lub świadczenie usług, potwierdzone fakturą, i przekazania jej w całości albo części dostawcy towarów lub usługodawcy</xsl:text>
										</xsl:when>
										<xsl:when test="tns:RachunekWlasnyBanku = 3">
											<xsl:text>rachunek banku lub rachunek spółdzielczej kasy oszczędnościowo-kredytowej prowadzony przez ten bank lub tę kasę w ramach gospodarki własnej, niebędący rachunkiem rozliczeniowym</xsl:text>
										</xsl:when>
									</xsl:choose>
								</td>
								<td class="wypelniane" width="60%">
									<xsl:value-of select="tns:NazwaBanku"/>
								</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</table>
			</xsl:if>
			<table class="break-word">
				<xsl:if test="tns:RachunekBankowyFaktora/tns:NrRBZagr">
					<tr>
						<td class="niewypelniane" width="20%">Pełny numer rachunku zagranicznego
						</td>
						<td class="niewypelniane" width="20%">SWIFT
						</td>
						<td class="niewypelniane" width="40%">Rachunek własny banku
						</td>
						<td class="niewypelniane" width="20%">Nazwa banku
						</td>
					</tr>
					<xsl:for-each select="tns:RachunekBankowyFaktora">
						<xsl:if test="tns:NrRBZagr">
							<tr>
								<td class="wypelniane" width="20%">
									<xsl:value-of select="tns:NrRBZagr"/>
								</td>
								<td class="wypelniane" width="20%">
									<xsl:value-of select="tns:SWIFT"/>
								</td>
								<td class="wypelniane" width="40%">
									<xsl:choose>
										<xsl:when test="tns:RachunekWlasnyBanku = 1">
											<xsl:text>rachunek banku lub rachunek spółdzielczej kasy oszczędnościowo-kredytowej służący do dokonywania rozliczeń z tytułu nabywanych przez ten bank lub tę kasę wierzytelności pieniężnych</xsl:text>
										</xsl:when>
										<xsl:when test="tns:RachunekWlasnyBanku = 2">
											<xsl:text>rachunek banku lub rachunek spółdzielczej kasy oszczędnościowo-kredytowej wykorzystywany przez ten bank lub tę kasę do pobrania należności od nabywcy towarów lub usługobiorcy za dostawę towarów lub świadczenie usług, potwierdzone fakturą, i przekazania jej w całości albo części dostawcy towarów lub usługodawcy</xsl:text>
										</xsl:when>
										<xsl:when test="tns:RachunekWlasnyBanku = 3">
											<xsl:text>rachunek banku lub rachunek spółdzielczej kasy oszczędnościowo-kredytowej prowadzony przez ten bank lub tę kasę w ramach gospodarki własnej, niebędący rachunkiem rozliczeniowym</xsl:text>
										</xsl:when>
									</xsl:choose>
								</td>
								<td class="wypelniane" width="20%">
									<xsl:value-of select="tns:NazwaBanku"/>
								</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
			</table>
			<br/>
			<xsl:if test="tns:Skonto/tns:WarunkiSkonta">
				<b>Skonto</b>
				<br/>
				<table class="break-word">
					<tr>
						<br/>
						<td class="niewypelniane" width="50%">
							Warunki skonta
						</td>
						<td class="niewypelniane" width="50%">
							Wysokość skonta
						</td>
					</tr>
					<tr>
						<td class="wypelniane" width="50%">
							<xsl:value-of select="tns:Skonto/tns:WarunkiSkonta"/>
						</td>
						<td class="wypelniane" width="50%">
							<xsl:value-of select="tns:Skonto/tns:WysokoscSkonta"/>
						</td>
					</tr>
				</table>
				<br/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="Adnotacje">
		<b>Adnotacje</b>
		<br/>
		<xsl:for-each select="tns:Fa/tns:Adnotacje">
			<br/>
			<table class="break-word">
				<tr>
					<td class="niewypelniane" width="25%">Metoda kasowa</td>
					<td class="niewypelniane" width="25%">Samofakturowanie</td>
					<td class="niewypelniane" width="25%">Odwrotne obciążenie</td>
					<td class="niewypelniane" width="25%">Mechanizm podzielonej płatności</td>
				</tr>
				<tr>
					<td class="wypelniane" width="25%">
						<xsl:choose>
							<xsl:when test="tns:P_16 = '1'">
								<input type="checkbox" checked="checked" disabled="disabled"/>
								<b>
									<xsl:text>1. Tak</xsl:text>
								</b>
							</xsl:when>
							<xsl:when test="tns:P_16 = '2'">
								<input type="checkbox" checked="checked" disabled="disabled"/>
								<b>
									<xsl:text>2. Nie</xsl:text>
								</b>
							</xsl:when>
						</xsl:choose>
					</td>
					<td class="wypelniane" width="25%">
						<xsl:choose>
							<xsl:when test="tns:P_17 = '1'">
								<input type="checkbox" checked="checked" disabled="disabled"/>
								<b>
									<xsl:text>1. Tak</xsl:text>
								</b>
							</xsl:when>
							<xsl:when test="tns:P_17 = '2'">
								<input type="checkbox" checked="checked" disabled="disabled"/>
								<b>
									<xsl:text>2. Nie</xsl:text>
								</b>
							</xsl:when>
						</xsl:choose>
					</td>
					<td class="wypelniane" width="25%">
						<xsl:choose>
							<xsl:when test="tns:P_18 = '1'">
								<input type="checkbox" checked="checked" disabled="disabled"/>
								<b>
									<xsl:text>1. Tak</xsl:text>
								</b>
							</xsl:when>
							<xsl:when test="tns:P_18 = '2'">
								<input type="checkbox" checked="checked" disabled="disabled"/>
								<b>
									<xsl:text>2. Nie</xsl:text>
								</b>
							</xsl:when>
						</xsl:choose>
					</td>
					<td class="wypelniane" width="25%">
						<xsl:choose>
							<xsl:when test="tns:P_18A = '1'">
								<input type="checkbox" checked="checked" disabled="disabled"/>
								<b>
									<xsl:text>1. Tak</xsl:text>
								</b>
							</xsl:when>
							<xsl:when test="tns:P_18A = '2'">
								<input type="checkbox" checked="checked" disabled="disabled"/>
								<b>
									<xsl:text>2. Nie</xsl:text>
								</b>
							</xsl:when>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<br/>
			<table class="break-word">
				<tr>
					<td class="niewypelniane" width="25%">Dostawy towarów lub świadczenia usług zwolnionych</td>
					<td class="niewypelniane" width="75%">Przepis, na podstawie którego podatnik stosuje zwolnienie od podatku </td>
				</tr>
				<tr>
					<td class="wypelniane" width="25%">
						<xsl:choose>
							<xsl:when test="tns:P_19 = '1'">
								<input type="checkbox" checked="checked" disabled="disabled"/>
								<b>
									<xsl:text>1. Tak</xsl:text>
								</b>
							</xsl:when>
							<xsl:when test="tns:P_19 = '2'">
								<input type="checkbox" checked="checked" disabled="disabled"/>
								<b>
									<xsl:text>2. Nie</xsl:text>
								</b>
							</xsl:when>
						</xsl:choose>
					</td>
					<td class="wypelniane" width="75%">
						<xsl:value-of select="tns:P_19A|tns:P_19B|tns:P_19C"/>
					</td>
				</tr>
			</table>
			<br/>
			<xsl:if test="tns:P_22 = '1'">
				<div>Wewnątrzwspólnotowa dostawa nowych środków transportu -
					<input type="checkbox" checked="checked" disabled="disabled"/>
					<b>1. Tak</b>
				</div>
				<br/>
				<table class="break-word">
					<tr>
						<td class="niewypelniane">Data dopuszczenia nowego środka transportu do użytku</td>
						<td class="niewypelniane">Marka nowego środka transportu</td>
						<td class="niewypelniane">Model nowego środka transportu</td>
						<td class="niewypelniane">Kolor nowego środka transportu</td>
						<td class="niewypelniane">Numer rejestracyjny nowego środka transportu</td>
						<td class="niewypelniane">Rok produkcji nowego środka transportu</td>
						<td class="niewypelniane">Przebieg (dotyczy pojazdu lądowego)</td>
						<td class="niewypelniane">VIN lub numer nadwozia lub numer podwozia lub numer ramy (dotyczy pojazdu lądowego)</td>
						<td class="niewypelniane">Typ nowego środka transportu (dotyczy pojazdu lądowego)</td>
						<td class="niewypelniane">Liczba godzin roboczych (dotyczy jednostek pływających)</td>
						<td class="niewypelniane">Numer kadłuba (dotyczy jednostek pływających)</td>
						<td class="niewypelniane">Liczba godzin roboczych (dotyczy statków powietrznych)</td>
						<td class="niewypelniane">Numer fabryczny (dotyczy statków powietrznych)</td>
					</tr>
					<tr>
						<td class="srodek" width="auto">
							<xsl:value-of select="tns:P_22A"/>
						</td>
						<td class="srodek" width="auto">
							<xsl:value-of select="tns:P_22BMK"/>
						</td>
						<td class="srodek" width="auto">
							<xsl:value-of select="tns:P_22BMD"/>
						</td>
						<td class="wypelniane" width="auto">
							<xsl:value-of select="tns:P_22BK"/>
						</td>
						<td class="wypelniane" width="auto">
							<xsl:value-of select="tns:P_22BNR"/>
						</td>
						<td class="wypelniane" width="auto">
							<xsl:value-of select="tns:P_22BRP"/>
						</td>
						<td class="wypelniane" width="auto">
							<xsl:value-of select="tns:P_22B"/>
						</td>
						<td class="wypelniane" width="auto">
							<xsl:if test="tns:P_22B1">
								<xsl:value-of select="tns:P_22B1"/>
							</xsl:if>
							<xsl:if test="tns:P_22B2">
								<xsl:value-of select="tns:P_22B2"/>
							</xsl:if>
							<xsl:if test="tns:P_22B3">
								<xsl:value-of select="tns:P_22B3"/>
							</xsl:if>
							<xsl:if test="tns:P_22B4">
								<xsl:value-of select="tns:P_22B4"/>
							</xsl:if>
						</td>
						<td class="wypelniane" width="auto">
							<xsl:value-of select="tns:P_22BT"/>
						</td>
						<td class="wypelniane" width="auto">
							<xsl:value-of select="tns:P_22C"/>
						</td>
						<td class="wypelniane" width="auto">
							<xsl:value-of select="tns:P_22C1"/>
						</td>
						<td class="wypelniane" width="auto">
							<xsl:value-of select="tns:P_22D"/>
						</td>
						<td class="wypelniane" width="auto">
							<xsl:value-of select="tns:P_22D1"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<br/>
			<br/>
			<div>VAT: Faktura WE uproszczona na mocy art. 135-138 ustawy o ptu. Podatek z tytułu dokonanej dostawy zostanie rozliczony przez ostatniego w kolejności podatnika podatku od wartości dodanej:
				<xsl:choose>
					<xsl:when test="tns:P_23 = '1'">
						<b>
							<input type="checkbox" checked="checked" disabled="disabled"/>
							<xsl:text>1. Tak</xsl:text>
						</b>
					</xsl:when>
					<xsl:when test="tns:P_23 = '2'">
						<b>
							<input type="checkbox" checked="checked" disabled="disabled"/>
							<xsl:text>2. Nie</xsl:text>
						</b>
					</xsl:when>
				</xsl:choose>
			</div>
			<br/>
			<div>Procedura marży, o której mowa w art. 119 lub 120 ustawy:
				<xsl:choose>
					<xsl:when test="tns:P_PMarzy = '1'">
						<b>
							<input type="checkbox" checked="checked" disabled="disabled"/>
							<xsl:text>1. Tak</xsl:text>
						</b>
					</xsl:when>
					<xsl:when test="tns:P_PMarzy = '2'">
						<b>
							<input type="checkbox" checked="checked" disabled="disabled"/>
							<xsl:text>2. Nie</xsl:text>
						</b>
					</xsl:when>
				</xsl:choose>
			</div>
			<br/>
			<xsl:if test="tns:P_PMarzy = '1'">
				<table class="normalna">
					<tr>
						<td class="niewypelniane" width="25%">Procedura marży dla biur podróży</td>
						<td class="niewypelniane" width="25%">Procedura marży - towary używane</td>
						<td class="niewypelniane" width="25%">Procedura marży - dzieła sztuki</td>
						<td class="niewypelniane" width="25%">Procedura marży - przedmioty kolekcjonerskie i antyki</td>
					</tr>
					<tr>
						<td class="wypelniane" width="25%">
							<xsl:if test="tns:P_PMarzy_2 = '1'">
								<input type="checkbox" checked="checked" disabled="disabled"/>
								<b>
									<xsl:text>1. Tak</xsl:text>
								</b>
							</xsl:if>
						</td>
						<td class="wypelniane" width="25%">
							<xsl:if test="tns:P_PMarzy_3_1 = '1'">
								<input type="checkbox" checked="checked" disabled="disabled"/>
								<b>
									<xsl:text>1. Tak</xsl:text>
								</b>
							</xsl:if>
						</td>
						<td class="wypelniane" width="25%">
							<xsl:if test="tns:P_PMarzy_3_2 = '1'">
								<input type="checkbox" checked="checked" disabled="disabled"/>
								<b>
									<xsl:text>1. Tak</xsl:text>
								</b>
							</xsl:if>
						</td>
						<td class="wypelniane" width="25%">
							<xsl:if test="tns:P_PMarzy_3_3 = '1'">
								<input type="checkbox" checked="checked" disabled="disabled"/>
								<b>
									<xsl:text>1. Tak</xsl:text>
								</b>
							</xsl:if>
						</td>
					</tr>
				</table>
			</xsl:if>
			<br/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="WarunkiTransakcji">
		<xsl:if test="tns:Fa/tns:WarunkiTransakcji">
			<xsl:for-each select="tns:Fa/tns:WarunkiTransakcji">
				<b>Warunki transakcji</b>
				<br/>
				<br/>
				<xsl:if test="tns:Umowy">
					<table>
						<tr>
							<td class="niewypelniane">Umowy</td>
						</tr>
					</table>
					<table class="break-word">
						<tr>
							<td class="niewypelniane" width="20%">Data umowy</td>
							<td class="niewypelniane" width="80%">Numer umowy</td>
						</tr>
						<xsl:for-each select="tns:Umowy">
							<tr>
								<td class="wypelniane" width="20%">
									<xsl:if test="tns:DataUmowy">
										<xsl:value-of select="tns:DataUmowy"/>
										<br/>
									</xsl:if>
								</td>
								<td class="wypelniane" width="80%">
									<xsl:if test="tns:NrUmowy">
										<xsl:value-of select="tns:NrUmowy"/>
										<br/>
									</xsl:if>
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</xsl:if>
				<br/>
				<table>
					<tr>
						<td class="niewypelniane">Zamówienia</td>
					</tr>
				</table>
				<table class="break-word">
					<tr>
						<td class="niewypelniane" width="20%">Data zamówienia</td>
						<td class="niewypelniane" width="80%">Numer zamówienia</td>
					</tr>
					<xsl:for-each select="tns:Zamowienia">
						<tr>
							<td class="wypelniane" width="20%">
								<xsl:if test="tns:DataZamowienia">
									<xsl:value-of select="tns:DataZamowienia"/>
									<br/>
								</xsl:if>
							</td>
							<td class="wypelniane" width="80%">
								<xsl:if test="tns:NrZamowienia">
									<xsl:value-of select="tns:NrZamowienia"/>
									<br/>
								</xsl:if>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<br/>
				<xsl:if test="tns:NrPartiiTowaru">
					<table class="break-word" width="100%">
						<tr>
							<td class="niewypelniane" width="20%">Numer partii towaru</td>
							<td class="wypelniane" width="80%">
								<xsl:for-each select="tns:NrPartiiTowaru">
									<xsl:number value="position()" format="1. "/>
									<xsl:value-of select="."/>
									<br/>
								</xsl:for-each>
							</td>
						</tr>
					</table>
					<br/>
				</xsl:if>
				<xsl:if test="tns:WarunkiDostawy">
					<table class="break-word" width="100%">
						<tr>
							<td class="niewypelniane" width="40%">Warunki dostawy towarów - w przypadku istnienia pomiędzy stronami transakcji, umowy określającej warunki dostawy tzw. Incoterms</td>
							<td class="wypelniane" width="60%">
								<xsl:value-of select="tns:WarunkiDostawy"/>
							</td>
						</tr>
					</table>
					<br/>
				</xsl:if>
				<xsl:if test="tns:KursUmowny|tns:WalutaUmowna">
					<table width="100%">
						<tr>
							<td class="niewypelniane" width="50%">Kurs umowny - w przypadkach, gdy w fakturze znajduje się informacja o kursie, po którym zostały przeliczone kwoty wykazane w fakturze w złotych. Nie dotyczy przypadków, o których mowa w art. 31a ustawy</td>
							<td class="niewypelniane" width="50%">Waluta umowna - trzyliterowy kod waluty (ISO-4217) w przypadkach, gdy w fakturze znajduje się informacja o kursie, po którym zostały przeliczone kwoty wykazane w fakturze w złotych. Nie dotyczy przypadków, o których mowa w art. 31a ustawy</td>
						</tr>
						<tr>
							<td class="wypelniane" width="50%">
								<xsl:value-of select="tns:KursUmowny"/>
							</td>
							<td class="wypelniane" width="50%">
								<xsl:value-of select="tns:WalutaUmowna"/>
							</td>
						</tr>
					</table>
					<br/>
				</xsl:if>
				<!--Transport-->
				<xsl:if test="tns:Transport">
					<xsl:for-each select="tns:Transport">
						<xsl:if test="tns:RodzajTransportu">
							<table width="100%">
								<tr>
									<td class="niewypelniane" colspan="2">Transport <xsl:number value="position()" format="(1) "/>
									</td>
								</tr>
								<tr>
									<td class="niewypelniane" width="30%">Rodzaj zastosowanego transportu w przypadku dokonanej dostawy towarów</td>
									<td class="wypelniane" width="70%">
										<xsl:choose>
											<xsl:when test="tns:RodzajTransportu = '1'">
												<xsl:text>Transport morski</xsl:text>
											</xsl:when>
											<xsl:when test="tns:RodzajTransportu = '2'">
												<xsl:text>Transport kolejowy</xsl:text>
											</xsl:when>
											<xsl:when test="tns:RodzajTransportu = '3'">
												<xsl:text>Transport drogowy</xsl:text>
											</xsl:when>
											<xsl:when test="tns:RodzajTransportu = '4'">
												<xsl:text>Transport lotniczy</xsl:text>
											</xsl:when>
											<xsl:when test="tns:RodzajTransportu = '5'">
												<xsl:text>Przesyłka pocztowa</xsl:text>
											</xsl:when>
											<xsl:when test="tns:RodzajTransportu = '7'">
												<xsl:text>Stałe instalacje przesyłowe</xsl:text>
											</xsl:when>
											<xsl:when test="tns:RodzajTransportu = '8'">
												<xsl:text>Żegluga śródlądowa</xsl:text>
											</xsl:when>
										</xsl:choose>
									</td>
								</tr>
							</table>
						</xsl:if>
						<xsl:if test="tns:TransportInny">
							<table width="100%">
								<tr>
									<td class="niewypelniane" colspan="2">Transport <xsl:number value="position()" format="(1) "/>
									</td>
								</tr>
								<tr>
									<td class="niewypelniane">Inny rodzaj transportu</td>
									<td class="niewypelniane">Opis innego rodzaju transportu</td>
								</tr>
								<tr>
									<td class="wypelniane">
										<xsl:if test="tns:TransportInny ='1'">
											<input type="checkbox" checked="checked" disabled="disabled"/>
											<b>
												<xsl:text>1. Tak</xsl:text>
											</b>
										</xsl:if>
									</td>
									<td class="wypelniane">
										<xsl:value-of select="tns:OpisInnegoTransportu"/>
									</td>
								</tr>
							</table>
						</xsl:if>
						<!--<br/>-->
						<!--Przewoźnik-->
						<xsl:for-each select="tns:Przewoznik/tns:DaneIdentyfikacyjne">
							<table class="break-word">
								<tr>
									<td class="niewypelniane" colspan="2">Przewoźnik</td>
								</tr>
								<tr>
									<td class="niewypelniane" width="25%" rowspan="4">Dane identyfikacyjne przewoźnika</td>
									<td class="wypelniane" width="75%">
										<xsl:if test="tns:NIP">
											<xsl:text>NIP: </xsl:text>
											<xsl:value-of select="tns:NIP"/>
										</xsl:if>
										<xsl:if test="tns:NrID">
											<xsl:text>Identyfikator podatkowy: </xsl:text>
											<xsl:value-of select="tns:NrID"/>
										</xsl:if>
										<xsl:if test="tns:BrakID = '1'">
											<xsl:text>Podmiot nie posiada identyfikatora podatkowego: Tak</xsl:text>
										</xsl:if>
									</td>
								</tr>
								<xsl:if test="tns:ImiePierwsze">
									<tr>
										<td class="wypelniane" width="75%">
											<xsl:value-of select="tns:ImiePierwsze"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="tns:Nazwisko">
									<tr>
										<td class="wypelniane" width="75%">
											<xsl:value-of select="tns:Nazwisko"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="tns:PelnaNazwa">
									<tr>
										<td class="wypelniane" width="75%">
											<xsl:value-of select="tns:PelnaNazwa"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="tns:NazwaHandlowa">
									<tr>
										<td class="wypelniane" width="75%">
											<xsl:value-of select="tns:NazwaHandlowa"/>
										</td>
									</tr>
								</xsl:if>
							</table>
						</xsl:for-each>
						<xsl:for-each select="tns:Przewoznik/tns:AdresPrzewoznika">
							<table class="normalna">
								<tr>
									<td class="niewypelniane" width="25%" rowspan="10">Adres przewoźnika</td>
									<td class="wypelniane" width="75%">
										<xsl:if test="tns:AdresPol">
											<xsl:apply-templates select="tns:AdresPol/tns:KodKraju"/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr">
											<xsl:apply-templates select="tns:AdresZagr/tns:KodKraju"/>
										</xsl:if>
									</td>
								</tr>
								<xsl:if test="tns:AdresPol/tns:Wojewodztwo">
									<tr>
										<xsl:if test="tns:AdresPol/tns:Wojewodztwo">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:Wojewodztwo"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:Powiat">
									<tr>
										<xsl:if test="tns:AdresPol/tns:Powiat">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:Powiat"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:Gmina">
									<tr>
										<xsl:if test="tns:AdresPol/tns:Gmina">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:Gmina"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<tr>
									<td class="wypelniane" width="75%">
										<xsl:if test="tns:AdresPol">
											<xsl:value-of select="tns:AdresPol/tns:Miejscowosc"/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr">
											<xsl:value-of select="tns:AdresZagr/tns:Miejscowosc"/>
										</xsl:if>
									</td>
								</tr>
								<xsl:if test="tns:AdresPol/tns:Ulica|tns:AdresZagr/tns:Ulica">
									<tr>
										<xsl:if test="tns:AdresPol/tns:Ulica">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:Ulica"/>
											</td>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:Ulica">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresZagr/tns:Ulica"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:NrDomu|tns:AdresZagr/tns:NrDomu">
									<tr>
										<xsl:if test="tns:AdresPol/tns:NrDomu">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:NrDomu"/>
												<xsl:if test="tns:AdresPol/tns:NrLokalu">
													<xsl:text>/</xsl:text>
													<xsl:value-of select="tns:AdresPol/tns:NrLokalu"/>
												</xsl:if>
											</td>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:NrDomu">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresZagr/tns:NrDomu"/>
												<xsl:if test="tns:AdresZagr/tns:NrLokalu">
													<xsl:text>/</xsl:text>
													<xsl:value-of select="tns:AdresZagr/tns:NrLokalu"/>
												</xsl:if>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:KodPocztowy|tns:AdresZagr/tns:KodPocztowy">
									<tr>
										<xsl:if test="tns:AdresPol/tns:KodPocztowy">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:KodPocztowy"/>
											</td>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:KodPocztowy">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresZagr/tns:KodPocztowy"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:Poczta">
									<tr>
										<xsl:if test="tns:AdresPol/tns:Poczta">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:Poczta"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:GLN|tns:AdresZagr/tns:GLN">
									<tr>
										<xsl:if test="tns:AdresPol/tns:GLN">
											<td class="wypelniane" width="75%">
												<xsl:text>GLN: </xsl:text>
												<xsl:value-of select="tns:AdresPol/tns:GLN"/>
											</td>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:GLN">
											<td class="wypelniane" width="75%">
												<xsl:text>GLN: </xsl:text>
												<xsl:value-of select="tns:AdresZagr/tns:GLN"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:NazwaHandlowa">
									<tr>
										<td class="wypelniane" width="75%">
											<xsl:value-of select="tns:NazwaHandlowa"/>
										</td>
									</tr>
								</xsl:if>
							</table>
							<!--<br/>-->
						</xsl:for-each>
						<xsl:if test="tns:NrZleceniaTransportu">
							<table class="break-word" width="100%">
								<tr>
									<td class="niewypelniane" width="40%">Numer zlecenia transportu:</td>
									<td class="wypelniane" width="60%">
										<xsl:value-of select="tns:NrZleceniaTransportu"/>
									</td>
								</tr>
							</table>
						</xsl:if>
						<table class="break-word">
							<xsl:if test="tns:OpisLadunku">
								<tr>
									<td class="niewypelniane" width="25%">Opis ładunku</td>
									<td class="wypelniane" width="75%">
										<xsl:choose>
											<xsl:when test="tns:OpisLadunku = '1'">
												<xsl:text>Bańka</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '2'">
												<xsl:text>Beczka</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '3'">
												<xsl:text>Butla</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '4'">
												<xsl:text>Karton</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '5'">
												<xsl:text>Kanister</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '6'">
												<xsl:text>Klatka</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '7'">
												<xsl:text>Kontener</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '8'">
												<xsl:text>Kosz/koszyk</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '9'">
												<xsl:text>Łubianka</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '10'">
												<xsl:text>Opakowanie zbiorcze</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '11'">
												<xsl:text>Paczka</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '12'">
												<xsl:text>Pakiet</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '13'">
												<xsl:text>Paleta</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '14'">
												<xsl:text>Pojemnik</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '15'">
												<xsl:text>Pojemnik do ładunków masowych stałych</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '16'">
												<xsl:text>Pojemnik do ładunków masowych w postaci płynnej</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '17'">
												<xsl:text>Pudełko</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '18'">
												<xsl:text>Puszka</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '19'">
												<xsl:text>Skrzynia</xsl:text>
											</xsl:when>
											<xsl:when test="tns:OpisLadunku = '20'">
												<xsl:text>Worek</xsl:text>
											</xsl:when>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td class="niewypelniane" width="25%">Jednostka opakowania</td>
									<td class="wypelniane" width="75%">
										<xsl:value-of select="tns:JednostkaOpakowania"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="tns:LadunekInny = '1'">
								<tr>
									<td class="niewypelniane" width="25%">Inny ładunek</td>
									<td class="wypelniane" width="75%">
										<input type="checkbox" checked="checked" disabled="disabled"/>
										<b>
											<xsl:text>1. Tak</xsl:text>
										</b>
									</td>
								</tr>
								<tr>
									<td class="niewypelniane" width="25%">Opis innego ładunku</td>
									<td class="wypelniane" width="75%">
										<xsl:value-of select="tns:OpisInnegoLadunku"/>
									</td>
								</tr>
								<tr>
									<td class="niewypelniane" width="25%">Jednostka Opakowania</td>
									<td class="wypelniane" width="75%">
										<xsl:value-of select="tns:JednostkaOpakowania"/>
									</td>
								</tr>
							</xsl:if>
						</table>
						<table class="break-word">
							<tr>
								<td class="niewypelniane">Data i godzina rozpoczęcia transportu</td>
								<td class="niewypelniane">Data i godzina zakończenia transportu</td>
								<td class="niewypelniane">Adres miejsca wysyłki</td>
								<td class="niewypelniane">Adres pośredni wysyłki</td>
								<td class="niewypelniane">Adres miejsca docelowego, do którego został zlecony transport</td>
							</tr>
							<tr>
								<td class="wypelniane" width="auto">
									<xsl:if test="tns:DataGodzRozpTransportu">
										<xsl:value-of select="tns:DataGodzRozpTransportu"/>
									</xsl:if>
								</td>
								<td class="wypelniane" width="auto">
									<xsl:if test="tns:DataGodzZakTransportu">
										<xsl:value-of select="tns:DataGodzZakTransportu"/>
									</xsl:if>
								</td>
								<td class="wypelniane" width="auto">
									<xsl:for-each select="tns:WysylkaZ">
										<xsl:text>Kod kraju: </xsl:text>
										<xsl:if test="tns:AdresPol/tns:KodKraju">
											<xsl:apply-templates select="tns:AdresPol/tns:KodKraju"/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:KodKraju">
											<xsl:apply-templates select="tns:AdresZagr/tns:KodKraju"/>
										</xsl:if>
										<xsl:text>; </xsl:text>
										<br/>
										<xsl:if test="tns:AdresPol/tns:Wojewodztwo">
											<xsl:value-of select="tns:AdresPol/tns:Wojewodztwo"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:Powiat">
											<xsl:value-of select="tns:AdresPol/tns:Powiat"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:Gmina">
											<xsl:value-of select="tns:AdresPol/tns:Gmina"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:text>Miejscowość: </xsl:text>
										<xsl:if test="tns:AdresPol/tns:Miejscowosc">
											<xsl:value-of select="tns:AdresPol/tns:Miejscowosc"/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:Miejscowosc">
											<xsl:value-of select="tns:AdresZagr/tns:Miejscowosc"/>
										</xsl:if>
										<xsl:text>; </xsl:text>
										<br/>
										<xsl:if test="tns:AdresPol/tns:Ulica">
											<xsl:text>Ulica: </xsl:text>
											<xsl:value-of select="tns:AdresPol/tns:Ulica"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:Ulica">
											<xsl:text>Ulica: </xsl:text>
											<xsl:value-of select="tns:AdresZagr/tns:Ulica"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:NrDomu">
											<xsl:value-of select="tns:AdresPol/tns:NrDomu"/>
											<xsl:if test="tns:AdresPol/tns:NrLokalu">
												<xsl:text>/</xsl:text>
												<xsl:value-of select="tns:AdresPol/tns:NrLokalu"/>
											</xsl:if>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:NrDomu">
											<xsl:value-of select="tns:AdresZagr/tns:NrDomu"/>
											<xsl:if test="tns:AdresZagr/tns:NrLokalu">
												<xsl:text>/</xsl:text>
												<xsl:value-of select="tns:AdresZagr/tns:NrLokalu"/>
											</xsl:if>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:KodPocztowy">
											<xsl:text>Kod pocztowy: </xsl:text>
											<xsl:value-of select="tns:AdresPol/tns:KodPocztowy"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:KodPocztowy">
											<xsl:text>Kod pocztowy: </xsl:text>
											<xsl:value-of select="tns:AdresZagr/tns:KodPocztowy"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:Poczta">
											<xsl:text>Poczta: </xsl:text>
											<xsl:value-of select="tns:AdresPol/tns:Poczta"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:GLN">
											<xsl:text>GLN: </xsl:text>
											<xsl:value-of select="tns:AdresPol/tns:GLN"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:GLN">
											<xsl:text>GLN: </xsl:text>
											<xsl:value-of select="tns:AdresZagr/tns:GLN"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
								<td class="wypelniane" width="auto">
									<xsl:for-each select="tns:WysylkaPrzez">
										<b>
											<xsl:text>Kod kraju </xsl:text>
											<xsl:number value="position()" format="(1)"/>:
										</b>
										<xsl:if test="tns:AdresPol/tns:KodKraju">
											<xsl:apply-templates select="tns:AdresPol/tns:KodKraju"/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:KodKraju">
											<xsl:apply-templates select="tns:AdresZagr/tns:KodKraju"/>
										</xsl:if>
										<xsl:text>; </xsl:text>
										<br/>
										<xsl:if test="tns:AdresPol/tns:Wojewodztwo">
											<xsl:value-of select="tns:AdresPol/tns:Wojewodztwo"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:Powiat">
											<xsl:value-of select="tns:AdresPol/tns:Powiat"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:Gmina">
											<xsl:value-of select="tns:AdresPol/tns:Gmina"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:text>Miejscowość: </xsl:text>
										<xsl:if test="tns:AdresPol/tns:Miejscowosc">
											<xsl:value-of select="tns:AdresPol/tns:Miejscowosc"/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:Miejscowosc">
											<xsl:value-of select="tns:AdresZagr/tns:Miejscowosc"/>
										</xsl:if>
										<xsl:text>; </xsl:text>
										<br/>
										<xsl:if test="tns:AdresPol/tns:Ulica">
											<xsl:text>Ulica: </xsl:text>
											<xsl:value-of select="tns:AdresPol/tns:Ulica"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:Ulica">
											<xsl:text>Ulica: </xsl:text>
											<xsl:value-of select="tns:AdresZagr/tns:Ulica"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:NrDomu">
											<xsl:value-of select="tns:AdresPol/tns:NrDomu"/>
											<xsl:if test="tns:AdresPol/tns:NrLokalu">
												<xsl:text>/</xsl:text>
												<xsl:value-of select="tns:AdresPol/tns:NrLokalu"/>
											</xsl:if>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:NrDomu">
											<xsl:value-of select="tns:AdresZagr/tns:NrDomu"/>
											<xsl:if test="tns:AdresZagr/tns:NrLokalu">
												<xsl:text>/</xsl:text>
												<xsl:value-of select="tns:AdresZagr/tns:NrLokalu"/>
											</xsl:if>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:KodPocztowy">
											<xsl:text>Kod pocztowy: </xsl:text>
											<xsl:value-of select="tns:AdresPol/tns:KodPocztowy"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:KodPocztowy">
											<xsl:text>Kod pocztowy: </xsl:text>
											<xsl:value-of select="tns:AdresZagr/tns:KodPocztowy"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:Poczta">
											<xsl:text>Poczta: </xsl:text>
											<xsl:value-of select="tns:AdresPol/tns:Poczta"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:GLN">
											<xsl:text>GLN: </xsl:text>
											<xsl:value-of select="tns:AdresPol/tns:GLN"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:GLN">
											<xsl:text>GLN: </xsl:text>
											<xsl:value-of select="tns:AdresZagr/tns:GLN"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
								<td class="wypelniane" width="auto">
									<xsl:for-each select="tns:WysylkaDo">
										<xsl:text>Kod kraju: </xsl:text>
										<xsl:if test="tns:AdresPol/tns:KodKraju">
											<xsl:apply-templates select="tns:AdresPol/tns:KodKraju"/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:KodKraju">
											<xsl:apply-templates select="tns:AdresZagr/tns:KodKraju"/>
										</xsl:if>
										<xsl:text>; </xsl:text>
										<br/>
										<xsl:if test="tns:AdresPol/tns:Wojewodztwo">
											<xsl:value-of select="tns:AdresPol/tns:Wojewodztwo"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:Powiat">
											<xsl:value-of select="tns:AdresPol/tns:Powiat"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:Gmina">
											<xsl:value-of select="tns:AdresPol/tns:Gmina"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:text>Miejscowość: </xsl:text>
										<xsl:if test="tns:AdresPol/tns:Miejscowosc">
											<xsl:value-of select="tns:AdresPol/tns:Miejscowosc"/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:Miejscowosc">
											<xsl:value-of select="tns:AdresZagr/tns:Miejscowosc"/>
										</xsl:if>
										<xsl:text>; </xsl:text>
										<br/>
										<xsl:if test="tns:AdresPol/tns:Ulica">
											<xsl:text>Ulica: </xsl:text>
											<xsl:value-of select="tns:AdresPol/tns:Ulica"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:Ulica">
											<xsl:text>Ulica: </xsl:text>
											<xsl:value-of select="tns:AdresZagr/tns:Ulica"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:NrDomu">
											<xsl:value-of select="tns:AdresPol/tns:NrDomu"/>
											<xsl:if test="tns:AdresPol/tns:NrLokalu">
												<xsl:text>/</xsl:text>
												<xsl:value-of select="tns:AdresPol/tns:NrLokalu"/>
											</xsl:if>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:NrDomu">
											<xsl:value-of select="tns:AdresZagr/tns:NrDomu"/>
											<xsl:if test="tns:AdresZagr/tns:NrLokalu">
												<xsl:text>/</xsl:text>
												<xsl:value-of select="tns:AdresZagr/tns:NrLokalu"/>
											</xsl:if>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:KodPocztowy">
											<xsl:text>Kod pocztowy: </xsl:text>
											<xsl:value-of select="tns:AdresPol/tns:KodPocztowy"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:KodPocztowy">
											<xsl:text>Kod pocztowy: </xsl:text>
											<xsl:value-of select="tns:AdresZagr/tns:KodPocztowy"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:Poczta">
											<xsl:text>Poczta: </xsl:text>
											<xsl:value-of select="tns:AdresPol/tns:Poczta"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresPol/tns:GLN">
											<xsl:text>GLN: </xsl:text>
											<xsl:value-of select="tns:AdresPol/tns:GLN"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:GLN">
											<xsl:text>GLN: </xsl:text>
											<xsl:value-of select="tns:AdresZagr/tns:GLN"/>
											<xsl:text>; </xsl:text>
											<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
						<br/>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="tns:PodmiotPosredniczacy = '1'">
					<div>Dostawa dokonana przez podmiot, o którym mowa w art. 22 ust. 2d ustawy:
						<input type="checkbox" checked="checked" disabled="disabled"/>
						<b>1. Tak</b>
					</div>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<br/>
	</xsl:template>
	<xsl:template name="Zamowienie">
		<xsl:if test="tns:Fa/tns:Zamowienie">
			<b>Zamówienie</b>
			<br/>
			<br/>
			<xsl:for-each select="tns:Fa/tns:Zamowienie">
				<div>Liczba wierszy zamówienia lub umowy:
					<b>
						<xsl:value-of select="tns:LiczbaWierszyZamowienia"/>
					</b>
				</div>
				<br/>
				<div>Wartość zamówienia lub umowy z uwzględnieniem kwoty podatku:
					<b>
						<xsl:value-of select="tns:WartoscZamowienia"/>
					</b>
				</div>
				<br/>
				<b>Szczegółowe pozycje zamówienia lub umowy w walucie, w której wystawiono fakturę zaliczkową</b>
				<br/>
				<br/>
				<br/>
				<table class="white-space">
					<tr>
						<td class="niewypelniane">Numer wiersza zamó-<br/>wienia lub umowy</td>
						<td class="niewypelniane">Uniwersalny unikalny numer wiersza zamówienia</td>
						<td class="niewypelniane">Nazwa (rodzaj) towaru lub usług</td>
						<td class="niewypelniane">Jednostka miary zamówionego towaru lub zakres usługi</td>
						<td class="niewypelniane">Ilość zamówionego towaru lub zakres usługi</td>
						<td class="niewypelniane">Cena jednostkowa netto</td>
						<td class="niewypelniane">Wartość sprzedaży netto zamówionego towaru lub zakres usługi</td>
						<td class="niewypelniane">Kwota podatku od zamówionego towaru lub usługi</td>
						<td class="niewypelniane">Stawka podatku</td>
						<td class="niewypelniane">Stawka podatku od wartości dodanej</td>
						<td class="niewypelniane">Klasyfikacja</td>
						<td class="niewypelniane">Dodatkowe informacje</td>
						<td class="niewypelniane">Wskazanie procedury dla wiersza zamówienia</td>
						<td class="niewypelniane">Kwota podatku akcy-<br/>zowego zawarta w cenie towaru</td>
						<td class="niewypelniane">Oznaczenie dotyczące dostawy towarów i świadczenia usług lub procedury</td>
						<td class="niewypelniane">Kurs waluty, z art. 31a ustawy</td>
					</tr>
					<xsl:for-each select="tns:ZamowienieWiersz">
						<tr>
							<td class="srodek">
								<xsl:value-of select="tns:NrWierszaZam"/>
							</td>
							<td class="srodek">
								<xsl:value-of select="tns:UU_IDZ"/>
							</td>
							<td class="srodek">
								<xsl:value-of select="tns:P_7Z"/>
							</td>
							<td class="srodek">
								<xsl:value-of select="tns:P_8AZ"/>
							</td>
							<td class="prawa">
								<xsl:value-of select="tns:P_8BZ"/>
							</td>
							<td class="prawa">
								<xsl:value-of select="tns:P_9AZ"/>
							</td>
							<td class="prawa">
								<xsl:value-of select="tns:P_11NettoZ"/>
							</td>
							<td class="prawa">
								<xsl:value-of select="tns:P_11VatZ"/>
							</td>
							<td class="srodek">
								<xsl:choose>
									<xsl:when test="tns:P_12Z = '23'">
										<xsl:text>23%</xsl:text>
									</xsl:when>
									<xsl:when test="tns:P_12Z = '22'">
										<xsl:text>22%</xsl:text>
									</xsl:when>
									<xsl:when test="tns:P_12Z = '8'">
										<xsl:text>8%</xsl:text>
									</xsl:when>
									<xsl:when test="tns:P_12Z = '7'">
										<xsl:text>7%</xsl:text>
									</xsl:when>
									<xsl:when test="tns:P_12Z = '5'">
										<xsl:text>5%</xsl:text>
									</xsl:when>
									<xsl:when test="tns:P_12Z = '4'">
										<xsl:text>4%</xsl:text>
									</xsl:when>
									<xsl:when test="tns:P_12Z = '3'">
										<xsl:text>3%</xsl:text>
									</xsl:when>
									<xsl:when test="tns:P_12Z = '0'">
										<xsl:text>0%</xsl:text>
									</xsl:when>
									<xsl:when test="tns:P_12Z = 'zw'">
										<xsl:text>zw</xsl:text>
									</xsl:when>
									<xsl:when test="tns:P_12Z = 'oo'">
										<xsl:text>oo</xsl:text>
									</xsl:when>
									<xsl:when test="tns:P_12Z = 'np'">
										<xsl:text>np</xsl:text>
									</xsl:when>
								</xsl:choose>
							</td>
							<td class="srodek">
								<xsl:if test="tns:P_12Z_XII">
									<xsl:value-of select="tns:P_12Z_XII"/>%
								</xsl:if>
							</td>
							<td class="lewa">
								<xsl:if test="tns:GTINZ">
									GTIN:
									<xsl:value-of select="tns:GTINZ"/>;
								</xsl:if>
								<xsl:if test="tns:PKWiUZ">
									<xsl:if test="tns:GTINZ">
										<br/>
									</xsl:if>
									PKWiU:
									<xsl:value-of select="tns:PKWiUZ"/>;
								</xsl:if>
								<xsl:if test="tns:CNZ">
									<xsl:if test="tns:GTINZ|tns:PKWiUZ">
										<br/>
									</xsl:if>
									CN:
									<xsl:value-of select="tns:CNZ"/>;
								</xsl:if>
								<xsl:if test="tns:PKOBZ">
									<xsl:if test="tns:GTINZ|tns:PKWiUZ|tns:CNZ">
										<br/>
									</xsl:if>
									PKOB:
									<xsl:value-of select="tns:PKOBZ"/>;
								</xsl:if>
							</td>
							<td class="lewa">
								<xsl:value-of select="tns:DodatkoweInfoZ"/>
							</td>
							<td class="srodek">
								<xsl:choose>
									<xsl:when test="tns:P_12Z_Procedura = '1'">
										<xsl:text>Stawka 0% stosowana w ramach sprzedaży krajowej</xsl:text>
									</xsl:when>
									<xsl:when test="tns:P_12Z_Procedura = '3'">
										<xsl:text>Stawka 0% - eksport towarów</xsl:text>
									</xsl:when>
									<xsl:when test="tns:P_12Z_Procedura = '4'">
										<xsl:text>Dostawa towarów oraz świadczenie usług opodatkowane poza terytorium kraju</xsl:text>
									</xsl:when>
									<xsl:when test="tns:P_12Z_Procedura = '5'">
										<xsl:text>Świadczenie usług z art. 100 ust. 1 pkt 4 ustawy</xsl:text>
									</xsl:when>
									<xsl:when test="tns:P_12Z_Procedura= '6'">
										<xsl:text>Towar/usługa wymienione w załączniku 15</xsl:text>
									</xsl:when>
									<xsl:when test="tns:P_12Z_Procedura = '7'">
										<xsl:text>Pozostała sprzedaż krajowa</xsl:text>
									</xsl:when>
								</xsl:choose>
							</td>
							<td class="prawa">
								<xsl:value-of select="tns:KwotaAkcyzyZ"/>
							</td>
							<td class="srodek">
								<xsl:if test="tns:GTUZ">
									<xsl:value-of select="tns:GTUZ"/>
								</xsl:if>
								<xsl:if test="tns:ProceduraZ">
									<br/>
									<xsl:value-of select="tns:ProceduraZ"/>
								</xsl:if>
							</td>
							<td class="prawa">
								<xsl:value-of select="tns:KursWalutyZ"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:for-each>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="PrzyczynaKorekty">
		<xsl:for-each select="tns:Fa">
			<xsl:if test="tns:PrzyczynaKorekty|tns:TypKorekty|tns:DaneFaKorygowanej|tns:OkresFaKorygowanej|tns:NrFaKorygowany|tns:Podmiot1K|tns:Podmiot2K">
				<b>Korekta</b>
				<br/>
				<br/>
				<xsl:if test="tns:PrzyczynaKorekty">
					<table class="break-word" width="100%">
						<tr>
							<td class="niewypelniane" width="25%">Przyczyna korekty dla faktur korygujących</td>
							<td class="wypelniane" width="75%">
								<xsl:value-of select="tns:PrzyczynaKorekty"/>
							</td>
						</tr>
					</table>
					<br/>
				</xsl:if>
				<xsl:if test="tns:TypKorekty">
					<table width="100%">
						<tr>
							<td class="niewypelniane" width="25%">Typ skutku korekty w ewidencji</td>
							<td class="wypelniane" width="75%">
								<xsl:choose>
									<xsl:when test="tns:TypKorekty = '1'">
										<xsl:text>Korekta skutkująca w dacie ujęcia faktury pierwotnej</xsl:text>
									</xsl:when>
									<xsl:when test="tns:TypKorekty = '2'">
										<xsl:text>Korekta skutkująca w dacie wystawienia faktury korygującej</xsl:text>
									</xsl:when>
									<xsl:when test="tns:TypKorekty = '3'">
										<xsl:text>Korekta skutkująca w dacie innej, w tym gdy dla różnych pozycji faktury korygującej daty te są różne</xsl:text>
									</xsl:when>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<br/>
				</xsl:if>
				<xsl:if test="tns:OkresFaKorygowanej">
					<table class="break-word">
						<tr>
							<td class="niewypelniane" width="25%">Dla faktury korygującej, o której mowa w art. 106j ust. 3 ustawy - okres, do którego odnosi się udzielany opust lub obniżka, w przypadku gdy podatnik udziela opustu lub obniżki ceny w odniesieniu do dostaw towarów lub usług dokonanych lub świadczonych na rzecz jednego odbiorcy w danym okresie</td>
							<td class="wypelniane" width="75%">
								<xsl:value-of select="tns:OkresFaKorygowanej"/>
							</td>
						</tr>
					</table>
					<br/>
				</xsl:if>
				<xsl:if test="tns:NrFaKorygowany">
					<table class="break-word">
						<tr>
							<td class="niewypelniane" width="25%">Poprawny numer faktury korygowanej w przypadku, gdy przyczyną korekty jest błędny numer faktury korygowanej. W polu NrFaKorygowanej należy wówczas wskazać ten błędny numer</td>
							<td class="wypelniane" width="75%">
								<xsl:value-of select="tns:NrFaKorygowany"/>
							</td>
						</tr>
					</table>
					<br/>
				</xsl:if>
				<xsl:if test="tns:Podmiot1K">
					<xsl:for-each select="tns:Podmiot1K">
						<table>
							<tr>
								<td class="niewypelniane">Dane sprzedawcy występujące w fakturze korygowanej</td>
							</tr>
						</table>
						<table class="break-word">
							<tr>
								<td class="niewypelniane" width="7">Kod (prefiks) podatnika VAT UE</td>
								<td class="niewypelniane" width="7">Identyfikator podatkowy NIP</td>
								<td class="niewypelniane" width="15">Pierwsze imię</td>
								<td class="niewypelniane" width="15">Nazwisko</td>
								<td class="niewypelniane" width="28">Pełna nazwa</td>
								<td class="niewypelniane" width="28">Nazwa handlowa</td>
							</tr>
							<tr>
								<td class="srodek" width="7">
									<xsl:value-of select="tns:PrefiksPodatnika"/>
								</td>
								<xsl:for-each select="tns:DaneIdentyfikacyjne">
									<td class="srodek" width="7">
										<xsl:value-of select="tns:NIP"/>
									</td>
									<td class="lewa" width="15">
										<xsl:if test="tns:ImiePierwsze">
											<xsl:value-of select="tns:ImiePierwsze"/>
										</xsl:if>
									</td>
									<td class="lewa" width="15">
										<xsl:if test="tns:Nazwisko">
											<xsl:value-of select="tns:Nazwisko"/>
										</xsl:if>
									</td>
									<td class="lewa" width="28">
										<xsl:if test="tns:PelnaNazwa">
											<xsl:value-of select="tns:PelnaNazwa"/>
										</xsl:if>
									</td>
									<td class="lewa" width="28">
										<xsl:value-of select="tns:NazwaHandlowa"/>
									</td>
								</xsl:for-each>
							</tr>
						</table>
						<br/>
						<xsl:for-each select="tns:Adres">
							<table class="normalna">
								<tr>
									<td class="niewypelniane" width="25%" rowspan="10">Adres podatnika</td>
									<td class="wypelniane" width="75%">
										<xsl:if test="tns:AdresPol">
											<xsl:apply-templates select="tns:AdresPol/tns:KodKraju"/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr">
											<xsl:apply-templates select="tns:AdresZagr/tns:KodKraju"/>
										</xsl:if>
									</td>
								</tr>
								<xsl:if test="tns:AdresPol/tns:Wojewodztwo">
									<tr>
										<xsl:if test="tns:AdresPol/tns:Wojewodztwo">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:Wojewodztwo"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:Powiat">
									<tr>
										<xsl:if test="tns:AdresPol/tns:Powiat">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:Powiat"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:Gmina">
									<tr>
										<xsl:if test="tns:AdresPol/tns:Gmina">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:Gmina"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<tr>
									<td class="wypelniane" width="75%">
										<xsl:if test="tns:AdresPol">
											<xsl:value-of select="tns:AdresPol/tns:Miejscowosc"/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr">
											<xsl:value-of select="tns:AdresZagr/tns:Miejscowosc"/>
										</xsl:if>
									</td>
								</tr>
								<xsl:if test="tns:AdresPol/tns:Ulica|tns:AdresZagr/tns:Ulica">
									<tr>
										<xsl:if test="tns:AdresPol/tns:Ulica">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:Ulica"/>
											</td>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:Ulica">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresZagr/tns:Ulica"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:NrDomu|tns:AdresZagr/tns:NrDomu">
									<tr>
										<xsl:if test="tns:AdresPol/tns:NrDomu">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:NrDomu"/>
												<xsl:if test="tns:AdresPol/tns:NrLokalu">
													<xsl:text>/</xsl:text>
													<xsl:value-of select="tns:AdresPol/tns:NrLokalu"/>
												</xsl:if>
											</td>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:NrDomu">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresZagr/tns:NrDomu"/>
												<xsl:if test="tns:AdresZagr/tns:NrLokalu">
													<xsl:text>/</xsl:text>
													<xsl:value-of select="tns:AdresZagr/tns:NrLokalu"/>
												</xsl:if>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:KodPocztowy|tns:AdresZagr/tns:KodPocztowy">
									<tr>
										<xsl:if test="tns:AdresPol/tns:KodPocztowy">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:KodPocztowy"/>
											</td>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:KodPocztowy">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresZagr/tns:KodPocztowy"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:Poczta">
									<tr>
										<xsl:if test="tns:AdresPol/tns:Poczta">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:Poczta"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:GLN|tns:AdresZagr/tns:GLN">
									<tr>
										<xsl:if test="tns:AdresPol/tns:GLN">
											<td class="wypelniane" width="75%">
												<xsl:text>GLN: </xsl:text>
												<xsl:value-of select="tns:AdresPol/tns:GLN"/>
											</td>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:GLN">
											<td class="wypelniane" width="75%">
												<xsl:text>GLN: </xsl:text>
												<xsl:value-of select="tns:AdresZagr/tns:GLN"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:NazwaHandlowa">
									<tr>
										<td class="wypelniane" width="75%">
											<xsl:value-of select="tns:NazwaHandlowa"/>
										</td>
									</tr>
								</xsl:if>
							</table>
							<br/>
							<br/>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="tns:Podmiot2K">
					<xsl:for-each select="tns:Podmiot2K">
						<table>
							<tr>
								<td class="niewypelniane" colspan="6">Dane nabywcy występujące w fakturze korygowanej <xsl:number value="position()" format=" (1) "/>
								</td>
							</tr>
						</table>
						<table class="break-word">
							<tr>
								<td class="niewypelniane" width="7%">Kod (prefiks) nabywcy VAT</td>
								<td class="niewypelniane" width="7%">
									<xsl:if test="tns:DaneIdentyfikacyjne/tns:NIP">
										Identyfikator podatkowy NIP
									</xsl:if>
									<xsl:if test="tns:DaneIdentyfikacyjne/tns:NrID">
										Identyfikator podatkowy
									</xsl:if>
									<xsl:if test="tns:DaneIdentyfikacyjne/tns:BrakID = '1'">
										Brak identyfikatora podatkowego
									</xsl:if>
								</td>
								<td class="niewypelniane" width="15%">Pierwsze imię</td>
								<td class="niewypelniane" width="15%">Nazwisko</td>
								<td class="niewypelniane" width="28%">Pełna nazwa</td>
								<td class="niewypelniane" width="28%">Nazwa handlowa</td>
							</tr>
							<tr>
								<td class="srodek" width="7%">
									<xsl:if test="tns:PrefiksNabywcy">
										<xsl:value-of select="tns:PrefiksNabywcy"/>
									</xsl:if>
								</td>
								<td class="srodek" width="7%">
									<xsl:if test="tns:DaneIdentyfikacyjne/tns:NIP">
										<xsl:value-of select="tns:DaneIdentyfikacyjne/tns:NIP"/>
									</xsl:if>
									<xsl:if test="tns:DaneIdentyfikacyjne/tns:NrID">
										<xsl:value-of select="tns:DaneIdentyfikacyjne/tns:NrID"/>
									</xsl:if>
									<xsl:if test="tns:DaneIdentyfikacyjne/tns:BrakID = '1'">
										Podmiot nie posiada identyfikatora podatkowego
									</xsl:if>
								</td>
								<td class="lewa" width="15%">
									<xsl:if test="tns:DaneIdentyfikacyjne/tns:ImiePierwsze">
										<xsl:value-of select="tns:DaneIdentyfikacyjne/tns:ImiePierwsze"/>
									</xsl:if>
								</td>
								<td class="lewa" width="15%">
									<xsl:if test="tns:DaneIdentyfikacyjne/tns:Nazwisko">
										<xsl:value-of select="tns:DaneIdentyfikacyjne/tns:Nazwisko"/>
									</xsl:if>
								</td>
								<td class="lewa" width="28%">
									<xsl:if test="tns:DaneIdentyfikacyjne/tns:PelnaNazwa">
										<xsl:value-of select="tns:DaneIdentyfikacyjne/tns:PelnaNazwa"/>
									</xsl:if>
								</td>
								<td class="lewa" width="28%">
									<xsl:if test="tns:DaneIdentyfikacyjne/tns:NazwaHandlowa">
										<xsl:value-of select="tns:DaneIdentyfikacyjne/tns:NazwaHandlowa"/>
									</xsl:if>
								</td>
							</tr>
						</table>
						<br/>
						<xsl:for-each select="tns:Adres">
							<table class="normalna">
								<tr>
									<td class="niewypelniane" width="25%" rowspan="10">Adres nabywcy</td>
									<td class="wypelniane" width="75%">
										<xsl:if test="tns:AdresPol">
											<xsl:apply-templates select="tns:AdresPol/tns:KodKraju"/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr">
											<xsl:apply-templates select="tns:AdresZagr/tns:KodKraju"/>
										</xsl:if>
									</td>
								</tr>
								<xsl:if test="tns:AdresPol/tns:Wojewodztwo">
									<tr>
										<xsl:if test="tns:AdresPol/tns:Wojewodztwo">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:Wojewodztwo"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:Powiat">
									<tr>
										<xsl:if test="tns:AdresPol/tns:Powiat">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:Powiat"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:Gmina">
									<tr>
										<xsl:if test="tns:AdresPol/tns:Gmina">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:Gmina"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<tr>
									<td class="wypelniane" width="75%">
										<xsl:if test="tns:AdresPol">
											<xsl:value-of select="tns:AdresPol/tns:Miejscowosc"/>
										</xsl:if>
										<xsl:if test="tns:AdresZagr">
											<xsl:value-of select="tns:AdresZagr/tns:Miejscowosc"/>
										</xsl:if>
									</td>
								</tr>
								<xsl:if test="tns:AdresPol/tns:Ulica|tns:AdresZagr/tns:Ulica">
									<tr>
										<xsl:if test="tns:AdresPol/tns:Ulica">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:Ulica"/>
											</td>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:Ulica">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresZagr/tns:Ulica"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:NrDomu|tns:AdresZagr/tns:NrDomu">
									<tr>
										<xsl:if test="tns:AdresPol/tns:NrDomu">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:NrDomu"/>
												<xsl:if test="tns:AdresPol/tns:NrLokalu">
													<xsl:text> / </xsl:text>
													<xsl:value-of select="tns:AdresPol/tns:NrLokalu"/>
												</xsl:if>
											</td>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:NrDomu">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresZagr/tns:NrDomu"/>
												<xsl:if test="tns:AdresZagr/tns:NrLokalu">
													<xsl:text> / </xsl:text>
													<xsl:value-of select="tns:AdresZagr/tns:NrLokalu"/>
												</xsl:if>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:KodPocztowy|tns:AdresZagr/tns:KodPocztowy">
									<tr>
										<xsl:if test="tns:AdresPol/tns:KodPocztowy">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:KodPocztowy"/>
											</td>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:KodPocztowy">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresZagr/tns:KodPocztowy"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:Poczta">
									<tr>
										<xsl:if test="tns:AdresPol/tns:Poczta">
											<td class="wypelniane" width="75%">
												<xsl:value-of select="tns:AdresPol/tns:Poczta"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:AdresPol/tns:GLN|tns:AdresZagr/tns:GLN">
									<tr>
										<xsl:if test="tns:AdresPol/tns:GLN">
											<td class="wypelniane" width="75%">
												<xsl:text>GLN: </xsl:text>
												<xsl:value-of select="tns:AdresPol/tns:GLN"/>
											</td>
										</xsl:if>
										<xsl:if test="tns:AdresZagr/tns:GLN">
											<td class="wypelniane" width="75%">
												<xsl:text>GLN: </xsl:text>
												<xsl:value-of select="tns:AdresZagr/tns:GLN"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:if>
								<xsl:if test="tns:NazwaHandlowa">
									<tr>
										<td class="wypelniane" width="75%">
											<xsl:value-of select="tns:NazwaHandlowa"/>
										</td>
									</tr>
								</xsl:if>
							</table>
							<br/>
							<br/>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="NoweSrodkiTransportu">
	</xsl:template>
	<xsl:template name="DodatkowyOpis">
		<xsl:if test="tns:Fa/tns:DodatkowyOpis">
			<table>
				<b>Dodatkowy opis</b>
				<br/>
			</table>
			<br/>
			<xsl:for-each select="tns:Fa/tns:DodatkowyOpis">
				<table class="break-word">
					<tr>
						<td>
							<xsl:value-of select="tns:Klucz"/>
							<xsl:text>: </xsl:text>
							<xsl:value-of select="tns:Wartosc"/>
						</td>
					</tr>
				</table>
			</xsl:for-each>
			<br/>
			<xsl:for-each select="tns:Fa/tns:NrFaZaliczkowej">
				<table class="break-word">
					<tr>
						<td>Numer faktury zaliczkowej<xsl:number value="position()" format=" (1) "/>- <b>
							<xsl:value-of select="."/>
						</b>
						</td>
					</tr>
				</table>
			</xsl:for-each>
			<br/>
			<xsl:if test="tns:Fa/tns:ZwrotAkcyzy = '1'">
				<div>
					Zwrot akcyzy:
					<b>
						<input type="checkbox" checked="checked" disabled="disabled"/>
						1. Tak
					</b>
				</div>
				<br/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="WZ">
		<xsl:if test="tns:Fa/tns:WZ">
			<table>
				<tr>
					<td>
						<b>Numery dokumentów magazynowych WZ (wydanie na zewnątrz) związane z fakturą</b>
					</td>
				</tr>
			</table>
			<br/>
			<table class="break-word">
				<tr>
					<td class="niewypelniane" width="10%">Lp.</td>
					<td class="niewypelniane" width="90%">Numer WZ</td>
				</tr>
				<xsl:for-each select="tns:Fa/tns:WZ">
					<tr>
						<td class="niewypelniane" width="10%">
							<xsl:number value="position()" format="1. "/>
						</td>
						<td class="wypelniane" width="90%">
							<xsl:value-of select="."/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
		<br/>
	</xsl:template>
	<xsl:template name="Stopka">
		<xsl:if test="tns:Stopka">
			<div>
				<b>Pozostałe informacje na fakturze</b>
			</div>
			<br/>
			<xsl:for-each select="tns:Stopka/tns:Informacje">
				<table class="break-word">
					<tr>
						<td>
							<xsl:value-of select="tns:StopkaFaktury"/>
						</td>
					</tr>
				</table>
				<br/>
			</xsl:for-each>
			<div>
				<b>Numery podmiotu w innych rejestrach i bazach danych</b>
			</div>
			<br/>
			<xsl:for-each select="tns:Stopka/tns:Rejestry">
				<table class="break-word">
					<tr>
						<td class="niewypelniane" colspan="2">
							<xsl:number value="position()" format=" (1) "/>
							<xsl:value-of select="tns:PelnaNazwa"/>
						</td>
					</tr>
				</table>
				<table class="break-word">
					<tr>
						<td class="niewypelniane" width="30%">Numer Krajowego Rejestru Sądowego </td>
						<td class="wypelniane" width="70%">
							<xsl:value-of select="tns:KRS"/>
						</td>
					</tr>
					<tr>
						<td class="niewypelniane" width="30%">REGON </td>
						<td class="wypelniane" width="70%">
							<xsl:value-of select="tns:REGON"/>
						</td>
					</tr>
					<tr>
						<td class="niewypelniane" width="30%">Numer w Bazie Danych o Odpadach </td>
						<td class="wypelniane" width="70%">
							<xsl:value-of select="tns:BDO"/>
						</td>
					</tr>
				</table>
				<br/>
			</xsl:for-each>
			<br/>
			<div align="center">
				<a href="https://www.gov.pl/web/kas/krajowy-system-e-faktur">
					<b>Krajowy System <font style="color:red">e</font>-Faktur</b>
				</a>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
