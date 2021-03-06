#!/bin/sh
find . -name '*.py' \
-o -name '*.groovy' \
-o -name '*.java' \
-o -name '*.kt' \
-o -iname '*.[CH]' \
-o -name '*.cpp' \
-o -name '*.cc' \
-o -name '*.hpp'  \
-o -name '*.h' \
> cscope.files

# -b: just build
# -q: create inverted index
cscope -b -q
