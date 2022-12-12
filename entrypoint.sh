#!/bin/sh

if [ ! -d ${LOGSEQ_SRC}/${LOGSEQ_DEST} ]; then mkdir -p ${LOGSEQ_SRC}/${LOGSEQ_DEST}; fi
touch ${LOGSEQ_SRC}/${LOGSEQ_DEST}/.nojekyll

# executing like "xvfb-run node publish.mjs -p graph -o www -t true --theme light"
xvfb-run node publish.mjs -p ${LOGSEQ_SRC} \
    -o ${LOGSEQ_SRC}/${LOGSEQ_DEST} -t ${LOGSEQ_IS_TRACE} --theme ${LOGSEQ_THEME}

replacement='<head><script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-3247793043228755" crossorigin="anonymous"></script>'
sed -i --expression "s@<head>@$replacement@" ${LOGSEQ_SRC}/${LOGSEQ_DEST}/index.html