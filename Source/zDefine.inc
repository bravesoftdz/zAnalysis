{ * https://github.com/PassByYou888/CoreCipher                                 * }
{ * https://github.com/PassByYou888/ZServer4D                                  * }
{ * https://github.com/PassByYou888/zExpression                                * }
{ * https://github.com/PassByYou888/zTranslate                                 * }
{ * https://github.com/PassByYou888/zSound                                     * }
{ * https://github.com/PassByYou888/zAnalysis                                  * }
{ * https://github.com/PassByYou888/zGameWare                                  * }
{ * https://github.com/PassByYou888/zRasterization                             * }
{ ****************************************************************************** }
{$IFDEF FPC}
  {$MODE objfpc}
  {$MODESWITCH AdvancedRecords}
  {$STACKFRAMES ON}
  {$NOTES OFF}
  {$ASMMODE intel}
  {$IFDEF FPC_BIG_ENDIAN}
    {$DEFINE BIG_ENDIAN}
  {$ENDIF}

  {$UNDEF FirstCharInZero}

  {$UNDEF Delphi}
  {$UNDEF FastMD5}
  {$DEFINE parallel}
  {$DEFINE OptimizationMemoryStreamMD5}
  {$DEFINE CriticalSimulateAtomic}
{$ELSE}
  {$IFDEF ANDROID}
    {$DEFINE FirstCharInZero}
  {$ENDIF}

  {$IFDEF IOS}
    {$DEFINE FirstCharInZero}
  {$ENDIF}

  {$DEFINE Delphi}
  {$DEFINE FastMD5}
  {$DEFINE parallel}
  {$DEFINE OptimizationMemoryStreamMD5}

  // used Critical Simulate Atomic with TMonitor.Enter(obj) and TMonitor.Exit(obj)
  // if CriticalSimulateAtomic defined so performance to be reduced
  // {$DEFINE CriticalSimulateAtomic}

  {$IFDEF Linux}
    {$DEFINE CriticalSimulateAtomic}
  {$ENDIF}


{$ENDIF}

{$WARNINGS OFF}
{$HINTS OFF}
{$H+} { long string }
{$A+} { Word Align Data }
{$R-} { range check }
{$O-} { optimization }
{$Q-} { Overflow checking }
{$B-} { Complete boolean evaluation }
{$I+} { Input output checking }

(*
  {$IFDEF FPC}
  {$ELSE FPC}
  {$ENDIF FPC}

  {$IFDEF FPC}
  {$ENDIF FPC}

  {$IFDEF FPC}@{$ENDIF FPC}

  {$IFNDEF FPC}
  {$ENDIF FPC}

  {$IFDEF parallel}
  {$ELSE parallel}
  {$ENDIF parallel}

  {$IFNDEF parallel}
  {$ENDIF parallel}

  {$Region 'RegionName'}
  {$EndRegion 'RegionName'}
*)

{$IFDEF release}
  {$DEFINE INLINE_ASM}
{$ELSE}
  {$UNDEF INLINE_ASM}
{$ENDIF}

{$UNDEF CPU64}

{$IFDEF CPU64BITS}
  {$DEFINE CPU64}
{$ELSE}
  {$IFDEF CPUX64}
    {$DEFINE CPU64}
  {$ENDIF}
{$ENDIF}

{$IFNDEF CPU64}
  {$DEFINE CPU32}
{$ENDIF}

