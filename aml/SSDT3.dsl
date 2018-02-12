/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180105 (64-bit version)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of /tmp/fwts_tmp_table_25591_SSDT_12.dsl, Sun Feb 11 23:54:19 2018
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000AEE (2798)
 *     Revision         0x02
 *     Checksum         0x4D
 *     OEM ID           "INTEL "
 *     OEM Table ID     "Ther_Rvp"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160422 (538313762)
 */
DefinitionBlock ("", "SSDT", 2, "INTEL ", "Ther_Rvp", 0x00001000)
{
    External (_PR_.AAC0, UnknownObj)
    External (_PR_.ACRT, UnknownObj)
    External (_PR_.APSV, UnknownObj)
    External (_PR_.DTS1, UnknownObj)
    External (_PR_.DTS2, UnknownObj)
    External (_PR_.DTS3, UnknownObj)
    External (_PR_.DTS4, UnknownObj)
    External (_PR_.DTSE, UnknownObj)
    External (_PR_.PDTS, UnknownObj)
    External (_PR_.PKGA, UnknownObj)
    External (_PR_.PR00, UnknownObj)
    External (_PR_.PR01, UnknownObj)
    External (_PR_.PR02, UnknownObj)
    External (_PR_.PR03, UnknownObj)
    External (_PR_.PR04, UnknownObj)
    External (_PR_.PR05, UnknownObj)
    External (_PR_.PR06, UnknownObj)
    External (_PR_.PR07, UnknownObj)
    External (_PR_.PR08, UnknownObj)
    External (_PR_.PR09, UnknownObj)
    External (_PR_.PR10, UnknownObj)
    External (_PR_.PR11, UnknownObj)
    External (_PR_.PR12, UnknownObj)
    External (_PR_.PR13, UnknownObj)
    External (_PR_.PR14, UnknownObj)
    External (_PR_.PR15, UnknownObj)
    External (_SB_.PCI0.LPCB.EC0_.CTMP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.ECFL, FieldUnitObj)
    External (AC0F, IntObj)
    External (AC1F, IntObj)
    External (ACT1, IntObj)
    External (ACTT, IntObj)
    External (CRTT, IntObj)
    External (CTYP, IntObj)
    External (PSVT, IntObj)
    External (TC1V, IntObj)
    External (TC2V, IntObj)
    External (TCNT, IntObj)
    External (TSPV, IntObj)
    External (VFN0, IntObj)
    External (VFN1, IntObj)
    External (VFN2, IntObj)
    External (VFN3, IntObj)
    External (VFN4, IntObj)

    Scope (\_TZ)
    {
        Name (ETMD, One)
        Event (FCET)
        Name (FCRN, Zero)
        Mutex (FCMT, 0x00)
        Name (CVF0, Zero)
        Name (CVF1, Zero)
        Name (CVF2, Zero)
        Name (CVF3, Zero)
        Name (CVF4, Zero)
        Mutex (FMT0, 0x00)
        Mutex (FMT1, 0x00)
        Mutex (FMT2, 0x00)
        Mutex (FMT3, 0x00)
        Mutex (FMT4, 0x00)
        ThermalZone (TZ00)
        {
            Name (PTMP, 0x0BB8)
            Method (_SCP, 1, Serialized)  // _SCP: Set Cooling Policy
            {
                Store (Arg0, \CTYP) /* External reference */
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                If (CondRefOf (\_PR.ACRT))
                {
                    If (LNotEqual (\_PR.ACRT, Zero))
                    {
                        Return (Add (0x0AAC, Multiply (\_PR.ACRT, 0x0A)))
                    }
                }

                Return (Add (0x0AAC, Multiply (\CRTT, 0x0A)))
            }

            Method (_AC0, 0, Serialized)  // _ACx: Active Cooling
            {
                If (CondRefOf (\_PR.AAC0))
                {
                    If (LNotEqual (\_PR.AAC0, Zero))
                    {
                        Return (Add (0x0AAC, Multiply (\_PR.AAC0, 0x0A)))
                    }
                }

                Return (Add (0x0AAC, Multiply (\ACTT, 0x0A)))
            }

            Method (_AC1, 0, Serialized)  // _ACx: Active Cooling
            {
                Return (Add (0x0AAC, Multiply (\ACT1, 0x0A)))
            }

            Method (_AC2, 0, Serialized)  // _ACx: Active Cooling
            {
                Return (Subtract (Add (0x0AAC, Multiply (\ACT1, 0x0A)), 0x32))
            }

            Method (_AC3, 0, Serialized)  // _ACx: Active Cooling
            {
                Return (Subtract (Add (0x0AAC, Multiply (\ACT1, 0x0A)), 0x64))
            }

            Method (_AC4, 0, Serialized)  // _ACx: Active Cooling
            {
                Return (Subtract (Add (0x0AAC, Multiply (\ACT1, 0x0A)), 0x96))
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (LNot (ETMD))
                {
                    Return (0x0BB8)
                }

                If (CondRefOf (\_PR.DTSE))
                {
                    If (LEqual (\_PR.DTSE, 0x03))
                    {
                        Return (Add (0x0B10, Multiply (\CRTT, 0x0A)))
                    }
                }

                If (CondRefOf (\_PR.DTSE))
                {
                    If (LEqual (\_PR.DTSE, One))
                    {
                        If (LEqual (\_PR.PKGA, One))
                        {
                            Store (\_PR.PDTS, Local0)
                            Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
                        }

                        Store (\_PR.DTS1, Local0)
                        If (LGreater (\_PR.DTS2, Local0))
                        {
                            Store (\_PR.DTS2, Local0)
                        }

                        If (LGreater (\_PR.DTS3, Local0))
                        {
                            Store (\_PR.DTS3, Local0)
                        }

                        If (LGreater (\_PR.DTS4, Local0))
                        {
                            Store (\_PR.DTS4, Local0)
                        }

                        Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
                    }
                }

                If (\_SB.PCI0.LPCB.EC0.ECFL)
                {
                    Add (0x0AAC, Multiply (\_SB.PCI0.LPCB.EC0.CTMP, 0x0A), Local0)
                    Return (Local0)
                }

                Return (0x0BC2)
            }
        }

        ThermalZone (TZ01)
        {
            Name (PTMP, 0x0BB8)
            Method (_SCP, 1, Serialized)  // _SCP: Set Cooling Policy
            {
                Store (Arg0, \CTYP) /* External reference */
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                If (CondRefOf (\_PR.ACRT))
                {
                    If (LNotEqual (\_PR.ACRT, Zero))
                    {
                        Return (Add (0x0AAC, Multiply (\_PR.ACRT, 0x0A)))
                    }
                }

                Return (Add (0x0AAC, Multiply (\CRTT, 0x0A)))
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (LNot (ETMD))
                {
                    Return (0x0BCC)
                }

                If (CondRefOf (\_PR.DTSE))
                {
                    If (LEqual (\_PR.DTSE, 0x03))
                    {
                        Return (Add (0x0B10, Multiply (\CRTT, 0x0A)))
                    }
                }

                If (CondRefOf (\_PR.DTSE))
                {
                    If (LEqual (\_PR.DTSE, One))
                    {
                        If (LEqual (\_PR.PKGA, One))
                        {
                            Store (\_PR.PDTS, Local0)
                            Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
                        }

                        Store (\_PR.DTS1, Local0)
                        If (LGreater (\_PR.DTS2, Local0))
                        {
                            Store (\_PR.DTS2, Local0)
                        }

                        If (LGreater (\_PR.DTS3, Local0))
                        {
                            Store (\_PR.DTS3, Local0)
                        }

                        If (LGreater (\_PR.DTS4, Local0))
                        {
                            Store (\_PR.DTS4, Local0)
                        }

                        Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
                    }
                }

                If (\_SB.PCI0.LPCB.EC0.ECFL)
                {
                    Add (0x0AAC, Multiply (\_SB.PCI0.LPCB.EC0.CTMP, 0x0A), Local0)
                    Return (Local0)
                }

                Return (0x0BD6)
            }

            Method (XPSL, 0, Serialized)
            {
                If (LEqual (\TCNT, 0x10))
                {
                    Return (Package (0x10)
                    {
                        \_PR.PR00, 
                        \_PR.PR01, 
                        \_PR.PR02, 
                        \_PR.PR03, 
                        \_PR.PR04, 
                        \_PR.PR05, 
                        \_PR.PR06, 
                        \_PR.PR07, 
                        \_PR.PR08, 
                        \_PR.PR09, 
                        \_PR.PR10, 
                        \_PR.PR11, 
                        \_PR.PR12, 
                        \_PR.PR13, 
                        \_PR.PR14, 
                        \_PR.PR15
                    })
                }

                If (LEqual (\TCNT, 0x0E))
                {
                    Return (Package (0x0E)
                    {
                        \_PR.PR00, 
                        \_PR.PR01, 
                        \_PR.PR02, 
                        \_PR.PR03, 
                        \_PR.PR04, 
                        \_PR.PR05, 
                        \_PR.PR06, 
                        \_PR.PR07, 
                        \_PR.PR08, 
                        \_PR.PR09, 
                        \_PR.PR10, 
                        \_PR.PR11, 
                        \_PR.PR12, 
                        \_PR.PR13
                    })
                }

                If (LEqual (\TCNT, 0x0C))
                {
                    Return (Package (0x0C)
                    {
                        \_PR.PR00, 
                        \_PR.PR01, 
                        \_PR.PR02, 
                        \_PR.PR03, 
                        \_PR.PR04, 
                        \_PR.PR05, 
                        \_PR.PR06, 
                        \_PR.PR07, 
                        \_PR.PR08, 
                        \_PR.PR09, 
                        \_PR.PR10, 
                        \_PR.PR11
                    })
                }

                If (LEqual (\TCNT, 0x0A))
                {
                    Return (Package (0x0A)
                    {
                        \_PR.PR00, 
                        \_PR.PR01, 
                        \_PR.PR02, 
                        \_PR.PR03, 
                        \_PR.PR04, 
                        \_PR.PR05, 
                        \_PR.PR06, 
                        \_PR.PR07, 
                        \_PR.PR08, 
                        \_PR.PR09
                    })
                }

                If (LEqual (\TCNT, 0x08))
                {
                    Return (Package (0x08)
                    {
                        \_PR.PR00, 
                        \_PR.PR01, 
                        \_PR.PR02, 
                        \_PR.PR03, 
                        \_PR.PR04, 
                        \_PR.PR05, 
                        \_PR.PR06, 
                        \_PR.PR07
                    })
                }

                If (LEqual (\TCNT, 0x07))
                {
                    Return (Package (0x07)
                    {
                        \_PR.PR00, 
                        \_PR.PR01, 
                        \_PR.PR02, 
                        \_PR.PR03, 
                        \_PR.PR04, 
                        \_PR.PR05, 
                        \_PR.PR06
                    })
                }

                If (LEqual (\TCNT, 0x06))
                {
                    Return (Package (0x06)
                    {
                        \_PR.PR00, 
                        \_PR.PR01, 
                        \_PR.PR02, 
                        \_PR.PR03, 
                        \_PR.PR04, 
                        \_PR.PR05
                    })
                }

                If (LEqual (\TCNT, 0x05))
                {
                    Return (Package (0x05)
                    {
                        \_PR.PR00, 
                        \_PR.PR01, 
                        \_PR.PR02, 
                        \_PR.PR03, 
                        \_PR.PR04
                    })
                }

                If (LEqual (\TCNT, 0x04))
                {
                    Return (Package (0x04)
                    {
                        \_PR.PR00, 
                        \_PR.PR01, 
                        \_PR.PR02, 
                        \_PR.PR03
                    })
                }

                If (LEqual (\TCNT, 0x03))
                {
                    Return (Package (0x03)
                    {
                        \_PR.PR00, 
                        \_PR.PR01, 
                        \_PR.PR02
                    })
                }

                If (LEqual (\TCNT, 0x02))
                {
                    Return (Package (0x02)
                    {
                        \_PR.PR00, 
                        \_PR.PR01
                    })
                }

                Return (Package (0x01)
                {
                    \_PR.PR00
                })
            }

            Method (XPSV, 0, Serialized)
            {
                If (CondRefOf (\_PR.APSV))
                {
                    If (LNotEqual (\_PR.APSV, Zero))
                    {
                        Return (Add (0x0AAC, Multiply (\_PR.APSV, 0x0A)))
                    }
                }

                Return (Add (0x0AAC, Multiply (\PSVT, 0x0A)))
            }

            Method (XTC1, 0, Serialized)
            {
                Return (\TC1V) /* External reference */
            }

            Method (XTC2, 0, Serialized)
            {
                Return (\TC2V) /* External reference */
            }

            Method (XTSP, 0, Serialized)
            {
                Return (\TSPV) /* External reference */
            }
        }
    }
}

