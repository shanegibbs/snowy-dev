# snowy-lang-dev

Docker container for snowy-lang development.

See https://github.com/shanegibbs/snowy-lang

### Local Builds

```
git clone git@github.com:shanegibbs/snowy-lang-dev.git && cd snowy-lang-dev
sudo docker build --tag shanegibbs/snowy-dev:dev .
```

### TODO

* Update shanegibbs-dots
* Add format bin ln
* Add cpp target to llvm (already put in). So we can run `llc -O0 -march=cpp fromc.bc -o api.cpp`
* Compile shared object for llvm libs
