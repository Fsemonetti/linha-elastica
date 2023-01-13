unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    PaintBox1: TPaintBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Click(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private

  public

  end;

var
  Form1: TForm1;
  pts : array[0..5] of tpoint;
  indice,line : integer;
  first_point : boolean;
  anterior,proximo : tpoint;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
        indice:=0;
        first_point:=false;
end;

procedure TForm1.PaintBox1Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin

            paintbox1.canvas.pen.color:=clwhite;
  paintbox1.Canvas.moveto(0,0);
  paintbox1.canvas.lineto(100,100);



end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   paintbox1.canvas.pen.mode:=pmxor;
   paintbox1.canvas.pen.color:=clwhite;
  paintbox1.Canvas.moveto(0,0);
  paintbox1.canvas.lineto(100,100);
end;

procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button =mbleft then
  begin
    paintbox1.canvas.pen.mode:=pmxor;
    paintbox1.canvas.pen.color:=clwhite;
    pts[indice]:=point(X,Y);
    first_point:=true;
    paintbox1.Canvas.MoveTo(x,y);
    anterior:=point(x,y);
  end;

end;

procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if first_point=true then
   begin
    paintbox1.Canvas.MoveTo(anterior);
    paintbox1.Canvas.lineto(proximo);
    paintbox1.Canvas.MoveTo(anterior);
    paintbox1.Canvas.lineTo(x,y);
  end;

proximo:=point(x,y);
end;

end.

