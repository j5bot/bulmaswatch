#!/bin/bash

rm -rf attribute-selectors
mkdir -p attribute-selectors

find . -type f -not -path "*node_modules*" | grep bulmaswatch.scss$ -i | sed -e 's|./||' -e 's|bulmaswatch.scss||' | xargs -I '{}' cp -R '{}' attribute-selectors/'{}'

cp -R assets attribute-selectors/

pushd attribute-selectors/

for SOURCE in .
do

  pushd $SOURCE

  ls
  rm */*.css
  rm */*.css.map

  grep -r '^\s*\.' -l --null . | xargs -0 sed -i 's#\.\([a-z][^\:,. )]*\)#[data-am-bulma~="\1"]#g'
  grep -r '^\s*&\.' -l --null . | xargs -0 sed -i 's#\.\([a-z][^\:,. )]*\)#[data-am-bulma~="\1"]#g'

  grep -r '\[data-am-bulma~="sass""\]' -l --null . | xargs -0 sed -i 's#\[data-am-bulma~="sass""\]#.sass"#g'

  grep -r 'url(' -l --null . | xargs -0 sed -i 's#url(\([^\[]*\)\[data-am-bulma~="\([^"]*\)"\]\[data-am-bulma~="\([^"]*\)"\]#url(\1.\2.\3#g'

  # grep -r 'url(' -l --null . | xargs -0 echo

  cp -R * ../

  popd

done

popd

npm run build

# cp src/bulma.sass src/bulma-attribute-selectors.sass

# sed -i 's#sass/#sass-attribute-selectors/#g' src/bulma-attribute-selectors.sass

# echo '/* @import "bulma.sass" */' >> src/bulma-attribute-selectors.sass

# mkdir -p logs
# echo 'Recreated bulma-attribute-selectors.sass at: ' $(date) >> logs/bulma-attribute-selectors.log

# mkdir -p dist/bulma/css
# mkdir -p dist/bulma-attribute-selectors/css
