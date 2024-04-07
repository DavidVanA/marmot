# The Marmot

## Using the `assembler.py`
```
assembler.py -D 2048 -o example ./example.asm
```

The `-D 2028` is needed to avoid address out of range errors

### Gotchas
1. Be sure to remove the `.CODE` directives from the provided `.asm` programs.
2. Check that the `.org x810`  many of the provided test programs are for `x410`.
