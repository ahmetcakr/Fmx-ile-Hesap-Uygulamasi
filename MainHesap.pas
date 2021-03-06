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
  FMX.Filter.Effects, FMX.DateTimeCtrls, System.ImageList, FMX.ImgList;

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
    combotrackVadeG?n: TComboTrackBar;
    Layout11: TLayout;
    Label6: TLabel;
    listboxBanka: TListBox;
    listitemAkbank: TListBoxItem;
    listitemCeptetep: TListBoxItem;
    listitemOdeabank: TListBoxItem;
    listitemYap?Kredi: TListBoxItem;
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
    DateEdit1: TDateEdit;
    Layout9: TLayout;
    Label8: TLabel;
    Layout12: TLayout;
    Label9: TLabel;
    lblYas: TLabel;
    tabHacim: TTabItem;
    recHacim: TRectangle;
    Layout13: TLayout;
    Layout14: TLayout;
    Layout15: TLayout;
    Label11: TLabel;
    comboHesapSekil: TComboBox;
    listKare: TListBoxItem;
    listDikd?rtgen: TListBoxItem;
    listUcgen: TListBoxItem;
    listDaire: TListBoxItem;
    btnMultiItemHacim: TButton;
    ImageList1: TImageList;
    Layout16: TLayout;
    Label12: TLabel;
    Layout17: TLayout;
    comboHesapCevre: TComboBox;
    listCevre: TListBoxItem;
    listAlan: TListBoxItem;
    Label13: TLabel;
    Layout18: TLayout;
    Layout19: TLayout;
    Layout20: TLayout;
    Layout21: TLayout;
    lblKenar1: TLabel;
    editKenar1: TEdit;
    editKenar2: TEdit;
    lblKenar2: TLabel;
    Layout22: TLayout;
    lblKenar3: TLabel;
    editKenar3: TEdit;
    Layout23: TLayout;
    editKenar4: TEdit;
    lblKenar4: TLabel;
    Layout24: TLayout;
    Label18: TLabel;
    Panel1: TPanel;
    lblCevreAlanSonuc: TLabel;
    btnDrawer: TButton;
    Layout25: TLayout;
    procedure editVizeChangeTracking(Sender: TObject);
    procedure editFinalChangeTracking(Sender: TObject);
    procedure editAnaParaChangeTracking(Sender: TObject);
    procedure combotrackVadeG?nChangeTracking(Sender: TObject);
    procedure listboxBankaItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure listboxBankaChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnMultiItemVizeClick(Sender: TObject);
    procedure btnMultiItemFaizClick(Sender: TObject);
    procedure btnMultiItemYasClick(Sender: TObject);
    procedure DateEdit1ClosePicker(Sender: TObject);
    procedure DateEdit1CheckChanged(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure btnMultiItemHacimClick(Sender: TObject);
    procedure editKenar1ChangeTracking(Sender: TObject);
    procedure comboHesapCevreChange(Sender: TObject);

    procedure YasHesapla();
    procedure GirisEfektiOlustur();

  private
    { Private declarations }
  public
    { Public declarations }
    faizOran?: Double;
  end;

var
  Form2: TForm2;
  time: Integer;

implementation

{$R *.fmx}

uses controller;

procedure TForm2.YasHesapla();
begin
  lblYas.Text := ((Date - DateEdit1.Date) / 365).ToString;
end;

procedure TForm2.GirisEfektiOlustur;
begin
  time := time + 1;

  case time of
    0:
      BandedSwirlTransitionEffect1.Strength := 0.9;
    1:
      BandedSwirlTransitionEffect1.Strength := 0.8;
    2:
      BandedSwirlTransitionEffect1.Strength := 0.7;
    3:
      BandedSwirlTransitionEffect1.Strength := 0.6;
    4:
      BandedSwirlTransitionEffect1.Strength := 0.5;
    5:
      BandedSwirlTransitionEffect1.Strength := 0.4;
    6:
      BandedSwirlTransitionEffect1.Strength := 0.3;
    7:
      BandedSwirlTransitionEffect1.Strength := 0.2;
    8:
      BandedSwirlTransitionEffect1.Strength := 0.1;
    9:
      BandedSwirlTransitionEffect1.Strength := 0;

  end;

  if time = 20 then
  begin
    Timer1.Enabled := false;
    TabControl1.ActiveTab := tabVizeFinal;

  end;
end;

procedure TForm2.btnMultiItemFaizClick(Sender: TObject);
begin
  TabControl1.ActiveTab := tabFaiz;
end;

procedure TForm2.btnMultiItemHacimClick(Sender: TObject);
begin
  TabControl1.ActiveTab := tabHacim;
end;

procedure TForm2.btnMultiItemVizeClick(Sender: TObject);
begin
  TabControl1.ActiveTab := tabVizeFinal;
end;

procedure TForm2.btnMultiItemYasClick(Sender: TObject);
begin
  TabControl1.ActiveTab := tabYas;
end;

/// /

procedure TForm2.comboHesapCevreChange(Sender: TObject);
begin
  if (comboHesapCevre.ItemIndex = 0) and (comboHesapSekil.ItemIndex = 0) then
  begin
    if (editKenar1.Text <> '') and (editKenar2.Text <> '') and
      (editKenar3.Text <> '') and (editKenar4.Text <> '') and
      (comboHesapSekil.ItemIndex <> -1) and (comboHesapCevre.ItemIndex <> -1)
    then
    begin
      lblCevreAlanSonuc.Text :=
        IntToStr(editKenar1.Text.ToInteger + editKenar2.Text.ToInteger +
        editKenar3.Text.ToInteger + editKenar4.Text.ToInteger);
    end;
  end
  else if (comboHesapCevre.ItemIndex = 1) and (comboHesapSekil.ItemIndex = 1)
  then
  begin
    if (editKenar1.Text <> '') and (editKenar2.Text <> '') and
      (editKenar3.Text <> '') and (editKenar4.Text <> '') and
      (comboHesapSekil.ItemIndex <> -1) and (comboHesapCevre.ItemIndex <> -1)
    then
    begin
      editKenar3.Visible := false;
      editKenar4.Visible := false;
      lblKenar3.Visible := false;
      lblKenar4.Visible := false;

      lblKenar1.Text := 'Taban Uzunlu?u :';
      lblKenar2.Text := 'Y?kseklik :';
    end;

  end;

end;

// Net kazanca faizi hesaplay?p yazd?ran prosed?r

procedure TForm2.combotrackVadeG?nChangeTracking(Sender: TObject);
begin

  if editAnaPara.Text <> '' then
  begin
    lblNetKazanc.Text := FaizHesapla(editAnaPara.Text.ToInteger, faizOran?,
      combotrackVadeG?n.Text.ToInteger).ToString;
  end;
end;

procedure TForm2.DateEdit1Change(Sender: TObject);
begin
  YasHesapla();
end;

procedure TForm2.DateEdit1CheckChanged(Sender: TObject);
begin
  YasHesapla();
end;

procedure TForm2.DateEdit1ClosePicker(Sender: TObject);
begin
  YasHesapla();
  // lblYas.Text := ((Date - DateEdit1.Date) / 365).ToString;
end;

procedure TForm2.editKenar1ChangeTracking(Sender: TObject);
begin
  if (comboHesapCevre.ItemIndex = 0) and (comboHesapSekil.ItemIndex = 0) then
  begin
    if (editKenar1.Text <> '') and (editKenar2.Text <> '') and
      (editKenar3.Text <> '') and (editKenar4.Text <> '') and
      (comboHesapSekil.ItemIndex <> -1) and (comboHesapCevre.ItemIndex <> -1)
    then
    begin
      lblCevreAlanSonuc.Text :=
        IntToStr(editKenar1.Text.ToInteger + editKenar2.Text.ToInteger +
        editKenar3.Text.ToInteger + editKenar4.Text.ToInteger);
    end;
  end;
end;

procedure TForm2.editAnaParaChangeTracking(Sender: TObject);
begin

  if editAnaPara.Text <> '' then
  begin
    lblNetKazanc.Text := FaizHesapla(editAnaPara.Text.ToInteger, faizOran?,
      combotrackVadeG?n.Text.ToInteger).ToString;
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
  // banka se?imine g?re faiz oran?n? g?ncelliyor
  if listitemAkbank.IsSelected then
  begin
    faizOran? := FaizOran?Y?zdesi('Akbank');
  end
  else if listitemCeptetep.IsSelected then
  begin
    faizOran? := FaizOran?Y?zdesi('Ceptetep');
  end
  else if listitemOdeabank.IsSelected then
  begin
    faizOran? := FaizOran?Y?zdesi('Odeabank');
  end
  else if listitemYap?Kredi.IsSelected then
  begin
    faizOran? := FaizOran?Y?zdesi('Yap?kredi');
  end;

  if editAnaPara.Text <> '' then
  begin
    lblNetKazanc.Text := FaizHesapla(editAnaPara.Text.ToInteger, faizOran?,
      combotrackVadeG?n.Text.ToInteger).ToString;
  end;
end;

procedure TForm2.listboxBankaItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  if listitemAkbank.IsSelected then
  begin
    faizOran? := FaizOran?Y?zdesi('Akbank');
  end
  else if listitemCeptetep.IsSelected then
  begin
    faizOran? := FaizOran?Y?zdesi('Ceptetep');
  end
  else if listitemOdeabank.IsSelected then
  begin
    faizOran? := FaizOran?Y?zdesi('Odeabank');
  end
  else if listitemYap?Kredi.IsSelected then
  begin
    faizOran? := FaizOran?Y?zdesi('Yap?kredi');
  end;

  if editAnaPara.Text <> '' then
  begin
    lblNetKazanc.Text := FaizHesapla(editAnaPara.Text.ToInteger, faizOran?,
      combotrackVadeG?n.Text.ToInteger).ToString;
  end;
end;

// efekt i?in alan

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  GirisEfektiOlustur();
end;

end.
