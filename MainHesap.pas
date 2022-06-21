unit MainHesap;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.MultiView, FMX.StdCtrls, FMX.ListBox,
  FMX.Layouts, FMX.TabControl, FMX.Header, FMX.Edit, FMX.ComboEdit, FMX.EditBox,
  FMX.ComboTrackBar, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.SearchBox, FMX.Ani, FMX.Effects,
  FMX.Filter.Effects;

type
  TForm2 = class(TForm)
    recVizeFinal: TRectangle;
    TabControl1: TTabControl;
    tabVizeFinal: TTabItem;
    tabFaiz: TTabItem;
    MultiView2: TMultiView;
    recFaiz: TRectangle;
    Layout1: TLayout;
    lblHeader: TLabel;
    Layout2: TLayout;
    lblVize: TLabel;
    editVize: TEdit;
    Layout3: TLayout;
    editFinal: TEdit;
    lblFinal: TLabel;
    Layout4: TLayout;
    lblOrtYazisi: TLabel;
    lblOrtalama: TLabel;
    tabYas: TTabItem;
    recYas: TRectangle;
    Layout5: TLayout;
    Label1: TLabel;
    Layout6: TLayout;
    Label2: TLabel;
    editAnaPara: TEdit;
    Layout7: TLayout;
    Layout8: TLayout;
    Label4: TLabel;
    lblNetKazanc: TLabel;
    Layout10: TLayout;
    Label3: TLabel;
    combotrackVadeG�n: TComboTrackBar;
    Layout11: TLayout;
    Label6: TLabel;
    listboxBanka: TListBox;
    listitemAkbank: TListBoxItem;
    listitemCeptetep: TListBoxItem;
    listitemOdeabank: TListBoxItem;
    listitemYap�Kredi: TListBoxItem;
    tabGiris: TTabItem;
    recGiris: TRectangle;
    Timer1: TTimer;
    Label5: TLabel;
    Label7: TLabel;
    GlowEffect1: TGlowEffect;
    BandedSwirlTransitionEffect1: TBandedSwirlTransitionEffect;
    Rectangle1: TRectangle;
    btnMultiItemVize: TButton;
    btnMultiItemFaiz: TButton;
    btnMultiItemYas: TButton;
    procedure editVizeChangeTracking(Sender: TObject);
    procedure editFinalChangeTracking(Sender: TObject);
    procedure editAnaParaChangeTracking(Sender: TObject);
    procedure combotrackVadeG�nChangeTracking(Sender: TObject);
    procedure listboxBankaItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure listboxBankaChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnMultiItemVizeClick(Sender: TObject);
    procedure btnMultiItemFaizClick(Sender: TObject);
    procedure btnMultiItemYasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    faizOran�: Double;
  end;

var
  Form2: TForm2;
  Second : Integer;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

// ortalama hesaplama fonksiyonu
function ort(vize: Integer; finall: Integer): Double;
begin
  Result := vize * 0.4 + finall * 0.6;
end;

function FaizHesapla(anaPara: Integer; faizOran�: Double;
  gunSayisi: Integer): Double;
begin
  // G�nl�k Faiz Getirisi = (Anapara / 100) x (Faiz Oran� / 365) x G�n Say�s�
  // Ayl�k Faiz Getirisi = (Anapara / 100) x (Faiz Oran� / 12) x Ay Say�s�
  // Y�ll�k Faiz Getirisi = (Anapara / 100) x (Faiz Oran�) x Y�l Say�s�

  Result := ((anaPara / 100) * faizOran�) * gunSayisi;
end;

procedure TForm2.btnMultiItemFaizClick(Sender: TObject);
begin
TabControl1.ActiveTab := tabFaiz;
end;

procedure TForm2.btnMultiItemVizeClick(Sender: TObject);
begin
     TabControl1.ActiveTab := tabVizeFinal;
end;

procedure TForm2.btnMultiItemYasClick(Sender: TObject);
begin
TabControl1.ActiveTab := tabYas;
end;

procedure TForm2.combotrackVadeG�nChangeTracking(Sender: TObject);
begin


  if editAnaPara.Text <> '' then
  begin
    lblNetKazanc.Text := FaizHesapla(editAnaPara.Text.ToInteger, faizOran�,
      combotrackVadeG�n.Text.ToInteger).ToString;
  end;
end;

procedure TForm2.editAnaParaChangeTracking(Sender: TObject);
begin


  if editAnaPara.Text <> '' then
  begin
    lblNetKazanc.Text := FaizHesapla(editAnaPara.Text.ToInteger, faizOran�,
      combotrackVadeG�n.Text.ToInteger).ToString;
  end;

end;

procedure TForm2.editFinalChangeTracking(Sender: TObject);
begin

  if (editVize.Text <> '') and (editFinal.Text <> '') then
  begin
    lblOrtalama.Text := ort(editVize.Text.ToInteger,
      editFinal.Text.ToInteger).ToString;
  end;
end;

procedure TForm2.editVizeChangeTracking(Sender: TObject);
begin

  if (editVize.Text <> '') and (editFinal.Text <> '') then
  begin
    lblOrtalama.Text := ort(editVize.Text.ToInteger,
      editFinal.Text.ToInteger).ToString;
  end;

end;

procedure TForm2.listboxBankaChange(Sender: TObject);
begin
     if listitemAkbank.IsSelected then
     begin
          faizOran� := 19.5 / 100;
     end
     else if listitemCeptetep.IsSelected then
     begin
          faizOran� := 19.5 / 100;
     end
     else if listitemOdeabank.IsSelected then
     begin
          faizOran� := 22.5 / 100;
     end
     else if listitemYap�Kredi.IsSelected then
     begin
          faizOran� := 14.5 / 100;
     end;

     if editAnaPara.Text <> '' then
  begin
    lblNetKazanc.Text := FaizHesapla(editAnaPara.Text.ToInteger, faizOran�,
      combotrackVadeG�n.Text.ToInteger).ToString;
  end;
end;

procedure TForm2.listboxBankaItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
    if listitemAkbank.IsSelected then
     begin
          faizOran� := 19.5 / 100;
     end
     else if listitemCeptetep.IsSelected then
     begin
          faizOran� := 19.5 / 100;
     end
     else if listitemOdeabank.IsSelected then
     begin
          faizOran� := 22.5 / 100;
     end
     else if listitemYap�Kredi.IsSelected then
     begin
          faizOran� := 14.5 / 100;
     end;

     if editAnaPara.Text <> '' then
  begin
    lblNetKazanc.Text := FaizHesapla(editAnaPara.Text.ToInteger, faizOran�,
      combotrackVadeG�n.Text.ToInteger).ToString;
  end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
     Second := Second + 1;

     case Second of
     0 :    BandedSwirlTransitionEffect1.Strength := 0.9;
     1 :    BandedSwirlTransitionEffect1.Strength := 0.8;
     2 :    BandedSwirlTransitionEffect1.Strength := 0.7;
     3 :    BandedSwirlTransitionEffect1.Strength := 0.6;
     4 :    BandedSwirlTransitionEffect1.Strength := 0.5;
     5 :    BandedSwirlTransitionEffect1.Strength := 0.4;
     6 :    BandedSwirlTransitionEffect1.Strength := 0.3;
     7 :    BandedSwirlTransitionEffect1.Strength := 0.2;
     8 :    BandedSwirlTransitionEffect1.Strength := 0.1;
     9 :    BandedSwirlTransitionEffect1.Strength := 0;

     end;

     if Second = 20 then
     begin
          Timer1.Enabled := false;
          TabControl1.ActiveTab := tabVizeFinal;
          

     end;
end;

end.
