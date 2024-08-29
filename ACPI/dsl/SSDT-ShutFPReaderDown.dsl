// Inject _STA method to shutdown fingerprint reader device
DefinitionBlock("", "SSDT", 2, "hack", "FPR-D", 0)
{	
	// Path of BIOS device
    External(_SB.PCI0.XHC.RHUB.HS05, DeviceObj) 
	
    Method(_SB.PCI0.XHC.RHUB.HS05._STA, 0, NotSerialized) // _DSM: Device-Specific Method
    {
                    If (!_OSI ("Darwin"))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }	        
    }
}
//EOF