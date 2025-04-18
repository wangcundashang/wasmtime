;;! target = "x86_64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -O static-memory-maximum-size=0 -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store offset=0xffff0000)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load offset=0xffff0000))

;; wasm[0]::function[0]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movl    %edx, %r10d
;;       movq    %r10, %rax
;;       addq    0x2f(%rip), %rax
;;       jb      0x3a
;;   17: movq    0x48(%rdi), %r8
;;       xorq    %rdx, %rdx
;;       addq    0x40(%rdi), %r10
;;       movl    $0xffff0000, %r9d
;;       addq    %r10, %r9
;;       cmpq    %r8, %rax
;;       cmovaq  %rdx, %r9
;;       movl    %ecx, (%r9)
;;       movq    %rbp, %rsp
;;       popq    %rbp
;;       retq
;;   3a: ud2
;;   3c: addb    %al, (%rax)
;;   3e: addb    %al, (%rax)
;;   40: addb    $0, %al
;;
;; wasm[0]::function[1]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movl    %edx, %r10d
;;       movq    %r10, %rax
;;       addq    0x2f(%rip), %rax
;;       jb      0x9a
;;   77: movq    0x48(%rdi), %rdx
;;       xorq    %rcx, %rcx
;;       addq    0x40(%rdi), %r10
;;       movl    $0xffff0000, %r8d
;;       addq    %r10, %r8
;;       cmpq    %rdx, %rax
;;       cmovaq  %rcx, %r8
;;       movl    (%r8), %eax
;;       movq    %rbp, %rsp
;;       popq    %rbp
;;       retq
;;   9a: ud2
;;   9c: addb    %al, (%rax)
;;   9e: addb    %al, (%rax)
;;   a0: addb    $0, %al
