all: samples index.html

sample:
	mkdir sample

sample/content: sample
	cd sample; ln -s ../content

samples: sample
	@i=0; for line in `find src -name example.js |nl -s '":"'`; do \
		let i=$${i}+1;\
		echo {\"data\":{\"$${line}\"}} \
		|jinja2 src/main.js.tpl > src/main-$${i}.js; \
		echo {\"data\":$${i}} \
		|jinja2 sample.html.tpl > sample/$${i}.html; \
	done

data.yaml:
	echo "data:" > $@
	find src -name example.js|sed "s/^\.\///" |nl -n rz -s ": " |sed "s/^0*/  /" >> $@

data.json: data.yaml
	cat $< |python -c "import json,yaml,sys; print(json.dumps(yaml.load(sys.stdin.read())))" > $@

index.html: index.html.tpl data.json
	jinja2 index.html.tpl data.json > index.html

clean:
	rm -rf sample
	rm -f data.yaml data.json src/main-*.js

.PHONY: sample
