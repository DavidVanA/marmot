# The Marmot

The Marmot is a 16-bit pipelined processor, characterised by its 1kB RAM and ROM, alongside a 5-stage pipelined architecture that includes forwarding logic.

![image](https://github.com/user-attachments/assets/ad8b8de7-a361-448a-87a8-82cfe5fad6d9)


## Using the `assembler.py`
```
assembler.py -D 2048 -o example ./example.asm
```

The `-D 2028` is needed to avoid address out of range errors

### Gotchas
1. Be sure to remove the `.CODE` directives from the provided `.asm` programs.
2. Check that the `.org x810`  many of the provided test programs are for `x410`.
