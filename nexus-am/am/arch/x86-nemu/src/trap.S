#----|-------entry-------|-errorcode-|---irq id---|---handler---|
.globl vecsys;    vecsys:  pushl $0;  pushl $0x80; jmp asm_trap
.globl vecnull;  vecnull:  pushl $0;  pushl   $-1; jmp asm_trap
.globl vectrap;  vectrap:  pushl $0;  pushl $0x81; jmp asm_trap
.globl vectime;  vectime:  pushl $0;  pushl $0x32; jmp asm_trap

asm_trap:
  pushal

  pushl %esp
  call irq_handle

  # addl $4, %esp
  movl %eax, %esp

  popal
  addl $8, %esp

  iret
