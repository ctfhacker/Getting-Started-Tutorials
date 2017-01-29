ENTRY(_Kernel_Start)

SECTIONS {
	. = 0x100000;

	.text : {
		*(.text);
	}
}
