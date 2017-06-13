#!/bin/bash

# grep -r 'class="fa ' -l --null **/*.html | xargs -0

grep -r 'class="icon"' -l --null **/*.html | xargs -0 sed -i 's#class="icon"#clazz="icon"#g'
grep -r 'class="fa ' -l --null **/*.html | xargs -0 sed -i 's#class="fa #clazz="fa #g'

grep -r 'class="' -l --null **/*.html | xargs -0 sed -i 's#class="\([^"]*\)"#data-am-bulma="\1"#g'

grep -r 'clazz="icon"' -l --null **/*.html | xargs -0 sed -i 's#clazz="icon"#class="icon"#g'
grep -r 'clazz="fa ' -l --null **/*.html | xargs -0 sed -i 's#clazz="fa #class="fa #g'

# npm run build

# cp src/bulma.sass src/bulma-attribute-selectors.sass

# sed -i 's#sass/#sass-attribute-selectors/#g' src/bulma-attribute-selectors.sass

# echo '/* @import "bulma.sass" */' >> src/bulma-attribute-selectors.sass

# mkdir -p logs
# echo 'Recreated bulma-attribute-selectors.sass at: ' $(date) >> logs/bulma-attribute-selectors.log

# mkdir -p dist/bulma/css
# mkdir -p dist/bulma-attribute-selectors/css
