{ ****************************************************************************** }
{ * memory Rasterization with AGG support                                      * }
{ * by QQ 600585@qq.com                                                        * }
{ ****************************************************************************** }
{ * https://github.com/PassByYou888/CoreCipher                                 * }
{ * https://github.com/PassByYou888/ZServer4D                                  * }
{ * https://github.com/PassByYou888/zExpression                                * }
{ * https://github.com/PassByYou888/zTranslate                                 * }
{ * https://github.com/PassByYou888/zSound                                     * }
{ * https://github.com/PassByYou888/zAnalysis                                  * }
{ * https://github.com/PassByYou888/zGameWare                                  * }
{ * https://github.com/PassByYou888/zRasterization                             * }
{ ****************************************************************************** }

(*
  ////////////////////////////////////////////////////////////////////////////////
  //                                                                            //
  //  Anti-Grain Geometry (modernized Pascal fork, aka 'AggPasMod')             //
  //    Maintained by Christian-W. Budde (Christian@pcjv.de)                    //
  //    Copyright (c) 2012-2017                                                 //
  //                                                                            //
  //  Based on:                                                                 //
  //    Pascal port by Milan Marusinec alias Milano (milan@marusinec.sk)        //
  //    Copyright (c) 2005-2006, see http://www.aggpas.org                      //
  //                                                                            //
  //  Original License:                                                         //
  //    Anti-Grain Geometry - Version 2.4 (Public License)                      //
  //    Copyright (C) 2002-2005 Maxim Shemanarev (http://www.antigrain.com)     //
  //    Contact: McSeem@antigrain.com / McSeemAgg@yahoo.com                     //
  //                                                                            //
  //  Permission to copy, use, modify, sell and distribute this software        //
  //  is granted provided this copyright notice appears in all copies.          //
  //  This software is provided "as is" without express or implied              //
  //  warranty, and with no claim as to its suitability for any purpose.        //
  //                                                                            //
  ////////////////////////////////////////////////////////////////////////////////
*)
unit AggConvClipPolygon;

interface

{$I AggCompiler.inc}


uses
  AggBasics,
  AggConvAdaptorVpgen,
  AggVpGenClipPolygon,
  AggVertexSource;

type
  TAggConvClipPolygon = class(TAggConvAdaptorVpgen)
  private
    FGenerator: TAggVpgenClipPolygon;
    function GetX1: Double;
    function GetY1: Double;
    function GetX2: Double;
    function GetY2: Double;
  public
    constructor Create(Vs: TAggVertexSource);
    destructor Destroy; override;

    procedure SetClipBox(X1, Y1, X2, Y2: Double);

    property X1: Double read GetX1;
    property Y1: Double read GetY1;
    property X2: Double read GetX2;
    property Y2: Double read GetY2;
  end;

implementation


{ TAggConvClipPolygon }

constructor TAggConvClipPolygon.Create;
begin
  FGenerator := TAggVpgenClipPolygon.Create;

  inherited Create(Vs, FGenerator);
end;

destructor TAggConvClipPolygon.Destroy;
begin
  FGenerator.Free;
  inherited;
end;

procedure TAggConvClipPolygon.SetClipBox(X1, Y1, X2, Y2: Double);
begin
  TAggVpgenClipPolygon(Vpgen).SetClipBox(X1, Y1, X2, Y2);
end;

function TAggConvClipPolygon.GetX1: Double;
begin
  Result := TAggVpgenClipPolygon(Vpgen).X1;
end;

function TAggConvClipPolygon.GetY1: Double;
begin
  Result := TAggVpgenClipPolygon(Vpgen).Y1;
end;

function TAggConvClipPolygon.GetX2: Double;
begin
  Result := TAggVpgenClipPolygon(Vpgen).X2;
end;

function TAggConvClipPolygon.GetY2: Double;
begin
  Result := TAggVpgenClipPolygon(Vpgen).Y2;
end;

end.
