unit controller;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.MultiView, FMX.StdCtrls, FMX.ListBox,
  FMX.Layouts, FMX.TabControl, FMX.Header, FMX.Edit, FMX.ComboEdit, FMX.EditBox,
  FMX.ComboTrackBar, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.SearchBox, FMX.Ani, FMX.Effects,
  FMX.Filter.Effects, FMX.DateTimeCtrls, System.ImageList, FMX.ImgList;


// FUNCTION TANIMLAMALARI

function ort(vize: Integer; finall: Integer): Double;

function FaizHesapla(anaPara: Integer; faizOraný: Double;
  gunSayisi: Integer): Double;

function KareCevreHesapla(kenar1: Integer; kenar2: Integer; kenar3: Integer;
  kenar4: Integer): Double;

function KareAlanHesapla(taban: Integer; yükseklik: Integer): Double;

function DikdörtgenCevreHesapla(kýsaKenar: Integer; uzunKenar: Integer)
  : Integer;

function DaireCevreHesapla(yaricap: Integer; pi: Double = 3.14): Double;

function UcgenCevreHesapla(kenar1: Integer; kenar2: Integer;
  kenar3: Integer): Integer;

function FaizOranýYüzdesi(bankName: String): Double;

//
implementation

// FUNCTION OVERLOADLARI


// ortalama hesaplama fonksiyonu

function ort(vize: integer; finall: integer): Double;
begin
  Result := vize * 0.4 + finall * 0.6;
end;

function FaizHesapla(anaPara: Integer; faizOraný: Double;
  gunSayisi: Integer): Double;
begin
  // Günlük Faiz Getirisi = (Anapara / 100) x (Faiz Oraný / 365) x Gün Sayýsý
  // Aylýk Faiz Getirisi = (Anapara / 100) x (Faiz Oraný / 12) x Ay Sayýsý
  // Yýllýk Faiz Getirisi = (Anapara / 100) x (Faiz Oraný) x Yýl Sayýsý

  Result := ((anaPara / 100) * faizOraný) * gunSayisi;
end;

function KareCevreHesapla(kenar1: Integer; kenar2: Integer; kenar3: Integer;
  kenar4: Integer): Double;
begin
  Result := kenar1 + kenar2 + kenar3 + kenar4;
end;

function KareAlanHesapla(taban: Integer; yükseklik: Integer): Double;
begin
  Result := taban * yükseklik;
end;

function DikdörtgenCevreHesapla(kýsaKenar: Integer; uzunKenar: Integer)
  : Integer;
begin
  Result := 2 * (kýsaKenar + uzunKenar);
end;

function DaireCevreHesapla(yaricap: Integer; pi: Double = 3.14): Double;
begin
  Result := 2 * yaricap * pi;
end;

function UcgenCevreHesapla(kenar1: Integer; kenar2: Integer;
  kenar3: Integer): Integer;
begin
  Result := kenar1 + kenar2 + kenar3;
end;

function FaizOranýYüzdesi(bankName: String): Double;
begin
  if bankName = 'Akbank' then
  begin
    Result := 19.5 / 100;
  end
  else if bankName = 'Ceptetep' then
  begin
    Result := 19.5 / 100;
  end
  else if bankName = 'Odeabank' then
  begin
    Result := 22.5 / 100;
  end
  else if bankName = 'Yapýkredi' then
  begin
    Result := 14.5 / 100;
  end;
end;

end.
